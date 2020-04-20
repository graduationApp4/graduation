import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_auth.dart';
import 'login.dart';
import'qr_code.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();

}

class _SignupState extends State<Signup>{

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String error ;


  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

  }


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
                child: _drawLoginForm(),
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
              controller: _nameController,
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
              controller: _phoneController,
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
              controller: _emailController,
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
              validator: validateEmail,
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
              controller: _passwordController,
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
              controller: _confirmPasswordController,
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
                if(value != _passwordController.text)
                  return 'Not Match With Password';
                return null;
              },
            ),
          ),
          SizedBox(height: 25,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.orange,
              onPressed: ()async{
                if( _formKey.currentState.validate() ) {
                  try{
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    var user = await firebaseAuthentication.register(email, password);
                    Firestore.instance.collection('users').document(user.uid).setData(
                        {
                          'name' : _nameController.text,
                          'email': _emailController.text,
                          'phone' : _phoneController.text,
                          'password': _passwordController.text,
                          'confirm_password': _confirmPasswordController.text,
                        }
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return QrReader();
                        },
                      ),
                    );
                  }catch(e){
                    print(e);
                    setState((){
                      error = e.message;
                    });
                  }
                }else{
                  setState(() {
                    _autoValidate = true;
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
            ],
          ),
        ],
      ),
    );
  }

  Widget showAlert(){
    if(error !=null){
      return Container(
        color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                  child: Text(error, maxLines:3)
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: (){
                  setState(() {
                    error =null;
                  });
                },
              ),
            ]
        ),
      );
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