import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({super.key, });


  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd').format(now);

  // print(formattedDateTime);

  final _stepperData = List.generate(10, (index) =>
      StepperItemData(
    id: '$index',
    content: ({
      'name': 'Subhash Chandra Shukla',
      'occupation': 'Flutter Development',
      'mobileNumber': '7318459902',
      'email': 'subhashchandras7318@gmail.com',
      'born_date': '12\nAug',
      "contact_list": {
        "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
        "Portfolio": "https://subhashdev121.github.io/subhash/#/",
      }
    }),
    avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
  )).toList();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Joy App UI",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StepperListView(
          showStepperInLast: true,
          stepperData: _stepperData,
          stepAvatar: (_, data) {
            final stepData = data as StepperItemData;
            return PreferredSize(
              preferredSize: const Size.fromRadius(20),
              child: CircleAvatar(
                backgroundColor: AppColors.brownColor56,
                backgroundImage: NetworkImage(
                  stepData.avatar!,
                ),
              ),
            );
          },
          stepWidget: (_, data) {
            final stepData = data as StepperItemData;
            return PreferredSize(
              preferredSize: const Size.fromWidth(30),
              child:customTextRegular(title: "25/07/2023",fontSize: 15.w,color: Colors.white,fontWeight: FontWeight.w600)
              // Text(
              //   "25/07/2023",
              //  // stepData.content['born_date'] ?? '',
              //   style: TextStyle(
              //     color: theme.primaryColor,
              //     fontSize: 13,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            );
          },
          stepContentWidget: (_, data) {
            final stepData = data as StepperItemData;
            return Container(
              margin: const EdgeInsets.only(top: 20,),
              padding: const EdgeInsets.all(15),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white,),
              //   borderRadius: BorderRadius.circular(10)
              // ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(7),
                visualDensity: const VisualDensity(
                  vertical: -4,
                  horizontal: -4,
                ),
              // title: customTextRegular(title: "$formattedDate", color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),
                //  Text('$formattedDate',style: TextStyle(color: Colors.white),),
                //  Text(stepData.content['name'] ?? ''),
                subtitle: Column(
                //  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Wrap(
                      children: List.generate(5, (index) => Row(
                        children: [
                          customTextRegular(title: "49 mins", color: Colors.white,fontWeight: FontWeight.w600,fontSize: 13),
                          SizedBox(width: 10,),
                          customTextRegular(title: "10:30 am - 11:19", color: Colors.white.withOpacity(0.70),fontWeight: FontWeight.w600,fontSize: 7),
                        ],
                      )),
                    ),
                  ],
                  // children: [
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Row(
                  //     children: [
                  //       const Expanded(
                  //         flex: 3,
                  //         child: Icon(Icons.work),
                  //       ),
                  //       Expanded(
                  //         flex: 7,
                  //         child: Text(stepData.content['occupation'] ?? ''),
                  //       ),
                  //     ],
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Row(
                  //     children: [
                  //       const Expanded(
                  //         flex: 3,
                  //         child: Icon(Icons.phone),
                  //       ),
                  //       Expanded(
                  //         flex: 7,
                  //         child: Text(stepData.content['mobileNumber'] ?? ''),
                  //       ),
                  //     ],
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       // const Expanded(
                  //       //   flex: 3,
                  //       //   child: Icon(Icons.email),
                  //       // ),
                  //       // Expanded(
                  //       //   flex: 7,
                  //       //   child: Text(stepData.content['email'] ?? ''),
                  //       // ),
                  //     ],
                  //   ),
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  //   Text(
                  //     'Contact Link',
                  //     style: theme.textTheme.titleMedium,
                  //   ),
                  //   const SizedBox(
                  //     height: 7,
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.only(left: 10),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Expanded(
                  //               flex: 3,
                  //               child: Text(
                  //                 'Linked-In',
                  //                 style: theme.textTheme.caption,
                  //               ),
                  //             ),
                  //             // Expanded(
                  //             //   flex: 7,
                  //             //   child: GestureDetector(
                  //             //     onTap: () {
                  //             //       //_launchURL(stepData.content['contact_list']['LinkedIn']);
                  //             //     },
                  //             //     child: Text(
                  //             //       stepData.content['contact_list']['LinkedIn'] ?? '',
                  //             //       style: theme.textTheme.titleMedium?.copyWith(
                  //             //         color: Colors.blue,
                  //             //         decoration: TextDecoration.underline,
                  //             //       ),
                  //             //     ),
                  //             //   ),
                  //             // ),
                  //           ],
                  //         ),
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Expanded(
                  //               flex: 3,
                  //               child: Text(
                  //                 'Portfolio',
                  //                 style: theme.textTheme.caption,
                  //               ),
                  //             ),
                  //             // Expanded(
                  //             //   flex: 7,
                  //             //   child: GestureDetector(
                  //             //     onTap: () {
                  //             //       //_launchURL(stepData.content['contact_list']['Portfolio']);
                  //             //     },
                  //             //     child: Text(
                  //             //       stepData.content['contact_list']['Portfolio'] ?? '',
                  //             //       style: theme.textTheme.titleMedium?.copyWith(
                  //             //         color: Colors.blue,
                  //             //         decoration: TextDecoration.underline,
                  //             //       ),
                  //             //     ),
                  //             //   ),
                  //             // ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  // ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: AppColors.white,
                    width: 0.8,
                  ),
                ),
              ),
            );
          },
          stepperThemeData: StepperThemeData(
            lineColor: AppColors.white,
            lineWidth: 3,
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  // Future<void> _launchURL(String? url) async {
  //   if (url == null) {
  //     return;
  //   }
  //   try {
  //     if (await canLaunchUrl(Uri.parse(url))) {
  //       await launchUrl(Uri.parse(url));
  //     }
  //     return;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Failed to launch URL - $e');
  //     }
  //   }
  // }
}
