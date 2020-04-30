import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'cart.dart';


class OrderPage extends StatefulWidget {
  String name;
  OrderPage({Key key,this.name}):super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  var radio1 =0;
  var check1 =false;
  var check2 =false;
  var check3 =false;

  void rdioChecked(int val){
    setState(() {
      radio1=val;
    });
  }
  void checkedbox1(bool val){
    setState(() {
      check1=val;
    });
  }
  void checkedbox2(bool val){
    setState(() {
      check2=val;
    });
  }
  void checkedbox3(bool val){
    setState(() {
      check3=val;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
   /* appBar: new AppBar(
      title: new Text("Test"),
    ),
     body: StreamBuilder(
       stream: Firestore.instance.collection('menu').snapshots() ,
        builder: (BuildContext context,
         AsyncSnapshot<QuerySnapshot> snapshhot){
          if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
          return Column(
            children: <Widget>[
             new Text(snapshhot.data.documents[0]['name']),
              new Text(snapshhot.data.documents[0]['description']),
            ],
          );
    },
     ),*/

   //drawer: Drawer(),


      body: Center(
        
        child: CustomScrollView(
          slivers: <Widget>[
      /* new  StreamBuilder(
                stream: Firestore.instance.collection('menu').snapshots() ,
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshhot) {
                  if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                  return Column(
                    children: snapshhot.data.documents.map((document){
                      if(document['name']==widget.name)
                      return SliverAppBar (
                        //title: Text('Order'),
                        backgroundColor: Colors.orange,
                        expandedHeight: 388.00,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(document['image'],fit: BoxFit.cover),
                        ),
                      );
                      return SliverAppBar();
                    }).toList(),
                  );

                }
            ),*/
      /*   SliverAppBar (
        //title: Text('Order'),
        backgroundColor: Colors.orange,
          expandedHeight: 388.00,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/images/1.jpg.jpg'),

          ),
        ),*/


            SliverList(
              delegate: SliverChildListDelegate([
               StreamBuilder(
                   stream: Firestore.instance.collection('menu').snapshots() ,
                   builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshhot) {
                     if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                     return Column(
                       children: snapshhot.data.documents.map((document){
                         if(document['name']==widget.name)
                         return  Card(
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
                    stream: Firestore.instance.collection('menu').snapshots() ,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                      return Column(
                        children: snapshhot.data.documents.map((document){
                          if(document['name']==widget.name)
                          return  Card(
                            child: Container(
                              margin:  EdgeInsets.only(left: 20.0, right: 20.0),
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
                                    value: 0,
                                    groupValue: radio1,
                                    onChanged: rdioChecked ,
                                    title: Text('Small',style: TextStyle(
                                        color: Colors.black
                                    ),),
                                    activeColor: Colors.orange,
                                    secondary: Text(document['price_large'],
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
                                    value: 1,
                                    groupValue: radio1,
                                    onChanged: rdioChecked ,
                                    title: Text('Medium',style: TextStyle(
                                        color: Colors.black
                                    ),),
                                    activeColor: Colors.orange,
                                    secondary: Text(document['price_medium'],
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
                                    title: Text('Large',style: TextStyle(
                                        color: Colors.black
                                    ),
                                    ),
                                    activeColor: Colors.orange,
                                    secondary: Text(document['price_small'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                    ),
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
                          secondary: Text('5 EP',
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

                    return Cart();
                  },
                ),
              );
            },
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.orangeAccent,
            child: new Text(
              "0",
              style: new TextStyle(
                  color: Colors.black, fontSize: 12.0
              ),
            ),
          ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
          items: < BottomNavigationBarItem >[

            BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black),
              title: Text('ADD',style: TextStyle(color: Colors.orange)),

            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.minimize,color: Colors.black,),
              title: Text('REMOVE',style: TextStyle(color: Colors.orange)),

            ),
          ],

      ),

    );

  }
}