import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller=Completer();

  static final CameraPosition _kGooglePlex= CameraPosition(
    target: LatLng(37.42796133580664,-122.085749655962),
    zoom: 14,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const[
    _Marker(
      markerId:MarkerId('1'),
      position: LatLng(33.6844,73.0479),
      infoWindow: InfoWindow(
        title: 'Şuan ki Konumum'
      )
    ),
    Marker(
      markerId:MarkerId('2'),
      position: LatLng(33.738045,73.084488),
      infoWindow: InfoWindow(
        title: 'e-11 sector'
      )
    ),
    Marker(
      markerId:MarkerId('3'),
      position: LatLng(33.738045,73.084488),
      infoWindow: InfoWindow(
        title: 'e-2 sector'
      )
    )
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController _controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}