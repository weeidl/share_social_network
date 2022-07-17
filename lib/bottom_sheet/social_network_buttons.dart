import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialNetworkButtons extends StatelessWidget {
  final String name;
  final String image;
  final GestureTapCallback onTap;

  const SocialNetworkButtons(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xFF9D9D9D).withOpacity(0.15),
            ),
            child: SvgPicture.network(
              image,
              fit: BoxFit.none,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
