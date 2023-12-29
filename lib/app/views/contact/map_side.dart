import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:portfolio_website/app/views/contact/contact_controller.dart';

class ContactMeScreen extends StatelessWidget{
  final Completer<GoogleMapController> googleMapController = Completer<GoogleMapController>();
  ContactMeScreen({super.key});
  final ContactController contactController = Get.find<ContactController>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 6,
            tilt: 12,
          ),
          onMapCreated: (controller) {
            googleMapController.complete(controller);
            contactController.goToPlace(googleMapController, contactController.latLng.value);
          },
          markers: {
            Marker(
              markerId: const MarkerId("01"),
              position: contactController.latLng.value,
            ),
          },
        ),
      ),
    );
  }
}