
// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evcs1/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evcs1/common/theme_helper.dart';
import 'package:evcs1/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'profile_page.dart';

class RegistrationPage extends  StatefulWidget{
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();

}




class _RegistrationPageState extends State<RegistrationPage>{
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;


  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final mobile_numberEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme
                      .of(context)
                      .primaryColor, Theme
                      .of(context)
                      .secondaryHeaderColor,
                  ]
              )
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            controller: firstNameEditingController,
                            keyboardType: TextInputType.name,

                            validator: (value) {
                              RegExp regex = RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 3 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              firstNameEditingController.text = value!;
                            },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "First Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )

                          ),
                        ),

                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                              controller: lastNameEditingController,
                              keyboardType: TextInputType.name,

                              validator: (value) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return ("Last Name cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid name(Min. 3 Character)");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                lastNameEditingController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Last Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )

                          ),
                        ),

                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            controller: mobile_numberEditingController,
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                              onSaved: (val) {
                                mobile_numberEditingController.text = val!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.phone_android_outlined),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Phone Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          ),



                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            autofocus: false,
                            controller: emailEditingController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(val)) {
                              return "Enter a valid email address";
                            }
                            return null;
                            },
                              onSaved: (val) {
                                 emailEditingController.text = val!;
                                },

                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.mail),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Email",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                ),
                                ),

                          ),
                        ),



                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            autofocus: false,
                            controller: passwordEditingController,
                            obscureText: true,
                            validator: (val) {
                              RegExp regex = RegExp(r'^.{8,}$');
                              if (val!.isEmpty) {
                                return ("Password is required for login");
                              }
                              if (!regex.hasMatch(val)) {
                                return ("Enter Valid Password(Min. 8 Characters)");
                              }
                              return null;
                            },
                            onSaved: (val) {
                              passwordEditingController.text = val!;
                            },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.vpn_key),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          ),


                        const SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                            autofocus: false,
                              controller: confirmPasswordEditingController,
                              obscureText: true,
                              validator: (val) {
                                if (confirmPasswordEditingController.text !=
                                    passwordEditingController.text) {
                                  return "Password don't match";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                confirmPasswordEditingController.text = val!;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.vpn_key),
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Confirm Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                        ),
                        ),



                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme
                                        .of(context)
                                        .errorColor, fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(
                              context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: () {
                              signUp(emailEditingController.text, passwordEditingController.text);
                              },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 30.0),
                        const Text("Or create account using social media",
                          style: TextStyle(color: Colors.grey),),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alertDialog(
                                          "Google Plus",
                                          "You tap on GooglePlus social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            const SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alertDialog(
                                          "Twitter",
                                          "You tap on Twitter social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            const SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alertDialog(
                                          "Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);

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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;
    userModel.mobile_number = mobile_numberEditingController.text;
    userModel.count = 0;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => ProfilePage()),
            (route) => false);
  }
}