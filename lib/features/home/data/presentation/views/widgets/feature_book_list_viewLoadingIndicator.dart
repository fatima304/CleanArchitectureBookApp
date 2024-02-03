import 'package:clean_bookly_app/core/utlis/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedListViewLoadingInicator extends StatelessWidget {
  const FeaturedListViewLoadingInicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: CustomFadeImage(),
            );
          },
        ),
      ),
    );
  }
}

class CustomFadeImage extends StatelessWidget {
  const CustomFadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        20,
      ),
      child: AspectRatio(
        aspectRatio: 2.3 / 4,
        child: Container(
          decoration: const BoxDecoration(color: Colors.grey),
        ),
      ),
    );
  }
}
