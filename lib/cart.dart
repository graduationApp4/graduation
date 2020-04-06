import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'payment.dart';
import 'timer.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();

}

class _CartState extends State<Cart> {

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
      body: ListView(
        padding: EdgeInsets.only(top: 25),
        children: <Widget>[
          _drawCart(),
          _drawCart(),
          _drawCart(),
          _drawCart(),
          _drawCart(),
          _drawCart(),
        ],
      ),
      bottomNavigationBar: _drawCartBody(),
    );
  }


  Widget _drawCart(){
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
                  image: ExactAssetImage('assets/images/pizza.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0.0,5.0),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Pizaa Hut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('2D',
                  style: TextStyle(
                  fontSize: 15,
                    color: Colors.orangeAccent,
                ),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.star , color: Colors.orangeAccent,),
                  ),
                  IconButton(
                    icon: Icon(Icons.star, color: Colors.orangeAccent,),
                  ),
                  IconButton(
                    icon: Icon(Icons.star_half, color: Colors.orangeAccent,),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: IconButton(icon: Icon(Icons.close),
                onPressed: (){},
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCartBody(){
    return Container(
      height: 290.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cart Total'),
                Text('23.0'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Discount'),
                Text('3.0'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tax'),
                Text('0.50'),
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