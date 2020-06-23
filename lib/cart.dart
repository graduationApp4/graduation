import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firebase_auth.dart';
import 'timer.dart';

class Cart extends StatefulWidget {

  final String id ;

  const Cart(this.id);

  @override
  _CartState createState() => _CartState();

}

class _CartState extends State<Cart> {

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Food Cart', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        child: StreamBuilder(
            stream: getUsersCartsStreamSnapshots(context),
            builder: ( BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot) {
              if (snapshot.hasError || !snapshot.hasData)
                return CircularProgressIndicator();
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) => drawCart(context, snapshot.data.documents[index])
              );
            }
        ),
      ),
      bottomNavigationBar: _drawCartBody(),
    );
  }


  Stream<QuerySnapshot> getUsersCartsStreamSnapshots (BuildContext context) async* {
    final user = await firebaseAuthentication.getCurrentUser();
    yield* Firestore.instance.collection('UsersOrder').document(user.uid).collection('Orders').snapshots();
  }


  Widget drawCart (BuildContext context, DocumentSnapshot document){
    return Card(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(document['OrderImage']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text( document['OrderName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, left: 20.0),
                    child: Text('EGP '+ document['OrderPrice'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('Size: ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    Text(document['OrderSize'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text((document['1st OrderOthers'] == null )? "" :document['1st OrderOthers'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text((document['1st OrderOthersPrice'] == null )? "" : 'EGP'+ document['1st OrderOthersPrice'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text((document['2st OrderOthers'] == null )? "" : document['2st OrderOthers'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 95.0),
                      child: Text((document['2st OrderOthersPrice'] == null )? "" : 'EGP'+ document['2st OrderOthersPrice'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text((document['3st OrderOthers'] == null )? "" :document['3st OrderOthers'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Text((document['3st OrderOthersPrice'] == null )? "" :'EGP'+ document['3st OrderOthersPrice'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: IconButton(icon: Icon(Icons.delete, color: Colors.red,),
              onPressed: () async{
                final user = await firebaseAuthentication.getCurrentUser();
                Firestore.instance.collection('UsersOrder').document(user.uid).collection('Orders').document(document.documentID).delete();
              },
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCartBody(){
    return Container(
      height: 120.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){

                      return timer();
                    },
                  ),
                );
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Center(
                  child: Text('Confirm Order',
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
    );
  }
}