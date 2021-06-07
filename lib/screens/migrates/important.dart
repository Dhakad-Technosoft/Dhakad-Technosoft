import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/get_products_model_entity.dart';
import 'package:mywebflutterapp/models/line_recurring_plans_entity.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/screens/migrates/emailverifications.dart';
import 'package:mywebflutterapp/screens/migrates/help_once_sim_card_port_comlete.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
class Important extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;
  final lineItemIndex;
  Important(this.subscriber, this.mapPlanDetails, this.lineItemIndex,  {Key key}) : super(key: key);
  @override
  ImportantState createState() => ImportantState();
}

class ImportantState extends State<Important> {
  double width, height;
  LinesDetailEntity linesDetail;
  String appbarTitle = 'Migration';
  LineRecurringPlansEntity lineRecurringPlan;
  bool isLoading = false;
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
    print('lineIDInVerifyDetails ${linesDetail.lines[widget.lineItemIndex].id.toString()}');
    getLineRecurringPlan();
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
                  //height: height/4,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
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
                        child:Text('IMPORTANTS',
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

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'Do  ',
                                        style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: CustomColours.darkBlue),
                                        children: <TextSpan>[
                                          TextSpan(text: 'NOTE', style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                          TextSpan(text: ' insert your new SIM \n card before your line moves to ${linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString()}. \n This will insure you do not lose service.',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.darkBlue),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please confirm  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].attributeValues.x82}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to migrate for better service?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 25,),
                            isLoading?CircularProgressIndicator(): Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                minWidth: width/6,
                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  callChangeCarrierApi();
                                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                },
                                child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                              ),
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
                  //height: height/4,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
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
                        child:Text('IMPORTANTS',
                          style: TextStyle(fontSize: 16,
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

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'Do  ',
                                        style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: CustomColours.darkBlue),
                                        children: <TextSpan>[
                                          TextSpan(text: 'NOTE', style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                          TextSpan(text: ' insert your new SIM \n card before your line moves to ${linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString()}. \n This will insure you do not lose service.',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.darkBlue),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please confirm  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].iccid}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to migrate for better service?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 25,),
                            isLoading?CircularProgressIndicator():  Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                minWidth: width/6,
                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  callChangeCarrierApi();
                                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                },
                                child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                              ),
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
           // padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 30),
                  //height: height/4,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
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
                        child:Text('IMPORTANTS',
                          style: TextStyle(fontSize: 16,
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

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'Do  ',
                                        style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: CustomColours.darkBlue),
                                        children: <TextSpan>[
                                          TextSpan(text: 'NOTE', style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                          TextSpan(text: ' insert your new SIM \n card before your line moves to ${linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString()}. \n This will insure you do not lose service.',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.darkBlue),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please confirm  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].iccid}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to migrate for better service?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 25,),
                            isLoading?CircularProgressIndicator(): Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                minWidth: width/6,
                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  callChangeCarrierApi();
                                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                },
                                child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                              ),
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
  ///Get all the values fetched from the API
  Future<Map> getLineRecurringPlan() async {
    //Load the lineRecurringPlan
    lineRecurringPlan = await getLineRecurringPlans(linesDetail.lines[widget.lineItemIndex].id.toString(),widget.subscriber.id.toString());
    print('lineRecurringData ${lineRecurringPlan.lineRecurringPlans[0].currentProductId}');
    GetProductsModelEntity currentProducts = await getCurrentProductBy(lineRecurringPlan.lineRecurringPlans[0].currentProductId.toString());


    //Return the data
    return {
      "lineRecurringPlan": lineRecurringPlan,
      "currentProducts": currentProducts,
    };
  }
  //Get Find the current plan id from LineRecurringPlans api
  Future<LineRecurringPlansEntity> getLineRecurringPlans(String lineID, String subsId) async => await APIClient().getLineRecurringPlans(lineID,subsId);
  //get products by new productID
  Future<GetProductsModelEntity> getCurrentProductBy(String procuctID) async => await APIClient().getCurrentProductBy(procuctID);

  Future<String> callChangeCarrierApi() async {
    String  new_carrier_id;
    String  device_serial;
    String  iccid;
    String  old_product_id;
    String  new_product_id;
    String  lineID;

    lineID = linesDetail.lines[widget.lineItemIndex].id.toString();
    new_carrier_id = linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString();
    if(new_carrier_id=='T-Mobile (Plintron)'){
      new_carrier_id = '5';
    }else {
      new_carrier_id = '4';
    }
    device_serial = linesDetail.lines[widget.lineItemIndex].imei.toString();
    if (device_serial!=null) {
      device_serial = linesDetail.lines[widget.lineItemIndex].imei.toString();
    } else{
      device_serial = linesDetail.lines[widget.lineItemIndex].meidHex.toString();
    }
    iccid = linesDetail.lines[widget.lineItemIndex].attributeValues.x82.toString();
    old_product_id  = lineRecurringPlan.lineRecurringPlans[0].currentProductId.toString();
    new_product_id = linesDetail.lines[widget.lineItemIndex].attributeValues.x79.toString();
    new_product_id =  new_product_id.substring(0, 4);
    print('new_product_id ${new_product_id}');
    var bodyvalue =   {
      "new_carrier_id": "${new_carrier_id}",
      "device_serial": "${device_serial}",
      "iccid": "${iccid}",
      "product_mapping": [
        {"old_product_id": "${old_product_id}",
          "new_product_id": "${new_product_id}"
        }
      ]
    };
    /*{
"new_carrier_id": "4",
"device_serial": "015767000012473",
"iccid": "89014103282335271645",
"product_mapping": [
{"old_product_id": "647",
"new_product_id": "640"
}
]
}*/

    print('charrierdata1 ${bodyvalue}');
    String response =  await ChangeCarrierPostApi(bodyvalue,lineID);
    if (response=='200') {
      isLoading = false;
      callCompletTransitionapi(new_carrier_id,new_product_id,iccid,lineID);
    }  else{
      if (new_carrier_id=='4') {
        new_product_id=='640';
      } else{
        new_product_id=='675';
      }
      var  bodyvalue =   {
        "new_carrier_id": "${new_carrier_id}",
        "device_serial": "${device_serial}",
        "iccid": "${iccid}",
        "product_mapping": [
          {"old_product_id": "${old_product_id}",
            "new_product_id": "${new_product_id}"
          }
        ]
      };
      print('charrierdata2 ${bodyvalue}');
      response =  await ChangeCarrierPostApi(bodyvalue,lineID);
      isLoading = false;
      if(response=='200'){
        callCompletTransitionapi(new_carrier_id,new_product_id,iccid,lineID);
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete(widget.subscriber)));

        //  MyDialog(context: context,title: "Please Call 972-728-7468",typeDialog: 0).show();

      }
    }
  }
//callChangeCarrierApi
  Future<String> ChangeCarrierPostApi ( var postChangeCarrier,String lineID) async => await APIClient().ChangeCarrierPostApi( postChangeCarrier ,lineID);


  Future<String> callCompletTransitionapi(String new_carrier_id,String new_product_id,String iccid,String lineID) async{
    var updateTransition = {
      "line":
      {
        "attribute_values":{
          "77":"Completed Transition",
          "78":"${new_carrier_id}",
          "79":"${new_product_id}",
          "82":"${iccid}"
        }
      }
    };
    String updateTransitionResponse = await updateCompletTransition(updateTransition,lineID);
    print('CompleteTransitionResponse ${updateTransitionResponse}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));


  }
  Future<String> updateCompletTransition (var updateTransition ,String lineID) async => await APIClient().updateCompletTransitionPutApi(updateTransition,lineID);


}