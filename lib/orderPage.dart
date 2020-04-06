import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'cart.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      //drawer: Drawer(),


      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //title: Text('Order'),
              backgroundColor: Colors.orange,
              expandedHeight: 388.00,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/1.jpg.jpg'),
              ),
            ),
            SliverFixedExtentList(

              itemExtent: 211.00,
              delegate: SliverChildListDelegate([
                Card(
                  child: Container(
                    width: 100.00,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Description",
                          style: new TextStyle(
                              fontSize: 18.00, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Burger",
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Our menu features burgers that are hand crafted with 100% Angus beef."
                              " Always fresh, never frozen. We use fresh, natural and delicious ingredients."
                              " Made to order and served medium, on toasty, classic style buns.",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),

                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 100.00 ,
                    margin:  EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
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
                          groupValue: 0,
                          title: Text('Small',style: TextStyle(
                              color: Colors.black
                          ),),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('25 EP',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: 1,
                          title: Text('Medium',style: TextStyle(
                              color: Colors.black
                          ),),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('30 EP',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: 0,
                          title: Text('Large',style: TextStyle(
                              color: Colors.black
                          ),
                          ),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('35 EP ',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),





                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 100.00 ,
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
                        RadioListTile(
                          value: 1,
                          groupValue: 0,
                          title: Text('Frize',style: TextStyle(
                              color: Colors.black
                          ),),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('5 EP',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: 1,
                          title: Text('Pepsi',style: TextStyle(
                              color: Colors.black
                          ),),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('5 EP',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.05,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: 0,
                          title: Text('Salad',style: TextStyle(
                              color: Colors.black
                          ),
                          ),
                          activeColor: Colors.orange,
                          secondary: OutlineButton(
                            child: Text('10 EP ',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),





                      ],
                    ),
                  ),
                ),

                /* Padding(

            padding: EdgeInsets.only(left: 20.00,right: 30),

            child: Row(

              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.red)
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text("01",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.red)
                  ),

                  child: Icon(Icons.minimize),

                ),
            Spacer(),
                Text("30EP",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,

                ),),
              ],
            ),
          ),*/
                /*Text('22222222222220'),
          Text('22222222222220'),
          Text('22222222222220'),
          Text('22222222222220'),*/
              ]),
            ),


          ],
        ),

      ),
      floatingActionButton:  Stack(
        //alignment: Alignment.topLeft,
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

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
          items: < BottomNavigationBarItem >[
            BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black,),
              title: Text('ADD',style: TextStyle(color: Colors.orange),),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.minimize,color: Colors.black,),
              title: Text('REMOVE',style: TextStyle(color: Colors.orange),),
            ),
          ]
      ),



    );

  }
}