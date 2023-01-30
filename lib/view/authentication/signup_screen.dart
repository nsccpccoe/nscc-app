import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/footer.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/constants/validators.dart';
import 'package:nscc_app/services/auth.dart';
import 'package:nscc_app/widgets/custom_snackbar.dart';
import 'package:nscc_app/widgets/gradient_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cnfpass = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 35,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.bgWhite,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Create Account",
                            style: MyTextStyles.customStyle(
                              fontsize: 24,
                              fontWeight: FontWeight.bold,
                              fontcolor: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          myInpField(
                            label: "Full Name",
                            controller: _fullname,
                            validate: MyValidators.v_name,
                          ),
                          myInpField(
                            label: "Email",
                            controller: _email,
                            keytype: TextInputType.emailAddress,
                            validate: MyValidators.v_email,
                          ),
                          myInpField(
                            label: "Password",
                            controller: _password,
                            ispassword: true,
                            validate: MyValidators.v_pass,
                          ),
                          myInpField(
                            label: "Confirm Password",
                            controller: _cnfpass,
                            ispassword: true,
                            validate: MyValidators.v_pass,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GradientButton(
                            onTap: () async {
                              if (_password.text == _cnfpass.text) {
                                if (_formkey.currentState!.validate()) {
                                  print("button tapped");
                                  await AuthMethods().signUp(
                                      context: context,
                                      fullname: _fullname.text,
                                      email: _email.text,
                                      password: _password.text);
                                    
                                }
                                
                              } else {
                                // MyWidgets.showSnackbar(
                                //     msg: "Password Doesn't match",
                                //     context: context);
                                // SbController.showBar(
                                //     msg: "Password Doesn't match");
                              }
                            },
                            height: 30.h,
                            width: 80.w,
                            text: "Sign Up",
                            gradient: AppColors.cyanGradient,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
