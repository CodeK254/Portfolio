import "dart:async";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

class ContactController extends GetxController{
  Rx<LatLng> latLng = const LatLng(-1.2261557, 36.9277381).obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController response = TextEditingController();

  RxInt hovered = 0.obs;
  RxInt selected = 0.obs;

  Future<void> goToPlace(Completer<GoogleMapController> xController, LatLng origin) async{
    final GoogleMapController controller = await xController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: origin,
          zoom: 0,
          tilt: 0.0,
        ),
      ),
    );
  }

  initialize() async {
    bool locationStatus = await Geolocator.isLocationServiceEnabled();
    if(!locationStatus){
      await Geolocator.openLocationSettings();
    } else {
      LocationPermission permissionStatus = await Geolocator.checkPermission();
      if(permissionStatus == LocationPermission.always || permissionStatus == LocationPermission.whileInUse){
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        latLng.value = LatLng(position.latitude, position.longitude);
      } else {
        Geolocator.requestPermission();
        onInit();
      }
    }
  }

  // @override
  // void onInit() async {
  //   initialize();
  //   super.onInit();
  // }
}