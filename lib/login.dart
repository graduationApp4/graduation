import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'signup.dart';
import 'qr_code.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40),
            width: double.infinity,
            height: MediaQuery.of(context).size.height/2.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              )
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ( isLoading ) ? _drawLogin() : _drawLoginForm(),
              ),
            ),
          ),
        ],
      )
      );
  }

  Widget _drawLoginForm(){
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Login in my account",
                style:TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.20,
                  fontWeight: FontWeight.bold,
                ),
                ),
            Container(
              width:50,
              height:3,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0, ),
              child: Text(
                "Email",
                style:TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  //labelText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                       width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    )
                  ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          )
                      ),
                  prefixIcon:Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "example@gmail.com",
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Username';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, ),
              child: Text(
                "Password",
                style:TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  //labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      )
                  ),
                prefixIcon:Icon(
                Icons.lock,
                  color: Colors.grey,
              ),
                hintText: "",
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Password';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top :12, bottom: 10),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
            Container(
                width: double.infinity,
                  child: RaisedButton(
                    color: Colors.orange,
                    onPressed: (){
                      if( _formKey.currentState.validate() ) {
                        setState(() {
                          isLoading = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){

                                return QrReader();
                              },
                            ),
                          );
                        });

                      }else{
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } ,
                    child: Text(
                        "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Don't have an account?",
                  style:TextStyle(),
                  ),
                FlatButton(
                  child: Text(
                    "Sigin Up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLogin(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

