import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Locate_station extends StatefulWidget {
  const Locate_station({Key? key, required String title}) : super(key: key);

  @override
  State<Locate_station> createState() => _Locate_stationState();
}

class _Locate_stationState extends State<Locate_station> {
  final TextEditingController searchController = TextEditingController();

  Map<String, dynamic>? locations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Locate Station"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Enter your search query',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform search action here
                FirebaseFirestore.instance
                    .collection("locations")
                    .doc(searchController.text)
                    .get()
                    .then((value) {
                  this.locations = value.data();
                  print(value.data());
                  setState(() {});
                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            if (locations != null)
              Expanded(
                child: ListView.builder(
                  itemCount: locations!.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = locations!.keys.elementAt(index);
                    GeoPoint value = locations![key];
                    return ListTile(
                      title: Text(key),
                      subtitle: Text('Latitude: ${value.latitude}, Longitude: ${value.longitude}'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
