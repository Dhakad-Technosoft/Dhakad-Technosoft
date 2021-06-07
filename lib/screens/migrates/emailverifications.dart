import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:video_player/video_player.dart';


class EmailVerification extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;
  final lineItemIndex;
  EmailVerification(this.subscriber, this.mapPlanDetails, this.lineItemIndex,{Key key}) : super(key: key);

  @override
  EmailVerificationState createState() =>
      EmailVerificationState();
}

class EmailVerificationState
    extends State<EmailVerification> {
  double width, height;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  String appbarTitle = 'Migration';
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white,CustomColours.lightGrey])
                  ),
                  //color: Colors.white,
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('EMAIL NOTIFICATIONS',
                            style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3,bottom: 10),
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
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Please refer to your email for notifications about your port.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.grayDark),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Once port completes, please install the required sime card and restart the device.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkBlue),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Container(
                                    alignment: Alignment.center,
                                    child:Text('Watch Activation Instructions.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkred),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Align(
                                      alignment: Alignment.center,
                                      //child:Image.asset("assets/images/Play Button.png",),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          InkWell(
                                            child: FutureBuilder(
                                              future: _initializeVideoPlayerFuture,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.done) {
                                                  // If the VideoPlayerController has finished initialization, use
                                                  // the data it provides to limit the aspect ratio of the video.
                                                  return AspectRatio(
                                                    aspectRatio: _controller.value.aspectRatio,
                                                    // Use the VideoPlayer widget to display the video.
                                                    child: VideoPlayer(_controller),
                                                  );
                                                } else {
                                                  // If the VideoPlayerController is still initializing, show a
                                                  // loading spinner.
                                                  return Center(child: CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                            onTap: (){
                                              setState(() {
                                                // If the video is playing, pause it.
                                                if (_controller.value.isPlaying) {
                                                  _controller.pause();
                                                } else {
                                                  // If the video is paused, play it.
                                                  _controller.play();
                                                }
                                              });
                                            },
                                          ),
                                          Positioned(
                                              left: 0,right: 0,
                                              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                                size: 70,)
                                          ),
                                        ],
                                      )
                                  )

                                ],
                              ),
                            )
                        ),

                      ],
                    ),

                  ),
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
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white,CustomColours.lightGrey])
                  ),
                  //color: Colors.white,
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('EMAIL NOTIFICATIONS',
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3,bottom: 10),
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
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Please refer to your email for notifications about your port.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.grayDark),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Once port completes, please install the required sime card and restart the device.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkBlue),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Container(
                                    alignment: Alignment.center,
                                    child:Text('Watch Activation Instructions.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkred),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Align(
                                      alignment: Alignment.center,
                                      //child:Image.asset("assets/images/Play Button.png",),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          InkWell(
                                            child: FutureBuilder(
                                              future: _initializeVideoPlayerFuture,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.done) {
                                                  // If the VideoPlayerController has finished initialization, use
                                                  // the data it provides to limit the aspect ratio of the video.
                                                  return AspectRatio(
                                                    aspectRatio: _controller.value.aspectRatio,
                                                    // Use the VideoPlayer widget to display the video.
                                                    child: VideoPlayer(_controller),
                                                  );
                                                } else {
                                                  // If the VideoPlayerController is still initializing, show a
                                                  // loading spinner.
                                                  return Center(child: CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                            onTap: (){
                                              setState(() {
                                                // If the video is playing, pause it.
                                                if (_controller.value.isPlaying) {
                                                  _controller.pause();
                                                } else {
                                                  // If the video is paused, play it.
                                                  _controller.play();
                                                }
                                              });
                                            },
                                          ),
                                          Positioned(
                                              left: 0,right: 0,
                                              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                                size: 70,)
                                          ),
                                        ],
                                      )
                                  )

                                ],
                              ),
                            )
                        ),

                      ],
                    ),

                  ),
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
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white,CustomColours.lightGrey])
                  ),
                  //color: Colors.white,
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('EMAIL NOTIFICATIONS',
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3,bottom: 10),
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
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Please refer to your email for notifications about your port.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.grayDark),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:Text('Once port completes, please install the required sime card and restart the device.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkBlue),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Container(
                                    alignment: Alignment.center,
                                    child:Text('Watch Activation Instructions.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkred),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Align(
                                      alignment: Alignment.center,
                                      //child:Image.asset("assets/images/Play Button.png",),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          InkWell(
                                            child: FutureBuilder(
                                              future: _initializeVideoPlayerFuture,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.done) {
                                                  // If the VideoPlayerController has finished initialization, use
                                                  // the data it provides to limit the aspect ratio of the video.
                                                  return AspectRatio(
                                                    aspectRatio: _controller.value.aspectRatio,
                                                    // Use the VideoPlayer widget to display the video.
                                                    child: VideoPlayer(_controller),
                                                  );
                                                } else {
                                                  // If the VideoPlayerController is still initializing, show a
                                                  // loading spinner.
                                                  return Center(child: CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                            onTap: (){
                                              setState(() {
                                                // If the video is playing, pause it.
                                                if (_controller.value.isPlaying) {
                                                  _controller.pause();
                                                } else {
                                                  // If the video is paused, play it.
                                                  _controller.play();
                                                }
                                              });
                                            },
                                          ),
                                          Positioned(
                                              left: 0,right: 0,
                                              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                                size: 70,)
                                          ),
                                        ],
                                      )
                                  )

                                ],
                              ),
                            )
                        ),

                      ],
                    ),

                  ),
                ),


              ],
            ),
          )
      );
    }




  }



}