import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/login_button_widget.dart';
import 'package:get_transfer_driver/screen_widgets/tabbar_screens_data_widgets/filter_widget.dart';
import 'package:get_transfer_driver/screen_widgets/tabbar_screens_data_widgets/first_container_widget.dart';
import 'package:get_transfer_driver/screen_widgets/tabbar_screens_data_widgets/search_widget.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool isChecked = false;

  bool istextfield = false;
  int num = 3;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FirstWidget(),
                SizedBox(
                  width: width * 0.02,
                ),
                const FilterWidget(),
                istextfield
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          istextfield = !istextfield;
                          setState(() {});
                        },
                        icon: const Icon(Icons.search)),
              ],
            ),
          ),
          istextfield
              ? searchWidget(() {
                  istextfield = !istextfield;
                  setState(() {});
                })
              : const SizedBox(),
          Text('No elements to show, please select other filters'.tr),
          SizedBox(
            height: height * .02,
          ),
          SizedBox(
            height: height,
            width: width,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: height * .44,
                  width: width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tue, 20 June, 02:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ride #6715687185 created a day ago',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.deepPurpleLightColor,
                              child: Center(
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .03,
                            ),
                            const Text(
                              '2.6715687185 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * .024),
                          height: height * .05,
                          width: width * .02,
                          decoration: BoxDecoration(
                            color: AppColors.deepPurpleLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1.3, color: Colors.black26),
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColors.deepPurpleLightColor,
                              backgroundImage: const AssetImage(
                                'assets/clock.png',
                              ),
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            Container(
                              height: height * .03,
                              width: width * .3,
                              decoration: BoxDecoration(
                                color: AppColors.deepPurpleLightColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  '2.6715687185 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.whiteColor,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.deepPurpleLightColor,
                              child: Center(
                                child: Text(
                                  'B',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .03,
                            ),
                            const Text(
                              'Kamalia , Toba Tek Singh, Pakistan,',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          children: [
                            const Text('Comfort'),
                            const Spacer(),
                            const Icon(Icons.person),
                            const Icon(
                              Icons.close,
                              size: 12,
                            ),
                            Text('$num')
                          ],
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        LoginButton(title: 'OFFER PRICE', onTap: () {}),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    ));
  }
}
