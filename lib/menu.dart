import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'orderPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var bannerItems = ["Burger", "Cheese Chilly", "Noodles", "Pizza"];
var bannerImage = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg"
];


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
  final String _qrText;

  MyHomePage(this._qrText);
}

class _MyHomePageState extends State<MyHomePage> {
  Firestore firestore = Firestore.instance;

  Future<void> addQr() {
    Map<String, dynamic> qr = {
      'result': widget._qrText,
    };
    firestore.collection('qr-codes').add(qr).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    addQr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Center(
          child: Text("Menu"),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: () {})
        ],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               new BannerWidgetArea(),
               new StreamBuilder(
                   stream: Firestore.instance.collection('menu').snapshots(),
                   builder: (BuildContext context,
                       AsyncSnapshot<QuerySnapshot> snapshhot) {
                     if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                     return new Container(
                       margin: EdgeInsets.symmetric(vertical: 20.0),
                       height: 320,
                       child:ListView(
                         scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                         children: snapshhot.data.documents.map((document) {
                           return new Container(
                             width: 160.0,
                             child: Card(
                                 color: Colors.white,
                                 child: Wrap(
                                   children: <Widget>[
                                     Image.network(document['image']),
                                 Padding(padding: EdgeInsets.only(top: 10),
                                     child: Container(
                                       height: 80,
                                       child: ListTile(
                                         title: Text(document['name']),
                                         subtitle: Text(document['content']),
                                       ),
                                     ),),
                                     Padding(padding: EdgeInsets.only(left:20.0,top: 0.01),
                                       child: Text("price: " + document['price_large']),
                                     ),
                                     Center(
                                       child: new IconButton(
                                           alignment: Alignment.topCenter,
                                           icon: new Icon(Icons.details,color: Colors.black,),
                                           iconSize: 25.0,
                                           onPressed: (){
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context){
                                                   return OrderPage();
                                                 },
                                               ),
                                             );
                                           }
                                       ),
                                     ),
                                   ],
                                 )
                             ),
                           );
                         }).toList(),
                       ) ,

                     );

                   }),
                new StreamBuilder(
                    stream: Firestore.instance.collection('menu').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData) return Text("Loading Data.. Please Waiy");
                      return new Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 320,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: snapshhot.data.documents.map((document) {
                            return new Container(
                              width: 160.0,
                              child: Card(
                                  color: Colors.white,
                                  child: Wrap(
                                    children: <Widget>[
                                      Image.network(document['image']),
                                      Padding(padding: EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 80,
                                          child: ListTile(
                                            title: Text(document['name']),
                                            subtitle: Text(document['content']),
                                          ),
                                        ),),
                                      Padding(padding: EdgeInsets.only(left:20.0,top: 0.01),
                                        child: Text("price: " + document['price_large']),
                                      ),
                                      Center(
                                        child: new IconButton(
                                            alignment: Alignment.topCenter,
                                            icon: new Icon(Icons.details,color: Colors.black,),
                                            iconSize: 25.0,
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context){
                                                    return OrderPage();
                                                  },
                                                ),
                                              );
                                            }
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            );
                          }).toList(),
                        ) ,

                      );

                    }),

              ],
            ),

          ),

        ),

      ),

    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);
    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerImage.length; x++) {
      var bannerView = Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0)
                      ]),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      bannerImage[x],
                      fit: BoxFit.cover,
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bannerItems[x],
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      Text(
                        "More Than 40% Off",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
      banners.add(bannerView);
    }
    return Container(
      height: screenHeight * 5 / 16,
      width: screenWidth,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}

