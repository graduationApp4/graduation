import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 250, right: 80),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text(
                  'To our Restaurant',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 24, left: 60, top: 60, right: 20),
                child: Container(
                  width: 300,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        letterSpacing: 1.5,
                      ),
                    ),
                    color: Colors.amberAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){

                            return Signup();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 24, left: 60, top: 15, right: 20),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      ' LOGIN ',
                      style: TextStyle(
                        letterSpacing: 1.5,
                      ),
                    ),
                    color: Colors.amberAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context){
                                 return Login();
                      },
                      ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  }
