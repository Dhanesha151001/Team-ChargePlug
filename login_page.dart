
// ignore_for_file: prefer_final_fields, sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api, avoid_print

//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:evcs1/common/theme_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 150;

  final _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    passwordController.dispose();
    super.dispose();
  }

  //Key _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  String? errorMessage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign-in into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Email can't be empty";
                                    }
                                    else if (!RegExp(
                                        r"^[a-zA-Z\d.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z\d](?:[a-zA-Z\d-]{0,253}[a-zA-Z\d])?(?:\.[a-zA-Z\d](?:[a-zA-Z\d-]{0,253}[a-zA-Z\d])?)*$")
                                        .hasMatch(val)) {
                                      return "Enter a valid username";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShadow(),
                              ),



                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _isHidden,

                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "Enter your Password",
                                    helperText: "Password must contain special character",
                                    helperStyle:const TextStyle(color:Colors.green),
                                    fillColor: Colors.white,
                                    filled: true,
                                          suffixIcon: IconButton(

                                             icon: Icon(_isHidden? Icons.visibility: Icons.visibility_off),
                                              padding: EdgeInsets.all(0),
                                              alignment: Alignment.centerLeft,
                                            onPressed: () {
                                               setState(()
                                               {
                                                 _isHidden = !_isHidden;
                                                 },
                                               );
                                               },
                                          ),
                                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    else if (!RegExp(
                                        r'^(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$')
                                        .hasMatch(val)) {
                                      return "Enter a valid password";
                                    }
                                    return null;
                                  },

                                  onSaved: (value) {
                                    passwordController.text = value!;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShadow(),

                              ),

                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: Text.rich(

                                    TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Forgot Your Password?',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPasswordPage()));
                                              },
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor),
                                          ),
                                        ]
                                    )


                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(
                                    context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),

                                    child: Text('Log In'.toUpperCase(),
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),),
                                  ),
                                       onPressed: () {
                                     signIn(emailController.text, passwordController.text);
                                       },

                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Don't have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegistrationPage()));
                                              },
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),


    );
  }
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ProfilePage())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}



