import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'orderPage.dart';

var bannerItems = ["Burger","Cheese Chilly","Noodles","Pizza"];
var bannerImage = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg"

];

class MyHomePage extends StatelessWidget {
  @override
  Widget build (BuildContext context){

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(icon:Icon(Icons.menu),onPressed:(){
        }),
        title: Center(
          child: Text("Menu"),
        ),
        actions: <Widget>[
          IconButton(icon: Icon (Icons.person), onPressed: (){

          })

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
                BannerWidgetArea(),
                Padding(padding: EdgeInsets.only(top:20.0,right: 250.0,left: 5.0),
                    child: Text("Most Popular",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)

                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
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
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:0.1,right: 300.0,left: 5.0),
                    child: Text("Blue Hill",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)

                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/bluehill.jpg"),
                              ListTile(
                                title: Text("Blue Hill"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:0.1,right: 220.0,left: 5.0),
                    child: Text("Flipping Noodles",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)

                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/flipping.jpg"),
                              ListTile(
                                title: Text("Flipping Noodles"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:0.1,right: 325.0,left: 5.0),
                    child: Text("Burger",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/hawkers.jpg"),
                              ListTile(
                                title: Text("The Hawkers"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:0.1,right: 325.0,left: 5.0),
                    child: Text("Pizza",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.asset("images/pizzahut.jpg"),
                              ListTile(
                                title: Text("Pizza Hut"),
                                subtitle: Text("Burgers " + " | " + "Chinese " + " | " + "Fast Food " + " | " + "Italian " + " | " "Juice"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    PageController controller = PageController(
        viewportFraction: 0.8, initialPage: 1);
    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerImage.length; x++) {
      var bannerView = Padding(padding: EdgeInsets.all(10.0),
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
                            spreadRadius: 1.0
                        )
                      ]
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      bannerImage[x],
                      fit: BoxFit.cover,
                    )
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(bannerItems[x],
                        style: TextStyle(fontSize: 25.0, color: Colors.white),),
                      Text("More Than 40% Off",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),)
                    ],
                  ),
                )
              ],
            ),
          )
      );
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