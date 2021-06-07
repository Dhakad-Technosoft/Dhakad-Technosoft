import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

import '../account.dart';
import '../homescreen.dart';
import '../web_home.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class UserOnBoarding extends StatefulWidget {
   Subscriber subscriber;

  UserOnBoarding(this.subscriber);

  @override
  _UserOnBoardingState createState() => _UserOnBoardingState();
}

class _UserOnBoardingState extends State<UserOnBoarding> {
  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Color.fromRGBO(182, 39, 62, 1),fontFamily: 'Montserrat',),
    bodyTextStyle: TextStyle(fontSize: 18.0,color: Color.fromRGBO(157, 159, 161, 1),),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.only(top: 0),
    pageColor: Colors.white,
  );
  List<PageViewModel> lstPages = [
    //Page 1
    PageViewModel(
      //title: "Your Account. All in one place",
      title: 'Your Account. All in one place',
      body: "Managing your account hav never been easier. Devices, plans, data and more",
      image: Image.asset("assets/images/app_phone_plans-devices.png"),
     // image:SvgPicture.asset("assets/images/app_phone_plans-devices.svg"),
      decoration: pageDecoration,
    ),

    //Page 2
    PageViewModel(
      title: "Shop and Upgrade in minutes",
      body: "The faster way to get what you want",
      image: Image.asset("assets/images/app_phone_plans-customize.png"),
      decoration: pageDecoration,
    ),

    //Page 3
    PageViewModel(
      title: "On- Demand support",
      body: "Smart support that's with you every step of the way",
      image: Image.asset("assets/images/app_phone_plans-support.png"),
      decoration: pageDecoration,
    ),

    //Page 4
    PageViewModel(
      title: "Your bill, simplified",
      body: "Easy to understand, Easy to pay.",
      image: Image.asset("assets/images/app_phone_bill.png"),
      decoration: pageDecoration,
    ),
  ];
  double width, height;
  String appbarTitle = 'Support';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 50),
                  child: IntroductionScreen(
                    pages: lstPages,
                    onDone: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    onSkip: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    showSkipButton: true,
                    skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                    next: const Icon(Icons.navigate_next,size: 50,),
                    done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                    dotsDecorator: DotsDecorator(
                        size: const Size.square(12.0),
                        activeSize: const Size(25.0, 12.0),
                        activeColor: Theme.of(context).accentColor,
                        color: Colors.black,
                        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:4.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        SizedBox(height: height/45,),
                        Text(
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
              ],
            ),
          )

      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 50),
                  child: IntroductionScreen(
                    pages: lstPages,
                    onDone: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    onSkip: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    showSkipButton: true,
                    skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                    next: const Icon(Icons.navigate_next,size: 50,),
                    done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                    dotsDecorator: DotsDecorator(
                        size: const Size.square(12.0),
                        activeSize: const Size(25.0, 12.0),
                        activeColor: Theme.of(context).accentColor,
                        color: Colors.black,
                        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:4.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        SizedBox(height: height/45,),
                        Text(
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
              ],
            ),
          )

      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            //padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 50),
                  child: IntroductionScreen(
                    pages: lstPages,
                    onDone: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    onSkip: () {
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                    },
                    showSkipButton: true,
                    skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                    next: const Icon(Icons.navigate_next,size: 50,),
                    done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                    dotsDecorator: DotsDecorator(
                        size: const Size.square(12.0),
                        activeSize: const Size(25.0, 12.0),
                        activeColor: Theme.of(context).accentColor,
                        color: Colors.black,
                        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:4.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        SizedBox(height: height/45,),
                        Text(
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
              ],
            ),
          )

      );
    }



  }
}
