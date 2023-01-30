import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/event_card.dart';
import 'package:nscc_app/widgets/gradient_button.dart';
import 'package:nscc_app/widgets/gradient_text.dart';
import 'package:nscc_app/widgets/my_appbar.dart';

class FestivalScreen extends StatelessWidget {
  const FestivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.bgGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NSCC's",
                          textAlign: TextAlign.start,
                          style: MyTextStyles.customStyle(
                            fontsize: 12,
                            fontWeight: FontWeight.w800,
                            fontcolor: AppColors.whiteColor,
                          ),
                        ),
                        GradientText(
                          "Pandora Tech Festival",
                          style:
                              MyTextStyles.poppins700.copyWith(fontSize: 30.sp),
                          gradient: AppColors.cyanGradient,
                        ),
                        Text(
                          "22/01/2023 - 29/01/2023",
                          style: MyTextStyles.customStyle(
                            fontsize: 12,
                            fontWeight: FontWeight.w800,
                            fontcolor: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    EventCard(
                      title: "WebXplore",
                      subtitle: "Web Development + Marketing Hackathon",
                      date: "22/01/2023 8:00 PM - 29/01/2023 11:59 PM IST",
                      onpress: () {},
                    ),
                    EventCard(
                      title: "CodeHive",
                      subtitle: "Competitive Programming Contest",
                      date: "26/01/2023, 02:00 PM - 05:00 PM IST",
                      onpress: () {},
                    ),
                    EventCard(
                      title: "CodeRush- X",
                      subtitle: "Competitive Programming + Hiring Contest",
                      date: "29/01/2023, 09:00 PM - 12:00 AM IST",
                      onpress: () {},
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: GradientText(
                        "Past Festival",
                        style:
                            MyTextStyles.poppins700.copyWith(fontSize: 30.sp),
                        gradient: AppColors.cyanGradient,
                      ),
                    ),
                    EventCard(
                      title: "Pandora Tech Festival",
                      subtitle: "January, 2023",
                      date: " ",
                      onpress: () {},
                      buttonLabel: "Learn More",
                      titleFontSize: 20,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
