import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key, required String title}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition = CameraPosition(target: LatLng(19.2680, 72.9672), zoom: 14.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maps"),centerTitle: true,elevation: 0,),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
