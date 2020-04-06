import 'package:flutter/material.dart';
import 'login.dart';
import'qr_code.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();

}

class _SignupState extends State<Signup>{

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 23, right: 23),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ( isLoading ) ? _drawLogin() : _drawLoginForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _drawLoginForm(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "Sign in my account",
              style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Container(
            width:50,
            height:3,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, ),
            child: Text(
              "Full Name",
              style:TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.text,
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
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Fullname';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, ),
            child: Text(
              "Phone Number",
              style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.phone,
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
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Phonenumber';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, ),
            child: Text(
              "Email",
              style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 40,
            child: TextFormField(
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
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, ),
            child: Text(
              "Password",
              style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 40,
            child: TextFormField(
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
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, ),
            child: Text(
              "Confirm Password",
              style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 40,
            child: TextFormField(
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
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter your Confirm password';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25,),
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
                "Sign Up",
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
                "You already have an account,",
                style: TextStyle(),
                ),
              FlatButton(
                child: Text(
                  "Login",
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

                        return Login();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ],
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