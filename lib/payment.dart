import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feedback.dart';
class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        elevation: 0,
        backgroundColor:  Colors.orange,
        title: Text("FooDate"),
        centerTitle: true,
      ),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40 , bottom: 40),
              child: Icon(Icons.check_circle , size: 50,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 250, left: 40 ),
              child: Text("Please, Choose Payment Way" , style: TextStyle(fontSize:  20,
              ),),
            ),
            /*Padding(
               padding: const EdgeInsets.only(bottom: 600),
               child: Icon(Icons.local_dining , size: 200,),
             ),  */
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.only(right: 100 , left: 100),
                  child: Text("Pay With Cash ", style: TextStyle (fontSize:15 , color: Colors.white), ),
                ),
                color: Colors.orange,
                focusColor: Colors.black,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){

                        return feedback();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40 , bottom: 40 , top: 50),
              child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.only(right: 100 , left: 72 ),
                  child: Text("Pay With your Card" ,style: TextStyle(fontSize: 15 , color: Colors.white),),
                ),
                color: Colors.orange,
                focusColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){

                        return feedback();
                      },
                    ),
                  );
                },
              ),
            ),
          ],

        ),
      ),
      /* body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder:(context,index) {
              return Stack(
                children: <Widget>[
                  Container(
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 350),
                        child: Icon(Icons.check_circle , size: 50,),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text("Choose Your Payment Way" ,
                          style: TextStyle(color: Colors.black , fontSize: 25 ),
                        textAlign: TextAlign.center,),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
       Align(
         alignment: Alignment.bottomCenter,
         child: Padding(
           padding: const EdgeInsets.only(bottom: 250),
           child: SizedBox(
             width: 350,
             height: 50,
             child: RaisedButton(
               color: Colors.redAccent,
               child: Padding(
                 padding: const EdgeInsets.only(left: 40.0 , right: 40.0),
                 child: Text("Pay By Cash" , style: TextStyle (color: Colors.white , fontSize: 20,)),
               ),
               onPressed: (){},
             ),
           ),
         ),

       )

        ],
      ), */

      drawer: Drawer(),
    );
  }
}