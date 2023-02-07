import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/loading.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/controllers/event_controller.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/services/auth.dart';
import 'package:nscc_app/widgets/event_card.dart';
import 'package:nscc_app/widgets/gradient_text.dart';
import 'package:nscc_app/widgets/my_appbar.dart';

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  final eventController = Get.put(EventController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        child: GetBuilder<EventController>(
          initState: (state) => eventController.fetchEvents(),
          builder: (controller) {
          return controller.isLoading.value
              ? Loadings.basic()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
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
                                  style: MyTextStyles.poppins700
                                      .copyWith(fontSize: 30.sp),
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
                            Flexible(
                              child: ListView.builder(
                                itemCount: controller.data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return EventCard(
                                    title: controller.data[index].id,
                                    subtitle: controller.data[index].subtitle,
                                    date: DateTime.fromMillisecondsSinceEpoch(
                                            controller.data[index].startAt)
                                        .toUtc()
                                        .toString(),
                                    onpress: () async {
                                      await AuthMethods().signOut();
                                      Get.offAllNamed(RoutesNames.authPage);
                                    },
                                  );
                                },
                              ),
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
                                style: MyTextStyles.poppins700
                                    .copyWith(fontSize: 30.sp),
                                gradient: AppColors.cyanGradient,
                              ),
                            ),
                            EventCard(
                              title: "Pandora Tech Festival",
                              subtitle: "January, 2023",
                              date: " ",
                              onpress: () async {
                                await AuthMethods().signOut();
                              },
                              buttonLabel: "Learn More",
                              titleFontSize: 20,
                              isdatevisible: false,
                            ),
                          ]),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
