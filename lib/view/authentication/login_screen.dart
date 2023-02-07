import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/footer.dart';
import 'package:nscc_app/constants/loading.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/constants/validators.dart';
import 'package:nscc_app/controllers/auth_controller.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/services/auth.dart';
import 'package:nscc_app/widgets/custom_snackbar.dart';
import 'package:nscc_app/widgets/gradient_button.dart';
import 'package:nscc_app/widgets/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // final authController = Get.find<AuthController>();

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
            horizontal: 16.h,
          ),
          decoration: BoxDecoration(
            gradient: AppColors.bgGradient,
          ),
          child: GetBuilder<AuthController>(
            builder: (controller) => controller.isLoading.value
                ? Loadings.basic()
                : Column(
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
                                  // HeadLine(),
                                  SvgPicture.asset(
                                    'assets/svg/site.svg',
                                    width: width * 0.6,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  myInpField(
                                    label: "Email",
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

                                  GradientButton(
                                    onTap: () async {
                                      // TODO : Email password Login
                                      if (_formkey.currentState!.validate()) {
                                        controller.email =
                                            _username.text.toString();
                                        controller.password =
                                            _password.text.toString();
                                        await controller.login(context);
                                      }
                                    },
                                    height: 30.h,
                                    width: 80.w,
                                    text: "Login",
                                    gradient: AppColors.cyanGradient,
                                  ),

                                  SizedBox(height: 20.h),
                                  OrLine(),
                                  SizedBox(height: 25.h),
                                  // Google and github auth widget
                                  AuthIcons(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SignUpWidget(),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                      Footer(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesNames.signupScreen);
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.bgWhite,
        ),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Don't Have an account ?",
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
    );
  }
}
