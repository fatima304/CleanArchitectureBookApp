import 'package:clean_bookly_app/core/utlis/bloc_observer.dart';
import 'package:clean_bookly_app/features/home/domain/repos/home_repo_impl.dart';
import 'package:clean_bookly_app/features/home/data/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:clean_bookly_app/features/home/data/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:clean_bookly_app/features/home/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_bookly_app/features/home/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/core/utlis/app_router.dart';
import 'package:clean_bookly_app/core/utlis/service_locator.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';

void main() async {
  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(
    BookEntityAdapter(),
  );
  await Hive.openBox<BookEntity>(kFeaturesBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kRelevenceBox);

  BlocOverrides.runZoned(() {
    runApp(
      const BooklyApp(),
    );
  }, blocObserver: SimpleBlocObserver());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..featuredBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..newestBooks();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
