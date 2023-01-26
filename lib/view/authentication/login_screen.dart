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
import 'package:nscc_app/widgets/login_widgets.dart';

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
                      color: AppColors.bgWhite,
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/site.svg',
                            width: width * 0.6,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          myInpField(
                            label: "Email",
                            controller: _username,
                            validate: MyValidators.v_name,
                            keytype: TextInputType.emailAddress,
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
                                // TODO: Login msg
                              } else {
                                // print("failed");
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
                        color: AppColors.bgWhite,
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
                                color: AppColors.lightBlue,
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
