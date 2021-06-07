import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:mywebflutterapp/utils/myDialog.dart';

import 'important.dart';
class VerifyDetails extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;
  final lineItemIndex;
  VerifyDetails(this.subscriber, this.mapPlanDetails, this.lineItemIndex, {Key key}) : super(key: key);

  @override
  VerifyDetailsState createState() =>
      VerifyDetailsState();
}

class VerifyDetailsState extends State<VerifyDetails> {
  double width, height;
  var iccidController = TextEditingController();
  LinesDetailEntity linesDetail;
  String appbarTitle = 'Migration';
  int failsCount = 0;
  @override
  void initState() {
    linesDetail = widget.mapPlanDetails["linesDetail"] ?? new List();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  height: height/1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 10),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('VERIFY DETAILS',
                            style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 30,),

                        Container(
                            margin: EdgeInsets.only(left: 10,right: 10),

                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child:    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: CustomColours.darkBlue),
                                                ),
                                              ],)
                                          ],
                                        ),
                                        SizedBox(width: width/20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Phone Number ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Current Phone ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Current IMEI ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              alignment: Alignment.center,
                                              child:Text('Enter last 4 numbers of ICCID for this phone.',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    color: CustomColours.grayDark),
                                              ),
                                            ),
                                            SizedBox(height: 20,),

                                          ],
                                        ),

                                      ],

                                    ),
                                  ),


                                  Container(
                                    //color: Colors.green,
                                    alignment: Alignment.center,
                                    child:  iccidCode(),
                                  ),
                                  SizedBox(height: 60,),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Material(
                                      elevation: 4.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:CustomColours.samidarkRed,
                                      child: MaterialButton(
                                        minWidth: width/7,
                                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          checkIccidAndSubmit();
                                        },
                                        child: Text('Submit', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 18)),

                                      ),
                                    ),
                                  )


                                ],
                              ),
                            )
                        ),



                        /*   Align(
                 alignment: Alignment.bottomCenter,
                 child:Image.asset("assets/images/american_flag_isolated.png",),
                 *//* child: AspectRatio(
             aspectRatio: (width)/(height/4),
               child:Image.asset("assets/images/american_flag_isolated.png",),
               // child:image: Image.asset("assets/images/onboarding_1.png"),

           ),*//*
               )*/
                      ],
                    ),

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
          //Body
          body:Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  height: height/1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 10),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('VERIFY DETAILS',
                            style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 30,),

                        Container(
                            margin: EdgeInsets.only(left: 10,right: 10),

                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child:    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: CustomColours.darkBlue),
                                                ),
                                              ],)
                                          ],
                                        ),
                                        SizedBox(width: width/20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Phone Number ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Current Phone ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Current IMEI ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              alignment: Alignment.center,
                                              child:Text('Enter last 4 numbers of ICCID for this phone.',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    color: CustomColours.grayDark),
                                              ),
                                            ),
                                            SizedBox(height: 20,),

                                          ],
                                        ),

                                      ],

                                    ),
                                  ),


                                  Container(
                                    //color: Colors.green,
                                    alignment: Alignment.center,
                                    child:  iccidCode(),
                                  ),
                                  SizedBox(height: 60,),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Material(
                                      elevation: 4.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:CustomColours.samidarkRed,
                                      child: MaterialButton(
                                        minWidth: width/7,
                                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          checkIccidAndSubmit();
                                        },
                                        child: Text('Submit', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 18)),

                                      ),
                                    ),
                                  )


                                ],
                              ),
                            )
                        ),



                        /*   Align(
                 alignment: Alignment.bottomCenter,
                 child:Image.asset("assets/images/american_flag_isolated.png",),
                 *//* child: AspectRatio(
             aspectRatio: (width)/(height/4),
               child:Image.asset("assets/images/american_flag_isolated.png",),
               // child:image: Image.asset("assets/images/onboarding_1.png"),

           ),*//*
               )*/
                      ],
                    ),

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
          //Body
          body:Container(
           // padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  height: height/1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 10),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('VERIFY DETAILS',
                            style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 30,),

                        Container(
                            margin: EdgeInsets.only(left: 10,right: 10),

                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child:    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: CustomColours.darkBlue),
                                                ),
                                              ],)
                                          ],
                                        ),
                                        SizedBox(width: width/20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Phone Number ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Current Phone ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Current IMEI ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.darkBlue),
                                                ),
                                                Text('  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: CustomColours.grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              alignment: Alignment.center,
                                              child:Text('Enter last 4 numbers of ICCID for this phone.',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    color: CustomColours.grayDark),
                                              ),
                                            ),
                                            SizedBox(height: 20,),

                                          ],
                                        ),

                                      ],

                                    ),
                                  ),


                                  Container(
                                    //color: Colors.green,
                                    alignment: Alignment.center,
                                    child:  iccidCode(),
                                  ),
                                  SizedBox(height: 60,),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Material(
                                      elevation: 4.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:CustomColours.samidarkRed,
                                      child: MaterialButton(
                                        minWidth: width/7,
                                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          checkIccidAndSubmit();
                                        },
                                        child: Text('Submit', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 18)),

                                      ),
                                    ),
                                  )


                                ],
                              ),
                            )
                        ),



                        /*   Align(
                 alignment: Alignment.bottomCenter,
                 child:Image.asset("assets/images/american_flag_isolated.png",),
                 *//* child: AspectRatio(
             aspectRatio: (width)/(height/4),
               child:Image.asset("assets/images/american_flag_isolated.png",),
               // child:image: Image.asset("assets/images/onboarding_1.png"),

           ),*//*
               )*/
                      ],
                    ),

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
  iccidCode() {
    return
      Container(
          width: width/4,
          decoration: myBoxDecoration(),
          margin: const EdgeInsets.only(left: 0, right: 0.0, top: 0),
          child: TextField(
            obscureText: false,
            controller: iccidController,
            cursorColor: CustomColours.darkred,
            style: TextStyle(color: CustomColours.darkred),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 10.0, top: 0, right: 5, bottom: 0),
              hintText: 'ICCID',
            ),
          )
      );




    /*Container(
          decoration: myBoxDecoration(),
          margin: const EdgeInsets.only(left: 0, right: 0.0, top: 0),
          child: TextField(
            obscureText: false,
            controller: enterCouponController,
            cursorColor: CustomColours.darkred,
            style: TextStyle(color: CustomColours.darkred),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 10.0, top: 0, right: 5, bottom: 0),
              hintText: "apply coupon",
            ),
          )
      );*/
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(  Radius.circular(6)),
        border: Border.all(width: 1,color: CustomColours.grayDark)
    );
  }

  void checkIccidAndSubmit() {
    String iccid = ' ${linesDetail.lines[widget.lineItemIndex].iccid}';
    print('fullICCID ${iccid}');
    //var lastFourIccid = iccid.substring(-4);
    var lastFourIccid = iccid.substring(iccid.length - 4);
    print('last4 ${lastFourIccid}');
    print('Enteredlast4 ${iccidController.text.toString()}');
    // if (lastFourIccid==iccidController.text.toString()) {
    // if (lastFourIccid==iccidController.text.toString()) {
    if(linesDetail.lines[widget.lineItemIndex].attributeValues.x82!=null&&linesDetail.lines[widget.lineItemIndex].attributeValues.x82.contains(iccidController.text.toString())) {
      print('bothlast4IS same');
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>
              Important(widget.subscriber, widget.mapPlanDetails,
                  widget.lineItemIndex)));
    }else {
      failsCount = failsCount + 1;
      if (failsCount > 3) {
        MyDialog(context: context, title: " Please enter the entire ICCID", typeDialog: 0)
            .show();
        iccidController.clear();
      } else {
        MyDialog(context: context, title: "Please try again", typeDialog: 0)
            .show();
        iccidController.clear();
      }
    }
    /*}else{
      MyDialog(context: context,title: "Please try again",typeDialog: 0).show();
    }*/
  }
  //get single LineId data calling by line id
  Future<LinesDetailEntity> getSingleLineData(String lineID) async => await APIClient().getSingleLineData(lineID);



}