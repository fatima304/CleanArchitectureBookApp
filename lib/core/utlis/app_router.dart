import 'package:clean_bookly_app/core/utlis/service_locator.dart';
import 'package:clean_bookly_app/features/home/data/presentation/manager/relevence_books/relevence_books_cubit.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/book_details_view.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/home_view.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/domain/repos/home_repo_impl.dart';
import 'package:clean_bookly_app/features/home/use_cases/relevence_bboks_use_case.dart';
import 'package:clean_bookly_app/features/onboarding_screens/presentation/views/onboarding_screen.dart';
import 'package:clean_bookly_app/features/search/presentation/views/splash_view.dart';
import 'package:clean_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingScreens = '/onBoardingScreen';

  static const kSearchView = '/searchView';
  static const kBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingScreens,
        builder: (context, state) => OnBoarding(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => RelevenceBooksCubit(
            FetchRelevenceBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          child: BookDetailsView(bookEntity: state.extra as BookEntity),
        ),
      ),
    ],
  );
}
