
// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, use_key_in_widget_constructors, use_build_context_synchronously, unnecessary_this
import 'package:evcs1/model/user_model.dart';
import 'package:evcs1/pages/locate_station.dart';
import 'package:evcs1/pages/maps.dart';
import 'package:evcs1/pages/slot_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evcs1/pages/login_page.dart';
import 'package:evcs1/pages/splash_screen.dart';
import 'package:evcs1/pages/widgets/header_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration_page.dart';
import 'add_vehicle_info.dart';


class ProfilePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  get currentAccountPicture => null;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
          this.loggedInUser = UserModel.fromMap(value.data());
          print(value.data());
          setState((){
          });
  });

  }


  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("ChargePlug",

          style: TextStyle(color: Colors.black),


        ),
        centerTitle:true,

        elevation: 0,

        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });

          }, icon: const Icon(Icons.logout)),
          const SizedBox(width:10,)
        ],
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).selectedRowColor.withOpacity(0.5),
                  ]
              )
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor,
                    ],
                  ),
                ),
                child:SingleChildScrollView(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft, height: 110,
                        child:const CircleAvatar(
                            radius: 40,
                          backgroundImage:AssetImage("images/profilepic.png"),

                        ),
                      ),
                      Text("${loggedInUser.firstName } ${loggedInUser.lastName}",
                        style: const TextStyle(fontSize: 20,
                            color: Colors.white, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text(
                  'Account Information', style: TextStyle(fontSize: 17, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),


              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.car_repair_outlined, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text(
                  'My Vehicle Information', style: TextStyle(fontSize: 17, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Add_vehicle_info(
                          title: "Vehicle_Info")));
                },
              ),



              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.map_sharp, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text('Maps',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Maps(
                          title: "Maps")));
                },
              ),


              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.restart_alt, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text(
                  'Locate Station', style: TextStyle(fontSize: 17, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Locate_station(
                          title: "Locate Station")));
                },
              ),



              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.edit_calendar_sharp, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text('Book a slot',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const slotbookingPage(
                          title: "Slot Booking Page")));
                },
              ),

              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.add_location_alt, size: _drawerIconSize, color: Theme
                    .of(context)
                    .secondaryHeaderColor,),
                title: Text('Add Charging Station',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme
                      .of(context)
                      .secondaryHeaderColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),


              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.restart_alt, size: _drawerIconSize, color: Theme.of(context).secondaryHeaderColor,),
                title: Text(
                  'Refresh', style: TextStyle(fontSize: 17, color: Theme.of(context).secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SplashScreen(
                          title: "Splash Screen")));
                },
              ),



              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                    Icons.logout, size: _drawerIconSize, color: Theme
                    .of(context)
                    .secondaryHeaderColor),
                title: Text('Logout',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme
                      .of(context)
                      .secondaryHeaderColor),
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginPage()),);
                },
              ),


              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,
                    color: Colors.black54),
                title: Text('Registration Page',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme
                      .of(context)
                      .secondaryHeaderColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegistrationPage()),);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100,
              child: const HeaderWidget(100, false, Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),),
                      ],
                    ),
                    child: Icon(
                      Icons.person, size: 80, color: Colors.grey.shade300,),
                  ),
                  const SizedBox(height: 20,),
                  const Text('ChargePlug', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  const Text(
                    'A Comprehensive Cross-app platform for helping in locating nearby e-charging stations',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        const ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle: Text("Mumbai"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(
                                              "dhanesha151001@gmail.com"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("9321635754"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.details_outlined),
                                          title: Text("About the app"),
                                          subtitle: Text(
                                              ""),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProfilePage()));
  }
}

class Utils {
  void toastMessage(message) {}
}