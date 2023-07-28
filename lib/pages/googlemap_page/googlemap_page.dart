import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/pages/googlemap_page/googlemap_controller.dart';
// import 'package:map_app/widgets/custom_autocomplete_textfield.dart';

class GoogleMapPage extends GetView<GoogleMapPageController> {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bản đồ'),
      ),
      body: Stack(children: [
        Obx(
          () => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: controller.placeFirst,
            onMapCreated: (GoogleMapController controllerM) {
              controller.controllerGM.complete(controllerM);
            },
            myLocationButtonEnabled: true,
            markers: Set<Marker>.of(controller.markers),
          ),
        ),
        // Positioned(
        //   left: 15,
        //   top: 30,
        //   right: 15,
        //   child: CustomAutoCompleteTextField(
        //     controller: controller.controllerAutocom,
        //     listAuto: controller.titleMarker,
        //     text: controller.controllerAutocom.text,
        //     onPressed: () {},
        //   ),
        // ),
      ]),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            controller.goToMyLocation();
          },
          label: const Text('Vị trí của tôi'),
          icon: const Icon(Icons.location_on, color: Colors.blue,),
        ),
      ),
    );
  }
}
