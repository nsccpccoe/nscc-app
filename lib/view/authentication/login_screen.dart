import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nscc_app/constants/buttons.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/footer.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/constants/validators.dart';
import 'package:nscc_app/router/routes_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            gradient: AppColors.bgGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 35,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffffffff).withOpacity(0.05),
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          HeadLine(),
                          myInpField(
                            label: "Phone number, username, or email",
                            controller: _username,
                            validate: MyValidators.v_name,
                          ),
                          myInpField(
                            label: "Password",
                            controller: _password,
                            validate: MyValidators.v_pass,
                            ispassword: true,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  // TODO: Forgot password Function call
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: MyTextStyles.poppins500,
                                )),
                          ),
                          PrimaryBtn(
                            label: "Login",
                            onpress: () {
                              //  TODO: Login Function call
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Success")));
                              } else {
                                print("fialed");
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          OrLine(),
                          SizedBox(height: 25),

                          // Google and github auth widget
                          AuthIcons(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesNames.signupScreen);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffffffff).withOpacity(0.05),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don't Have an account?, ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign Up',
                              style: TextStyle(
                                color: Color(0xff8DEBFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthIcons extends StatelessWidget {
  const AuthIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Google Sign In method
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
