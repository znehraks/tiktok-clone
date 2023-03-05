import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  final bool hovered;
  final bool inverted;
  const PostVideoButton(
      {super.key, required this.hovered, required this.inverted});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Container(
              height: 30,
              width: 25,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: hovered
                    ? Colors.blue
                    : const Color(
                        0xff61d4f0,
                      ),
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Positioned(
            left: 20,
            child: Container(
              height: 30,
              width: 25,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: hovered ? Colors.red : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            decoration: BoxDecoration(
              color: inverted ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: inverted ? Colors.white : Colors.black,
                size: Sizes.size18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
