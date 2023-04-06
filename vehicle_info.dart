// ignore_for_file: camel_case_types

import 'dart:core';

import 'package:flutter/material.dart';

class Vehicle_info extends StatefulWidget {
  const Vehicle_info({Key? key, required String title}) : super(key: key);

  @override
  State<Vehicle_info> createState() => _Vehicle_infoState();
}



class _Vehicle_infoState extends State<Vehicle_info> {


  String value = "";
  bool disabledropdown = true;
  List<DropdownMenuItem<String>> menuitems = [];


  final vehicleNumberEditingController = TextEditingController();

// options for second dropdown where you select the vehicle model
  final Tata = {
    "1" : "E-Tigor",
    "2" : "Nexon EV",
    "3" : "Tigor EV Ziptron",
    "4" : "Tiago EV",
  };

  final Mahindra = {
    "1" : "E-Verito",
    "2" : "e20 Plus 8",
  };

  final Hyundai = {
    "1" : "Kona",
  };

  final MG = {
    "1" : "ZS EV",
  };

  final Kia = {
    "1" : "EV6",
  };

  final Volvo = {
    "1": "XC40 Recharge",
  };

  final Mercedes = {
    "1" : "EQC",
    "2" : "580 EQS",
    "3" : "Benz EQB",
  };

  final Audi = {
    "1" : "e-tron GT",
    "2" : "RS e-tron GT",
    "3" : "e-tron",
  };

  final Porsche = {
    "1" : "Taycan",
  };

  final BMW = {
    "1" : "i4",
  };

  final Jaguar = {
    "1" : "I-PACE",
  };

  final BYD = {
    "1" : "Atto 3",
  };



  void populateTata(){
    for(String key in Tata.keys){
      menuitems.add(DropdownMenuItem<String>(
        value: Tata[key]!,
        child: Center(
          child:Text(
            Tata[key]!,
          )
        )
      ));
    }
  }

  void populateMahindra(){
    for(String key in Mahindra.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Mahindra[key]!,
          child: Center(
              child:Text(
                Mahindra[key]!,
              )
          )
      ));
    }
  }


  void populateHyundai(){
    for(String key in Hyundai.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Hyundai[key]!,
          child: Center(
              child:Text(
                Hyundai[key]!,
              )
          )
      ));
    }
  }

  void populateMG(){
    for(String key in MG.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: MG[key]!,
          child: Center(
              child:Text(
                MG[key]!,
              )
          )
      ));
    }
  }

  void populateKia(){
    for(String key in Kia.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Kia[key]!,
          child: Center(
              child:Text(
                Kia[key]!,
              )
          )
      ));
    }
  }

  void populateVolvo(){
    for(String key in Volvo.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Volvo[key]!,
          child: Center(
              child:Text(
                Volvo[key]!,
              )
          )
      ));
    }
  }

  void populateMercedes(){
    for(String key in Mercedes.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Mercedes[key]!,
          child: Center(
              child:Text(
                Mercedes[key]!,
              )
          )
      ));
    }
  }

  void populateAudi(){
    for(String key in Audi.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Audi[key]!,
          child: Center(
              child:Text(
                Audi[key]!,
              )
          )
      ));
    }
  }

  void populatePorsche(){
    for(String key in Porsche.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Porsche[key]!,
          child: Center(
              child:Text(
                Porsche[key]!,
              )
          )
      ));
    }
  }

  void populateBMW(){
    for(String key in BMW.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: BMW[key]!,
          child: Center(
              child:Text(
                BMW[key]!,
              )
          )
      ));
    }
  }

  void populateJaguar(){
    for(String key in Jaguar.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: Jaguar[key]!,
          child: Center(
              child:Text(
                Jaguar[key]!,
              )
          )
      ));
    }
  }

  void populateBYD(){
    for(String key in BYD.keys){
      menuitems.add(DropdownMenuItem<String>(
          value: BYD[key]!,
          child: Center(
              child:Text(
                BYD[key]!,
              )
          )
      ));
    }
  }



  void valuechanged (_value){
    if(_value == "Tata"){
      menuitems=[];
      populateTata();

    }else if(_value == "Mahindra") {
      menuitems = [];
      populateMahindra();
    }else if(_value == "Hyundai") {
      menuitems = [];
      populateHyundai();
    }else if(_value == "MG") {
      menuitems = [];
      populateMG();
    }else if(_value == "Kia") {
      menuitems = [];
      populateKia();
    }else if(_value == "Volvo") {
      menuitems = [];
      populateVolvo();
    }else if(_value == "Mercedes") {
      menuitems = [];
      populateMercedes();
    }else if(_value == "Audi") {
      menuitems = [];
      populateAudi();
    }else if(_value == "Porsche") {
      menuitems = [];
      populatePorsche();
    }else if(_value == "BMW") {
      menuitems = [];
      populateBMW();
    }else if(_value == "Jaguar") {
      menuitems = [];
      populateJaguar();
    }else if(_value == "BYD") {
      menuitems = [];
      populateBYD();
    }
    setState(() {
      value = _value;
      disabledropdown=false;
      print('$value');
    });
  }


  void secondvaluechanged (_value) {
    setState(() {
      value = _value;
      print('$value');
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Vehicle Information",),
        centerTitle: true,

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20.0),

              child: DropdownButton<String>(
                items:const [



                  DropdownMenuItem<String>(
                    value: "Tata",
                    child: Center(
                        child: Text("Tata Motors")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Mahindra",
                    child: Center(
                        child: Text("Mahindra")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Hyundai",
                    child: Center(
                        child: Text("Hyundai")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MG",
                    child: Center(
                        child: Text("MG Motors")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Kia",
                    child: Center(
                        child: Text("Kia")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Volvo",
                    child: Center(
                        child: Text("Volvo")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Mercedes",
                    child: Center(
                        child: Text("Mercedes")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Audi",
                    child: Center(
                        child: Text("Audi")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Porsche",
                    child: Center(
                        child: Text("Porsche")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BMW",
                    child: Center(
                        child: Text("BMW")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Jaguar",
                    child: Center(
                        child: Text("Jaguar")
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BYD",
                    child: Center(
                        child: Text("BYD")
                    ),
                  ),

                ], //drop down menu for the vehicle manufacturers



                onChanged:
                    (value) {
                  valuechanged(value);
                },
                hint:const Text("Select the vehicle manufacturer"),


              ),

            ),

            const SizedBox(height: 16),
            Text('Selected Vehicle Manufacturer: $value'),




            Padding(
              padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  items: menuitems,

                  onChanged: disabledropdown ? null : (_value) => secondvaluechanged(_value),

                  hint:const Text("Select the vehicle model"),
                ),
            ),



             Padding(
              padding: const EdgeInsets.all (30.0),
               child: TextFormField(
                 controller: vehicleNumberEditingController,
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
                   vehicleNumberEditingController.text = value!;
                 },
                 textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                   prefixIcon: const Icon(Icons.car_repair),
                   contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                   hintText: "Enter registered Vehicle Number ",
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                 )
               ),
             ),


            Text(
                "$value",

              style:const TextStyle(fontSize: 20.0),
                ),
          ],
        ),
      ),
    );
  }
}
