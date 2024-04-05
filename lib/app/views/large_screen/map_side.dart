import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:portfolio/app/views/contact/contact_controller.dart';
import 'package:portfolio/app/widgets/text_input.dart';
class ContactMeScreen extends StatefulWidget{

  const ContactMeScreen({super.key});

  @override
  State<ContactMeScreen> createState() => _ContactMeScreenState();
}

class _ContactMeScreenState extends State<ContactMeScreen> {
  final Completer<GoogleMapController> googleMapController = Completer<GoogleMapController>();

  final ContactController contactController = Get.put(ContactController());

  bool visible = false;
  BitmapDescriptor? bitmapDescriptor;
  void setBitmap() async {
    bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, 
      "assets/launcher/file.png",
    ).then((value) => value);
  }

  @override
  void initState() {
    setBitmap();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 0,
                tilt: 12,
              ),
              onMapCreated: (controller) {
                googleMapController.complete(controller);
                contactController.goToPlace(googleMapController, contactController.latLng.value);
              },
              markers: {
                Marker(
                  markerId: const MarkerId("01"),
                  infoWindow: const InfoWindow(
                    title: "Code Karma",
                  ),
                  position: contactController.latLng.value,
                  icon: BitmapDescriptor.defaultMarker,
                ),
                Marker(
                  markerId: const MarkerId("Karatina Town"),
                  infoWindow: const InfoWindow(
                    title: "Karatina Town",
                  ),
                  position: const LatLng(-0.48315800, 37.12735490),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                ),
              },
            ),
          ),
          Visibility(
            visible: visible,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutofillGroup(
                      child: Form(
                        key: contactController.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextInput(
                              label: "Full Name",
                              hintText: "Enter your name here...",
                              maxLines: 1,
                              controller: contactController.name,
                              keyBoardInput: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              autofillHints: const[
                                AutofillHints.name,
                                AutofillHints.nickname,
                                AutofillHints.newUsername,
                              ],
                              validator: (val){
                                return val!.isEmpty ? "Enter your name" : null;
                              },
                            ),
                            CustomTextInput(
                              label: "E-mail",
                              hintText: "Enter E-mail address...",
                              maxLines: 1,
                              controller: contactController.email,
                              keyBoardInput: TextInputType.emailAddress,
                              autofillHints: const [
                                AutofillHints.email,
                              ],
                              validator: (val){
                                return !val!.isEmail ? "Invalid E-mail address" : null;
                              },
                            ),
                            CustomTextInput(
                              label: "Phone",
                              hintText: "Enter phone number...",
                              maxLines: 1,
                              controller: contactController.phone,
                              keyBoardInput: TextInputType.phone,
                              autofillHints: const[
                                AutofillHints.telephoneNumber,
                                AutofillHints.telephoneNumberCountryCode,
                              ],
                              validator: (val){
                                return val!.isEmpty ? "Phone number cannot be blank" : null;
                              },
                            ),
                            CustomTextInput(
                              label: "Feedback",
                              hintText: "Type something here...",
                              maxLines: 5,
                              maxLength: 1000,
                              padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
                              controller: contactController.response,
                              keyBoardInput: TextInputType.text,
                              validator: (val){
                                return val!.isEmpty ? "Field cannot be empty" : null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){
                                  if(contactController.formKey.currentState!.validate()){
                              
                                  }
                                }, 
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Send Feedback",
                                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Tooltip(
                    message: "Hide",
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: const CircleAvatar(
                        radius: 13,
                          backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_downward,
                            size: 23,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.03,
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade300,
                child: Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Colors.blueGrey.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}