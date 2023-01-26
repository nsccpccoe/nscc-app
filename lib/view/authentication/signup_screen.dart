import 'package:flutter/material.dart';
import 'package:nscc_app/constants/buttons.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/footer.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/main.dart';
import 'package:nscc_app/view/authentication/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cnfpass = TextEditingController();
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 35,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffffffff).withOpacity(0.05),
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
                          controller: _username,
                        ),
                        myInpField(
                          label: "Email",
                          controller: _email,
                          keytype: TextInputType.emailAddress,
                        ),
                        myInpField(
                          label: "Password",
                          controller: _password,
                          ispassword: true,
                        ),
                        myInpField(
                          label: "Confirm Password",
                          controller: _cnfpass,
                          ispassword: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        PrimaryBtn(
                          label: "Sign Up",
                          onpress: () {
                            //  TODO: Login Function call
                          },
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
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
