import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // String? _currentAddress;
  // Position? _currentPosition;

  // void getLocation() async {
  //   Location location = Location();
  //   await location.getLocation();
  //
  //   print(location);
  // }

  // @override
  // void initState() {
  //   getLocation();
  //   super.initState();
  // }

  // void getLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.low);
  //     print(position);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // void getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled, so return.
  //     print('Location services are disabled.');
  //     return;
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, so return.
  //       print('Location permissions are denied');
  //       return;
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, so return.
  //     print(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //     return;
  //   }
  //
  //   // When we reach here, permissions are granted and we can continue accessing the position.
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.low);
  //     print(position);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(30),
        color: Colors.blue,
      ),
    );
  }
}
