import 'package:flutter/material.dart';
import 'animation/fadeanimation.dart';
import 'login.dart';
import 'signup.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();

}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/started.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
            ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(1,Text('Welcome To Our Resturant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
                SizedBox(height: 100,),
                /*FadeAnimation(1,Text('See resturants nearby by \nadding location',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.4,
                  fontSize: 18,
                ),
               )
               ),*/
            SizedBox(height: 220,),
              FadeAnimation(1.7,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ]
                    )
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){

                            return Login();
                          },
                        ),
                      );
                    },
                    minWidth: double.infinity,
                    child: Text('Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                )),
              SizedBox(height: 30,),
              FadeAnimation(2,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ]
                      )
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){

                            return Signup();
                          },
                        ),
                      );
                    },
                    minWidth: double.infinity,
                    child: Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}