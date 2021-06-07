
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/models/subscribers.dart';
import 'package:mywebflutterapp/screens/account.dart';
import 'package:mywebflutterapp/screens/device_manual/device_manuals.dart';
import 'package:mywebflutterapp/screens/login_screen.dart';
import 'package:mywebflutterapp/screens/migrates/transition_migration.dart';
import 'package:mywebflutterapp/screens/onboarding/user_onboarding.dart';
import 'package:mywebflutterapp/screens/plans.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

commonTopBar(double width,double height,String appbarTitle,Subscriber subscriber,BuildContext context){
  bool tap1= false,tap2= false,tap3= false,tap4= false,tap5= false,tap6  =false;
  bool isDisplayMigrationButton = false;
  bool isLoading = false;
  if (appbarTitle=='Billing/Payments') {
    tap1  =true;
    tap2  =false;
    tap3  =false;
    tap4  =false;
    tap5  =false;
    tap6  =false;
  }  else if (appbarTitle=='Support') {
    tap1  =false;
    tap2  =true;
    tap3  =false;
    tap4  =false;
    tap5  =false;
    tap6  =false;
  }else if (appbarTitle=='Migration') {
    tap1  =false;
    tap2  =false;
    tap3  =true;
    tap4  =false;
    tap5  =false;
    tap6  =false;
  }else if (appbarTitle=='Account OverVeiw') {
    tap1  =false;
    tap2  =false;
    tap3  =false;
    tap4  =true;
    tap5  =false;
    tap6  =false;
  }
  else if (appbarTitle=='Device Manuals') {
    tap1  =false;
    tap2  =false;
    tap3  =false;
    tap4  =false;
    tap5  =true;
    tap6  =false;
  }
  return  PreferredSize(
      preferredSize: Size(width, height/5),
      child: Container(
          color: Colors.white,

       child:   FutureBuilder<Map>(
            future: getAllDetails(subscriber),
            builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
             // if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
              if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

              LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
              SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
              BillingStatements billingStatements = snapshot.data["billingStatement"];


              for(int lineItemIndex=0;lineItemIndex<linesDetail?.lines?.length;lineItemIndex++) {
                if (linesDetail.lines[lineItemIndex].status == "active") {
                  if (linesDetail.lines[lineItemIndex].attributeValues.x77 != null &&
                      linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Needs Transition'||
                      linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Completed Transition') {
                    isDisplayMigrationButton = true;
                  }else{
                    // isDisplayMigrationButton = false;
                  }
                }
              }
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Patriot_Logo_Web APP.png",),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:<Widget> [
                                          InkWell(
                                              onTap: () {
                                                appbarTitle = 'Billing/Payments';
                                                if (tap1!=true) {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(subscriber)));
                                                }
                                              },
                                              child:Row(
                                                children: [
                                                  tap1?Image.asset("assets/images/billingiconblue.png",):
                                                  Image.asset("assets/images/Billing Icon_Gray.png",),
                                                  Text(
                                                    'Billing/Payments',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),
                                    /*      SizedBox(width: width / 30),
                                          InkWell(
                                              onTap: () {
                                                appbarTitle = 'Support';
                                                if (tap2!=true) {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserOnBoarding(subscriber)));
                                                }
                                              },
                                              child:Row(
                                                children: [
                                                  tap2?Image.asset("assets/images/Support Icon_Blue.png",):
                                                  Image.asset("assets/images/Support Icon_Gray.png",),
                                                  Text(
                                                    'Support',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),*/
                                          SizedBox(width: width / 30),
                                          isDisplayMigrationButton?  InkWell(
                                              onTap: () {
                                                appbarTitle ='Migration';
                                                if (tap3!=true) {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:subscriber)));
                                                }
                                              },
                                              child:Row(
                                                children: [
                                                  tap3?Image.asset("assets/images/Migration Icon_Blue.png",):
                                                  Image.asset("assets/images/Migration Icon_Gray.png",),
                                                  Text(
                                                    'Migration',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ):Container(),
                                          SizedBox(width: width / 30),
                                          InkWell(
                                              onTap: () {
                                                if (tap4!=true) {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlansScreen(subscriber)));
                                                }
                                              },
                                              child:Row(
                                                children: [
                                                  tap4?Image.asset("assets/images/Account Icon_Blue.png",):
                                                  Image.asset("assets/images/Account Icon_Gray.png",),

                                                  Text(
                                                    'Plans',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(width: width / 30),
                                          InkWell(
                                              onTap: () {
                                                if (tap5!=true) {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceManuals(subscriber)));
                                                }
                                              },
                                              child:Row(
                                                children: [
                                                  tap5?Image.asset("assets/images/diviceimg.png",height: 25,width: 25,):
                                                  Image.asset("assets/images/diviceimg.png",height: 25,width: 25,),
                                                  Text(
                                                    'Device Manuals',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(width: width / 30),
                                          InkWell(
                                              onTap: () async {
                                                isLoading=true;
                                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                                await prefs.setInt('id', 0);
                                                Subscribers subscribers = await APIClient().getSubDetails();
                                                //isLoading=false;
                                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                    LoginScreen(subscribers)), (Route<dynamic> route) => false);
                                              },
                                              child:Row(
                                                children: [
                                                  Icon(
                                                    Icons.logout,
                                                    color: CustomColours.appred,// add custom icons also
                                                  ),
                                                  Text(
                                                    'LogOut',
                                                    style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                  Container(width: 25,height: 25,)
                                ],
                              ),
                            ),
                            Container(
                              color: CustomColours.lightGrey,
                              width: width,
                              padding: EdgeInsets.only(top:15,bottom: 15),
                              child:  Text(
                                '${appbarTitle??''}',
                                style: TextStyle(color: CustomColours.appred),textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                      child: isLoading?CircularProgressIndicator():Container()
                  ),

                ],
              );
            },
          ),


      )
  );

}

///Get all the values fetched from the API
Future<Map> getAllDetails(Subscriber subscriber) async {
  print('subscriberIDforMigration :-  ${subscriber.id.toString()}');
  //Load the line and the subscriber detail
  LinesDetailEntity linesDetail = await getLinesData(subscriber);

  print('migrationLinedata :-  ${linesDetail.lines[0].id}');
  print('migrationLinedataLength :-  ${linesDetail.lines.length}');
  SubscriberDetail subscriberDetail = await getSubscriberData(subscriber);

  //Load the billing details from the "current_billing_statement_id" field from the subscriber API
  BillingStatements billingStatements = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());

  //Return the data
  return {
    "linesDetail": linesDetail,
    "subscriberDetail": subscriberDetail,
    "billingStatement": billingStatements,
  };
}

Future<LinesDetailEntity> getLinesData(Subscriber subscriber) async => await APIClient().getLinesDetail(subscriber.id.toString());

Future<SubscriberDetail> getSubscriberData(Subscriber subscriber) async => await APIClient().getSingleSubDetail(subscriber.id.toString());

Future<BillingStatements> getBillingStatement(String billingStatementId) async =>
    await APIClient().getBillingStatement(billingStatementId);

