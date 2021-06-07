import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';


import 'device_manuals.dart';

class Application extends StatefulWidget {
  final Map mapData;
  final Subscriber subscriber;
  Application(this.subscriber,this.mapData);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  double width, height;
  String appbarTitle = 'Device Manuals';
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
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);
                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.3,
                            child: ListView.builder(
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: width/1.5,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Body
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),

                                          SizedBox(height: 40,),
                                          Container(
                                            alignment:Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Image.network(
                                               mapFunction["contents"][index]["image"],
                                              //'https://picsum.photos/250?image=9',
                                              height: MediaQuery.of(context).size.height/1.5 * 0.5,
                                            ),
                                          ),

                                          //Image
                                          SizedBox(height: 40,),
                                          //Swipe text
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text("Swipe to see more",
                                                style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),),
                                              Icon(Icons.navigate_next),
                                            ],
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                      color: Colors.white,
                      child:  Column(
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
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);
                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.3,
                            child: ListView.builder(
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: width/1.5,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Body
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),

                                          SizedBox(height: 40,),
                                          Container(
                                            alignment:Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Image.network(
                                              mapFunction["contents"][index]["image"],
                                              //'https://picsum.photos/250?image=9',
                                              height: MediaQuery.of(context).size.height/1.5 * 0.5,
                                            ),
                                          ),

                                          //Image
                                          SizedBox(height: 40,),
                                          //Swipe text
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text("Swipe to see more",
                                                style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),),
                                              Icon(Icons.navigate_next),
                                            ],
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                        color: Colors.white,
                        child:  Column(
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
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);
                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.3,
                            child: ListView.builder(
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: width/1.5,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Body
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),

                                          SizedBox(height: 40,),
                                          Container(
                                            alignment:Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Image.network(
                                             // mapFunction["contents"][index]["image"],
                                              'https://picsum.photos/250?image=9',
                                              height: MediaQuery.of(context).size.height/1.5 * 0.5,
                                            ),
                                          ),

                                          //Image
                                          SizedBox(height: 40,),
                                          //Swipe text
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text("Swipe to see more",
                                                style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),),
                                              Icon(Icons.navigate_next),
                                              SizedBox(width: 20,),
                                            ],
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                        color: Colors.white,
                        child:  Column(
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
                    )
                ),
              ],

            ),
          )
      );
    }


  }



  toolbar(ThemeData theme) {
    return  Container(
      height: 60,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Image.asset("assets/images/Arrow Back Gray.png",),

              onPressed: () {
                Navigator.pop(context);
              }),

          Align(
            alignment: Alignment.center,
            child:  Text('Guide',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.grayDark),),
          ),

          Container(),

        ],
      ),

    );
  }
 String indexPosition(int index,Map mapFunction) {
    print('imggggss ${ mapFunction.toString()}');
    if (index==1) {
      return "Select Sounds & Haptics";
    }else{
      print('immmmm ${mapFunction["contents"][index]["image"]}');
      return   mapFunction["contents"][index]["step"];
    }
  }

  String changeStep(int index) {
    if (index==1) {
      return 'Step 2';
    }  else{
      return 'Step 1';
    }
  }
}
