import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seven_min_track/main.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentindex = 0;

  late Image  images=Image.asset("assets/images/ganja guy.png",fit: BoxFit.cover,);

  List<OnboardingModel> onboardingList =[
    OnboardingModel("Find Barbers and Salons Easily in YourHands", "Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care."),
    OnboardingModel("Book Your Favourit Barber and Salon Quickly", "Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care."),
    OnboardingModel("Find Barbers and Salons Easily in YourHands", "Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care."),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        //    SizedBox(height: MySize.scaleFactorHeight*0,),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height:500,
                  width: Get.width,
                  child:images,
                  color: Colors.white,
                ),
                Positioned(
                  bottom: 7,
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                    ),
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ScrollingDotsEffect(
                          spacing: 10,                   // radius: 10,
                          dotHeight: 5,
                          dotWidth: 15,
                          paintStyle: PaintingStyle.fill,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.blue,
                        ),),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              //  color: Colors.red,
              height: 200,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (v){
                    setState(() {
                      currentindex = v;
                      if (v== 0){
                        images =Image.asset("assets/images/ganja guy.png",fit: BoxFit.fill,);
                        setState(() {});
                      }else if(v==1){
                        images =Image.asset("assets/images/ganja3.png",fit: BoxFit.fill);
                        setState(() {});
                      }else if(v==2){
                        images =Image.asset("assets/images/ganjaimage2.png",fit: BoxFit.fill);
                        setState(() {});
                      }
                    });
                  },
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      width: Get.width,
                      child: Column(
                        children: [
                          Text(onboardingList[index].title ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black,fontFamily: 'Poppins'),textAlign: TextAlign.center,),
                          SizedBox(height: 20,),
                          Text(onboardingList[index].subtitle,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black,),textAlign: TextAlign.center,),
                        ],
                      ),
                    );
                  }),
            ),

            GestureDetector(
          onTap: (){
              controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
              currentindex == 2?
                Get.to(()=> SignInScreen(title: "yes"))
                  :null;
            },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height:50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.black.withOpacity(0.80),
                    // gradient: LinearGradient(
                    //   colors: [Color(0xff7ef29d), Color(0xff0f68a9)],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                  ),
                  child: Center(child: Text(currentindex ==2? "Get Started" :"Next",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),))
                  // custombutton2(text: currentindex ==2? "Get Started" :"Next",
                  //     ontap: (){
                  //       controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  //       currentindex == 2?
                  //       context.push("/Loginup")
                  //           :null;
                  //     },
                  //     fontWeight: FontWeight.w600,fontSize: MySize.size16,fontColor: Colors.white)
              ),
            ),
          //  SizedBox(height: 30.h,),


            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   height: MySize.scaleFactorHeight*50,
            //   child: customButton(text: currentindex ==2? "Get Started": "Next",  fontSize: MySize.size16,fontWeight: FontWeight.w600,ontap: (){
            //     controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            //    currentindex == 2? Get.to(()=>LoginUp()):null;
            //     },
            //       color: AppColors.greenC2,fontColor: AppColors.white),
            // ),


          ],
        ),
      ),
    );
  }
}
