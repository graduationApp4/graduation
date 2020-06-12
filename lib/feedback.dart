import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/profile.dart';
FirebaseUser loggedInUser ;
final _auth = FirebaseAuth.instance;


class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();

}

class _feedbackState extends State<feedback> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;

  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:(){

        }),

        title: Center(
          child: Text("Feedback"),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                  return ProfileScreen(loggedInUser.uid);
                },
              ),
            );
          }
          )],
      ),
      body: Container(
          color: Color(0xffE5E5E5),
          child:Column(
            children: <Widget>[
              Container(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(child: Center( child: Text(" From 1 to 5 "
                      "                                         How do you rate our service ?", style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
                  ) ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Align
                  (child: Material(
                  color: Colors.white,elevation: 14.0,borderRadius: BorderRadius.circular(24.0),shadowColor: Color(0x802196f3),
                  child:Container(
                    width: 290.0,
                    height:400.0 ,
                    child: Column(children: <Widget>[
                      Padding(
                        padding:const EdgeInsets.all(16.0),
                        child: Container(child: Text(myFeedbackText,style:TextStyle(color: Colors.black,fontSize: 22.0),),) ,

                      ),

                      Padding(
                        padding:const EdgeInsets.all(8.0),
                        child: Container(child: Icon(myFeedback,color:myFeedbackColor,size: 100.0,)) ,

                      ),
                      Padding(
                        padding:const EdgeInsets.all(8.0),
                        child: Container(
                          child: Slider(
                            min: 0.0,
                            max: 5.0,
                            divisions:5 ,
                            value: sliderValue,
                            activeColor:Color(0xffff520d),
                            inactiveColor: Colors.blueGrey ,
                            onChanged: (newValue){
                              setState(() {
                                sliderValue=newValue;
                                if(sliderValue>=0.0&&sliderValue<=1.0)
                                { myFeedback=FontAwesomeIcons.sadTear;
                                myFeedbackColor=Colors.red;
                                myFeedbackText="COULD BE BETTER";
                                }
                                if(sliderValue>=1.1&&sliderValue<=2.0)
                                { myFeedback=FontAwesomeIcons.frown;
                                myFeedbackColor=Colors.yellow;
                                myFeedbackText="BELOW AVERAGE";
                                }
                                if(sliderValue>=2.1&&sliderValue<=3.0)
                                { myFeedback=FontAwesomeIcons.meh;
                                myFeedbackColor=Colors.amber;
                                myFeedbackText="NORMAL";
                                }
                                if(sliderValue>=3.1&&sliderValue<=4.0)
                                { myFeedback=FontAwesomeIcons.smile;
                                myFeedbackColor=Colors.green;
                                myFeedbackText="GOOD";
                                }
                                if(sliderValue>=4.1&&sliderValue<=5.0)
                                { myFeedback=FontAwesomeIcons.laugh;
                                myFeedbackColor=Color(0xffff520d);
                                myFeedbackText="EXCELLENT";
                                }
                              });

                            },
                          ),
                        ) ,


                      ),
                      Padding(
                        padding:(const EdgeInsets.all(16.0)),
                        child: Container(child:Text("Your rating: $sliderValue",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)
                        ),

                      )
                      ,Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: Align(
                          alignment: Alignment.bottomCenter,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.orange,
                            child: Text('Submit',style: TextStyle(color: Colors.black),),
                            onPressed: (){


                            },
                          ),

                        ),),
                      )




                    ],),
                  ) ,
                ),

                ),
              )
            ],


          )
      ),

    );
  }


}