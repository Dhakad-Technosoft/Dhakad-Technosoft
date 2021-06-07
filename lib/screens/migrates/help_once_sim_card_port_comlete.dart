import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

class HelpOnceSimCardPortComlete extends StatefulWidget {
  final Subscriber subscriber;
  HelpOnceSimCardPortComlete(this.subscriber,{Key key}) : super(key: key);

  @override
  _HelpOnceSimCardPortComleteState createState() =>
      _HelpOnceSimCardPortComleteState();
}

class _HelpOnceSimCardPortComleteState
    extends State<HelpOnceSimCardPortComlete> {
  double width, height;
  String appbarTitle = 'Migration';
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
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: height/1.7,
                  child: Column(
                    children: [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:Text('EMAIL NOTIFICATIONS',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Please refer to your email for next steps.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Once port completes, please install the required SIM card and restart the device.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkBlue),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('NOTE :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColours.samidarkRed),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  If you have trouble, give us a call 972-728-7468',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
                    ],
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
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: height/1.7,
                  child: Column(
                    children: [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:Text('EMAIL NOTIFICATIONS',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Please refer to your email for next steps.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Once the port has been completed, please install required SIM card, and restart the device.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkBlue),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('NOTE :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColours.samidarkRed),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  If you have trouble, give us a call 972-728-7468',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
           // padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: height/1.7,
                  child: Column(
                    children: [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:Text('EMAIL NOTIFICATIONS',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Please refer to your email for next steps..',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:Text('Once port completes, please install the required SIM card and restart the device.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkBlue),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('NOTE :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColours.samidarkRed),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  If you have trouble, give us a call 972-728-7468',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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


    return Scaffold(
      appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
      //Body
      body:Container(
        padding: EdgeInsets.only(left: width/6,right: width/6),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: height/1.7,
              child: Column(
                children: [
                  Flexible(
                    child:Container(
                      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                      alignment:Alignment.bottomCenter,
                      height:3.0,
                      width:width,
                      color:CustomColours.lightGrey,
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    child:Text('EMAIL NOTIFICATIONS',
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Flexible(
                    child:Container(
                      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                      alignment:Alignment.bottomCenter,
                      height:3.0,
                      width:width,
                      color:CustomColours.lightGrey,
                    ),
                  ),

                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child:Text('Please rafer to your email for notifications about your port.',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: CustomColours.grayDark),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:Text('Once port completes, please install the required SIM card and restart the device.',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: CustomColours.darkBlue),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('NOTE :', style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CustomColours.samidarkRed),
                              textAlign: TextAlign.left, ),
                            SizedBox(height: 3,),
                            Expanded(
                              child:Text('  If you have trouble, give us a call.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkBlue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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