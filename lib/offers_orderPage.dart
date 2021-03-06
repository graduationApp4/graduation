import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:my_app/firebase_auth.dart';
import 'cart.dart';
import 'package:my_app/profile.dart';
FirebaseUser loggedInUser ;
final _auth = FirebaseAuth.instance;


class OffersOrder extends StatefulWidget {
  String name;
  final String qrText;
  OffersOrder({Key key,this.name,this.qrText}):super(key: key);

  @override
  _OffersOrderState createState() => _OffersOrderState();
}

class _OffersOrderState extends State<OffersOrder> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _autoValidate = false;


  String image;

  var radio1 =0;
  String radioval,radioval2;
  String SP,MP,LP;

  var check1 =false;
  String checkval,checkval2;

  var check2 =false;
  String checkval3,checkval4;

  var check3 =false;
  String checkval5,checkval6;

  void rdioChecked(int val) {
    setState(() {
      radio1=val;
      switch(radio1){
        case 1:
          radioval= 'Small ';
          radioval2=SP;
          break;
        case 2:
          radioval = 'Medium   ';
          radioval2=MP;
          break;
        case 3:
          radioval = 'Large   ';
          radioval2=LP;
          break;
      }
    });
  }

  void checkedbox1(bool val){
    setState(() {
      check1=val;
      if(check1==true)
      { checkval = 'Frize';
      checkval2 ='8';
      }
    });
  }

  void checkedbox2(bool val){
    setState(() {
      check2=val;
      if(check2==true)
      { checkval3 = 'Pepsi';
      checkval4 ='5';
      }

    });
  }

  void checkedbox3(bool val){
    setState(() {
      check3=val;
      if(check3==true)
      { checkval5= 'Salad';
      checkval6 ='10';
      }
    });
  }

  createdata()async{
    FirebaseAuthentication firebaseAuthentication= FirebaseAuthentication();
    var user= await firebaseAuthentication.getCurrentUser();
    DocumentReference  ds= Firestore.instance.collection('UsersOrder').document(user.uid).collection('Orders').document();


    Map<String,dynamic> orders={
      "OrderSize":radioval,
      "OrderPrice":radioval2,
      "OrderName": widget.name,
      "OrderImage":image,
      "1st OrderOthers": checkval,
      "1st OrderOthersPrice": checkval2,
      "2st OrderOthers": checkval3,
      "2st OrderOthersPrice": checkval4,
      "3st OrderOthers": checkval5,
      "3st OrderOthersPrice": checkval6,
      "TableNumber":widget.qrText,
      "status":"in progress",
    };
    ds.setData(orders).whenComplete((){
      print("order done");
    });
  }

  staffOrder()async{
    DocumentReference  ds= Firestore.instance.collection('Staff').document('JasNCMG7GwggtriIvFuqfN9IhQz2').collection('orders').document();

    Map<String,dynamic> orders={
      "OrderSize":radioval,
      "OrderPrice":radioval2,
      "OrderName": widget.name,
      "OrderImage":image,
      "1st OrderOthers": checkval,
      "1st OrderOthersPrice": checkval2,
      "2st OrderOthers": checkval3,
      "2st OrderOthersPrice": checkval4,
      "3st OrderOthers": checkval5,
      "3st OrderOthersPrice": checkval6,
      "TableNumber":widget.qrText ,
      "status":"in progress",
    };
    ds.setData(orders).whenComplete((){
      print("order done");
    });
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _validateInputs(){
    final form = _formKey.currentState;
    if (form.validate()){
      if(radio1<1){
        _showSnackBar('Please Select Your Order Size');
      } else{
        createdata();
        staffOrder();
        _showSnackBar('Order Added Successfully');
      }
    }
  }

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
      key: _scaffoldKey,

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text("Order"),
        ),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.person),
              onPressed: () {
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


      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                StreamBuilder(
                    stream: Firestore.instance.collection('offers').snapshots() ,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                      return Column(
                        children: snapshhot.data.documents.map((document){
                          if(document['name']==widget.name)
                            return     Column(
                              children: <Widget>[
                                Container (
                                  height: 200.00,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(image= document['image']),
                                        fit: BoxFit.cover,
                                      ),

                                      borderRadius: BorderRadius.only(
                                        bottomRight:  Radius.circular(40.0),
                                        bottomLeft:  Radius.circular(40.0),
                                      )
                                  ),
                                )
                              ],
                            );
                          return Container();
                        }).toList(),
                      );
                    }
                ),

                StreamBuilder(
                    stream: Firestore.instance.collection('offers').snapshots() ,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                      return Column(
                        children: snapshhot.data.documents.map((document){
                          if(document['name']==widget.name)
                            return Card(
                              child: Container(
                                width: 400.00,
                                margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new SizedBox(
                                      height: 5,
                                    ),
                                    new Text(
                                      "Description",
                                      style: new TextStyle(
                                          fontSize: 18.00, fontWeight: FontWeight.w700),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text(widget.name,
                                      style: new TextStyle(
                                          fontSize: 16.0, fontWeight: FontWeight.w500),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text(document['description'],
                                      style: new TextStyle(
                                          fontSize: 14.0, fontWeight: FontWeight.w400),
                                    ),

                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          return Container();
                        }).toList(),
                      );
                    }
                ),

                StreamBuilder(
                    stream: Firestore.instance.collection('offers').snapshots() ,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                      return Column(
                        children: snapshhot.data.documents.map((document){
                          if(document['name']==widget.name)
                            return  Card(
                              child: Container(
                                margin:  EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Form(
                                  key: _formKey,
                                  autovalidate: _autoValidate,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Size",
                                        style:  TextStyle(
                                            fontSize: 18.0, fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 1.5,
                                      ),
                                      RadioListTile(
                                        value: 1,
                                        groupValue: radio1,
                                        onChanged: rdioChecked,
                                        title: Text('Small',style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        activeColor: Colors.orange,
                                        secondary: Text(SP= document['price_small'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0.05,
                                        color: Colors.grey,
                                      ),
                                      RadioListTile(
                                        value: 2,
                                        groupValue: radio1,
                                        onChanged: rdioChecked ,
                                        title: Text('Medium',style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        activeColor: Colors.orange,
                                        secondary: Text(MP= document['price_medium'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0.05,
                                        color: Colors.grey,
                                      ),
                                      RadioListTile(
                                        value: 3,
                                        groupValue: radio1,
                                        onChanged: rdioChecked ,
                                        title: Text('Large',style: TextStyle(
                                            color: Colors.black
                                        ),
                                        ),
                                        activeColor: Colors.orange,
                                        secondary: Text(LP= document['price_large'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          return Container();
                        }).toList(),
                      );
                    }
                ),

                Card(
                  child: Container(
                    margin:  EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Others",
                          style:  TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 1.5,
                        ),
                        CheckboxListTile(
                          value: check1,
                          onChanged: checkedbox1,
                          title: Text('Frize',style: TextStyle(
                            color: Colors.black,
                          ),),
                          activeColor: Colors.orange,
                          secondary: Text('8 EP',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        CheckboxListTile(
                          value: check2,
                          onChanged: checkedbox2,
                          title: Text('Pepsi',style: TextStyle(
                              color: Colors.black
                          ),),
                          activeColor: Colors.orange,
                          secondary: Text('5 EP',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        CheckboxListTile(
                          value: check3,
                          onChanged: checkedbox3,
                          title: Text('Salad',style: TextStyle(
                              color: Colors.black
                          ),
                          ),
                          activeColor: Colors.orange,
                          secondary: Text('10 EP',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),


      floatingActionButton:  Stack(
        children: <Widget>[
          new FloatingActionButton(
            child: new Icon(Icons.shopping_cart,),
            backgroundColor: Colors.orange,

            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return Cart(loggedInUser.uid);
                  },
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,


      bottomNavigationBar:  BottomAppBar(
        color: Colors.orange,
        elevation: 0.0,
        shape:  CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: new Container(
          height: 50.0,
          decoration: new BoxDecoration(color: Colors.white12),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              new Container(
                width: 100.00,
                child: FlatButton(
                  child: Text("ADD",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),

                  onPressed: (){
                    _validateInputs();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}