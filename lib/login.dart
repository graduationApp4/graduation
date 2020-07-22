import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'signup.dart';
import 'qr_code.dart';
import 'firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class _LoginState extends State<Login>{

  final _formKey = GlobalKey<FormState>();
  bool loginEmailFail = false;
  bool loginPassFail = false;
  authProblems errorType;
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }


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
                      image: ExactAssetImage('images/Logo.jpg'),
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
                  child: _drawLoginForm(),
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                //labelText: 'Username',
                errorText: loginEmailFail ? 'Couldnt find your account' : null,
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
              validator: validateEmail,
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
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                //labelText: 'Password',
                errorText: loginPassFail ? 'The password is invalid' : null,
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
                  login();
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

  Future<void> login()async{
    if( _formKey.currentState.validate() ) {
      try{
        String email = _emailController.text;
        String password = _passwordController.text;
        var user = await firebaseAuthentication.sigIn(email, password);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              return QrReader();
            },
          ),
        );
      }catch(e){
        if (Platform.isAndroid) {
          switch(e.message){
            case 'There is no user record corresponding to this identifier. The user may have been deleted.':
              errorType = authProblems.UserNotFound;
              setState(() {
                loginEmailFail = true;
              });
              break;
            case 'The password is invalid or the user does not have a password.':
              errorType = authProblems.PasswordNotValid;
              setState(() {
                loginPassFail = true;
              });
              break;
            case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
              errorType = authProblems.NetworkError;
              break;
            default:
              print('Case ${e.message} is not jet implemented');
          }
        }
        print('The error is $errorType');
      }
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Widget _drawLogin(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}