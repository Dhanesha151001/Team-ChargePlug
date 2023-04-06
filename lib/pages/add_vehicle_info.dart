//ignore_for_file :

import 'package:evcs1/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Add_vehicle_info extends StatefulWidget {
  const Add_vehicle_info({Key? key, required String title}) : super(key: key);
  @override
  _Add_vehicle_infoState createState() => _Add_vehicle_infoState();
}

class _Add_vehicle_infoState extends State<Add_vehicle_info> {
  User? user = FirebaseAuth.instance.currentUser;
  String? dropdownValue1;
  String? dropdownValue2;
  int count= 0;
  UserModel loggedInUser = UserModel();
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Vehicle Information"), centerTitle: true,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //box decoration yaha add krna hai
                Padding(
                padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                        dropdownValue2 = null;      // reset value of dropdownValue2
                         });
                      },
                    hint:const Text("Select the vehicle manufacturer"),
                    items: <String>['Tata Motors', 'Mahindra', 'Hyundai','MG Motors','Kia','Volvo', 'Mercedes','Audi','Porsche', 'BMW','Jaguar','Citroen', 'BYD']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all (30.0),
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      onChanged: (newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
                      },
                    hint:const Text("Select the vehicle model"),
                    items: (dropdownValue1 == 'Tata Motors'
                    ? <String>['E-Tigor', 'Nexon EV', 'Tigor EV Ziptron', 'Tiago EV']
                    : (dropdownValue1 == 'Mahindra'
                    ? <String>['E-Verito', 'e20 Plus 8', 'XUV 400']
                    :(dropdownValue1 == 'Hyundai'
                    ? <String>['Kona']
                    :(dropdownValue1 == 'MG Motors'
                    ? <String>['ZS EV']
                    :(dropdownValue1 == 'Jaguar'
                    ? <String>['I-PACE']
                    :(dropdownValue1 == 'Audi'
                    ? <String>['e-tron GT','RS e-tron GT','e-tron']
                    :(dropdownValue1 == 'Mercedes'
                    ? <String>['EQC','580 EQS','Benz EQB']
                    :(dropdownValue1 == 'Porsche'
                    ? <String>['Taycan']
                    :(dropdownValue1 == 'Kia'
                    ? <String>['EV6']
                    :(dropdownValue1 == 'BMW'
                    ? <String>['i4']
                    :(dropdownValue1 == 'Volvo'
                    ? <String>['XC40 Recharge']
                    :(dropdownValue1 == 'Citroen'
                    ? <String>['ec3']
                    :(dropdownValue1 == 'BYD'
                    ? <String>['Atto3','e6']
                    : <String>[])))))))))))))
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),



            if (dropdownValue1 == 'Tata Motors' && dropdownValue2 == 'E-Tigor')
              const Text("Bharat AC001 , Bharat DC001 GB/T"),
            if (dropdownValue1 == 'Tata Motors' && dropdownValue2 == 'Nexon EV')
              const Text("AC type-2 , CCS-2"),
            if (dropdownValue1 == 'Tata Motors' && dropdownValue2 == 'Tigor EV Ziptron')
              const Text("AC type-2 , CCS-2"),
            if (dropdownValue1 == 'Tata Motors' && dropdownValue2 == 'Tiago EV')
              const Text("CCS-2 , AC type-2"),

            if (dropdownValue1 == 'Mahindra' && dropdownValue2 == 'E-Verito')
              const Text("AC type-2 , Bharat DC001 GB/T"),
            if (dropdownValue1 == 'Mahindra' && dropdownValue2 == 'e20 Plus 8')
              const Text("AC type-2 , Bharat DC001 GB/T"),
            if (dropdownValue1 == 'Mahindra' && dropdownValue2 == 'XUV 400')
              const Text("CCS-2 , AC Type-2"),

            if (dropdownValue1 == 'Hyundai' && dropdownValue2 == 'Kona')
              const Text("AC type-2 , CCS-2"),

            if (dropdownValue1 == 'MG Motors' && dropdownValue2 == 'ZS EV')
              const Text("AC Type-2 , CCS-2"),

            if (dropdownValue1 == 'Jaguar' && dropdownValue2 == 'I-PACE')
              const Text("AC Type-2 , CCS-2"),

            if (dropdownValue1 == 'Mercedes' && dropdownValue2 == 'EQC')
              const Text("CCS-2 , AC Type-2"),
            if (dropdownValue1 == 'Mercedes' && dropdownValue2 == '580 EQS')
              const Text("CCS-2 , AC Type-2"),
            if (dropdownValue1 == 'Mercedes' && dropdownValue2 == 'Benz EQB')
              const Text("AC Type-2 , CCS-2"),

            if (dropdownValue1 == 'Audi' && dropdownValue2 == 'e-tron GT')
              const Text("CCS-2 , AC Type-2"),
            if (dropdownValue1 == 'Audi' && dropdownValue2 == 'RS e-tron GT')
              const Text("CCS-2 , AC Type-2"),
            if (dropdownValue1 == 'Audi' && dropdownValue2 == 'e-tron')
              const Text("CCS-2 , AC Type-2"),

            if (dropdownValue1 == 'Porsche' && dropdownValue2 == 'Taycan')
              const Text("CCS-2 , AC Type-2"),

            if (dropdownValue1 == 'Kia' && dropdownValue2 == 'EV6')
              const Text("CCS-2 , AC Type-2"),

            if (dropdownValue1 == 'BMW' && dropdownValue2 == 'i4')
              const Text("AC Type-2 , CCS-2"),

            if (dropdownValue1 == 'Volvo' && dropdownValue2 == 'XC40 Recharge')
              const Text("CCS-2 , AC Type-2"),

            if (dropdownValue1 == 'Citroen' && dropdownValue2 == 'ec3')
              const Text("AC Type-2 , CCS-2"),

            if (dropdownValue1 == 'BYD' && dropdownValue2 == 'Atto 3')
              const Text("AC Type-2 , CCS-2"),
            if (dropdownValue1 == 'BYD' && dropdownValue2 == 'e6')
              const Text("AC Type-2 , CCS-2"),




            ElevatedButton(

                child: const Text('Submit'),
                onPressed: () {
                  if (dropdownValue1 != null &&
                      dropdownValue2 != null) {

                    setState(() async {
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

                      count = loggedInUser.count!;
                      count = count + 1;

                      data = {
                        "count":count,
                        count.toString():{
                        "Vehicle Manufacturer": dropdownValue1,
                        "Vehicle Model": dropdownValue2,

                      }};
                      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                      await firebaseFirestore
                          .collection("users")
                          .doc(user!.uid)
                          .update(data);
                      Fluttertoast.showToast(msg: "Vehicle details have been added! ");
                    });
                    print(json.encode(data));
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
