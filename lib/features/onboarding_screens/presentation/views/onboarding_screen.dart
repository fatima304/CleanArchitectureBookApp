import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/features/onboarding_screens/presentation/views/widgets/onboarding_buttons.dart';
import 'package:clean_bookly_app/features/onboarding_screens/presentation/views/widgets/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class OnBoarding extends StatelessWidget {
  final PageController _pageController = PageController();

  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoard(
        pageController: _pageController,
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: kPrimaryColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        descriptionStyles: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Color.fromARGB(255, 19, 28, 152),
          activeColor: Color(0xff0c136b),
          inactiveSize: Size(4, 4),
          activeSize: Size(8, 8),
        ),
        skipButton: const SkipButton(),
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state.isLastPage ? const DoneButton() : const NextButton()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {}
  }
}
