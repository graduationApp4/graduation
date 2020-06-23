import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feedback.dart';
import 'package:my_app/profile.dart';
import 'package:my_app/firebase_auth.dart';


FirebaseUser loggedInUser ;
final _auth = FirebaseAuth.instance;


class PaymentPage extends StatefulWidget {
  int TotalPrice;
  @override
  _PaymentPageState createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {

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
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  Stream<QuerySnapshot> getUsersCartsStreamSnapshots (BuildContext context) async* {
    final user = await firebaseAuthentication.getCurrentUser();
    yield* Firestore.instance.collection('UsersOrder').document(user.uid).collection('Orders').snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Center(
          child: Text("Payment"),
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 20 , top:10 ),
              child: Text("Total Cost" , style: TextStyle(fontSize:  20,
              ),),
            ),
            StreamBuilder(
                stream: getUsersCartsStreamSnapshots(context),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshhot) {
                  if (!snapshhot.hasData) return Text("Loading Data.. Please Wait");
                  return Column(

                    children: snapshhot.data.documents.map((document){
                      return  Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Cart Total'),
                            Text(document['OrderPrice']),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Tax'),
                  Text('0.14'),
                ],
              ),
            ),
            Container( width: 360,
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Subtotal'),
                  Text('26.50'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 90, left: 10 , top: 100 ),
              child: Text("Please, Choose Payment Way" , style: TextStyle(fontSize:  20,
              ),),
            ),
            /*Padding(
               padding: const EdgeInsets.only(),
               child: Icon(Icons.local_dining , size: 60,),
             ),*/


            Padding(
              padding: const EdgeInsets.only(left: 10 , top: 10),
              child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.only(right: 100 , left: 80),
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
              padding: const EdgeInsets.only(left: 10 , bottom: 40 , top: 15),
              child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.only(right: 100 , left: 50 ),
                  child: Text(" Pay With your Card" ,style: TextStyle(fontSize: 15 , color: Colors.white),),
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
      drawer: Drawer(),
    );
  }
}