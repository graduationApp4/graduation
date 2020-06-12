import 'package:my_app/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/profile_structure.dart';
import 'package:my_app/profile_model.dart';
import 'package:my_app/firebase_auth.dart';



FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  final String id ;


  ProfileScreen(this.id);



  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;

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
    return SafeArea(
      child: Scaffold(

          appBar: AppBar(
            title: Center(child: Text('Profile',style: TextStyle(
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * .05
            ),),),
            backgroundColor: Colors.orange,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person,color: Colors.white,size:MediaQuery
                    .of(context)
                    .size
                    .width * .07 ,),
              )],

          ),
          body: Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Column(
              children: <Widget>[
                StreamBuilder(
                    stream: Firestore.instance
                        .collection('users')
                        .document(widget.id)
                        .snapshots(),
                    builder: (context , snapshot){
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      name = snapshot.data['name'];
                      String email = snapshot.data['email'];
                      String phone = snapshot.data['phone'];

                      List<ProfileModel> User = [
                        ProfileModel('Name',name, Icons.person),
                        ProfileModel('Email',email, Icons.email),
                        ProfileModel('Phone',phone, Icons.phone),
                      ];

                      return Column(
                        children: <Widget>[
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: User.length,
                              itemBuilder: (context , index){
                                return Profile(User[index].title,User[index].subtitle,User[index].icon);
                              }
                          ),
                        ],
                      );
                    }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        await FirebaseAuthentication().signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=> Login()), (route)=> false);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      height: 50.0,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(
                        child: Text("Sign Out",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );

  }
}