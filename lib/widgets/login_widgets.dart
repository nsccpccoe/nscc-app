import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/services/auth.dart';

class AuthIcons extends StatelessWidget {
  const AuthIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            // Google Sign In method
            await AuthMethods().signInWithGoogle();
          },
          child: SvgPicture.asset(
            'assets/svg/google.svg',
            width: 40,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            // Github auth
          },
          child: Image.asset(
            "assets/images/github.png",
            width: 40,
          ),
        ),
      ],
    );
  }
}

class OrLine extends StatelessWidget {
  const OrLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Colors.white,
            thickness: 2,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "OR",
              style: MyTextStyles.customStyle(
                fontsize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.white, thickness: 2)),
        ],
      ),
    );
  }
}

class HeadLine extends StatelessWidget {
  const HeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            "assets/images/NSCC.png",
          ),
          width: 75,
          height: 75,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "NSCC PCCOE",
              style: MyTextStyles.poppins700,
              textAlign: TextAlign.left,
            ),
            Text(
              "Newton School Coding Club",
              style: MyTextStyles.poppins500,
            ),
          ],
        ),
      ],
    );
  }
}
