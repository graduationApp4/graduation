import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'orderPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

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
                new StreamBuilder(
                    stream: Firestore.instance.collection('offers').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData)
                        return Text("Loading Data.. Please Waiy");
                      return new Container(
                        height: screenHeight * 5 / 16,
                        width: screenWidth,
                        child: PageView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: snapshhot.data.documents.map((document) {
                            return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0)
                                            ]),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      document['image']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(28.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              document['name'],
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              document['tittle'],
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                          alignment: Alignment.bottomCenter,
                                          icon: new Icon(
                                            Icons.details,
                                            color: Colors.white,
                                          ),
                                          iconSize: 15.0,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return OrderPage();
                                                },
                                              ),
                                            );
                                          }))
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                      );
                    }),
                Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, right: 325.0, left: 5.0),
                    child: Text(
                      "Burger",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new StreamBuilder(
                    stream: Firestore.instance.collection('menu').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData)
                        return Text("Loading Data.. Please Waiy");
                      return new Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: snapshhot.data.documents.map((document) {
                            if (document['category'].toString() == "Burger")
                              return new Container(
                                width: 160.0,
                                child: Card(
                                    color: Colors.white,
                                    child: Wrap(
                                      children: <Widget>[
                                        Container(
                                          height:150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      document['image']),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:5.0),
                                          child: Container(
                                            height: 50,
                                            child: ListTile(
                                              title: Text(document['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                              subtitle:
                                                  Text(document['content'],style: TextStyle(fontSize: 12),),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:30.0,left: 20.0),
                                          child: Text("price: " +
                                              document['price_large']),
                                        ),
                                        Padding(padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: new IconButton(
                                              alignment: Alignment.topCenter,
                                              icon: new Icon(
                                                Icons.details,
                                                color: Colors.black,
                                              ),
                                              iconSize: 25.0,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return OrderPage(name: document['name']);
                                                    },
                                                  ),
                                                );
                                              }),
                                        ),
                                        ),
                                      ],
                                    )),
                              );
                            return new Container(
                            );
                          }).toList(),
                        ),
                      );
                    }),
                Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, right: 325.0, left: 5.0),
                    child: Text(
                      "Pizza",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new StreamBuilder(
                    stream: Firestore.instance.collection('menu').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData)
                        return Text("Loading Data.. Please Waiy");
                      return new Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: snapshhot.data.documents.map((document) {
                            if (document['category'].toString() == "Pizza")
                              return new Container(
                                width: 160.0,
                                child: Card(
                                    color: Colors.white,
                                    child: Wrap(
                                      children: <Widget>[
                                        Container(
                                          height:150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      document['image']),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:5.0),
                                          child: Container(
                                            height: 50,
                                            child: ListTile(
                                              title: Text(document['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                              subtitle:
                                              Text(document['content'],style: TextStyle(fontSize: 12),),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:30.0,left: 20.0),
                                          child: Text("price: " +
                                              document['price_large']),
                                        ),
                                        Padding(padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: new IconButton(
                                                alignment: Alignment.topCenter,
                                                icon: new Icon(
                                                  Icons.details,
                                                  color: Colors.black,
                                                ),
                                                iconSize: 25.0,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return OrderPage(name: document['name']);
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            return new Container(

                            );
                          }).toList(),
                        ),
                      );
                    }),
                Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, right: 305.0, left: 5.0),
                    child: Text(
                      "Chicken",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new StreamBuilder(
                    stream: Firestore.instance.collection('menu').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData)
                        return Text("Loading Data.. Please Waiy");
                      return new Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: snapshhot.data.documents.map((document) {
                            if (document['category'].toString() == "Chicken")
                              return new Container(
                                width: 160.0,
                                child: Card(
                                    color: Colors.white,
                                    child: Wrap(
                                      children: <Widget>[
                                        Container(
                                          height:150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      document['image']),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:5.0),
                                          child: Container(
                                            height: 50,
                                            child: ListTile(
                                              title: Text(document['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                              subtitle:
                                              Text(document['content'],style: TextStyle(fontSize: 12,),),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:30.0,left: 20.0),
                                          child: Text("price: " +
                                              document['price_large']),
                                        ),
                                        Padding(padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: new IconButton(
                                                alignment: Alignment.topCenter,
                                                icon: new Icon(
                                                  Icons.details,
                                                  color: Colors.black,
                                                ),
                                                iconSize: 25.0,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return OrderPage(name: document['name']);
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            return new Container(
                            );
                          }).toList(),
                        ),
                      );
                    }),
                Padding(
                    padding:
                    EdgeInsets.only(top: 20.0, right: 220.0, left: 5.0),
                    child: Text(
                      "Flipping Noodles",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new StreamBuilder(
                    stream: Firestore.instance.collection('menu').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshhot) {
                      if (!snapshhot.hasData)
                        return Text("Loading Data.. Please Waiy");
                      return new Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: snapshhot.data.documents.map((document) {
                            if (document['category'].toString() ==
                                "Flipping Noodles")
                              return new Container(
                                width: 160.0,
                                child: Card(
                                    color: Colors.white,
                                    child: Wrap(
                                      children: <Widget>[
                                        Container(
                                          height:150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      document['image']),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:5.0),
                                          child: Container(
                                            height: 50,
                                            child: ListTile(
                                              title: Text(document['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                              subtitle:
                                              Text(document['content'],style: TextStyle(fontSize: 12),),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:30.0,left: 20.0),
                                          child: Text("price: " +
                                              document['price_large']),
                                        ),
                                        Padding(padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: new IconButton(
                                                alignment: Alignment.topCenter,
                                                icon: new Icon(
                                                  Icons.details,
                                                  color: Colors.black,
                                                ),
                                                iconSize: 25.0,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return OrderPage(name: document['name']);
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    )),
                                // ignore: missing_return, missing_return
                              );
                            return new Container();
                          }).toList(),
                        ),
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
