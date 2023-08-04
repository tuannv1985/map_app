import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:map_app/hives/hive_location.dart';

class GoogleMapPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadMarkers();
    initGoogleMap();
  }

  LatLng latLngCurent = const LatLng(0.0, 0.0);
  double lat = 0.0;
  double long = 0.0;
  late Timer timerRun;
  late StreamSubscription<Position> positionDatabase;
  late StreamSubscription<Position> positionXml;  
  final _myBox = Hive.box<HiveLocation>('Location');
  final location = HiveLocation();
  final List<HiveLocation> temps =[];
  Completer<GoogleMapController> controllerGM =
      Completer<GoogleMapController>();
  TextEditingController controllerAutocom = TextEditingController();
  CameraPosition placeFirst = const CameraPosition(
    target: LatLng(16.04696, 108.23542),
    zoom: 15,
  );
  List<String> titleMarker = [
    '92H-12345',
    '43F-56789',
    '43D-13579',
    '43F-56789',
    '74F-56789',
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  List<Marker> markers = <Marker>[].obs;
  final List<LatLng> _latLen = <LatLng>[
    const LatLng(16.11033, 108.13266),
    const LatLng(16.10960, 108.12968),
    const LatLng(16.10567, 108.13351),
    const LatLng(16.04696, 108.23542),
    const LatLng(16.05250, 108.24769),
  ];
  loadMarkers() async {
    final Uint8List markIcons = await getImages('assets/images/truck.png', 100);
    for (int i = 0; i < _latLen.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latLen[i],
        icon: BitmapDescriptor.fromBytes(markIcons),
        infoWindow: InfoWindow(
          title: titleMarker[i],
        ),
      ));
    }
  }

  drawMarker() async {
    markers.clear();
    final Uint8List markIcons = await getImages('assets/images/truck.png', 100);
    markers.add(Marker(
      markerId: MarkerId(latLngCurent.toString()),
      position: latLngCurent,
      icon: BitmapDescriptor.fromBytes(markIcons),
      infoWindow: const InfoWindow(
        title: 'NN-000000',
      ),
    ));
  }

  markerCurent() async {
    final Uint8List markIcons = await getImages('assets/images/truck.png', 100);
    markers.add(Marker(
      markerId: MarkerId(latLngCurent.toString()),
      position: latLngCurent,
      icon: BitmapDescriptor.fromBytes(markIcons),
      infoWindow: const InfoWindow(
        title: 'NN-000000',
      ),
    ));
  }

  Future<void> goToMyLocation() async {
    final GoogleMapController controllerG = await controllerGM.future;
    markerCurent();
    await controllerG.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLngCurent, zoom: 15)));
  }

  Future<void> upDateMyLocation() async {
    final GoogleMapController controllerG = await controllerGM.future;
    Timer.periodic(const Duration(seconds: 120), (timer) async {
      markers.clear();
      markerCurent();
      await controllerG.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLngCurent, zoom: 15)));
    });
  }

  Future initGoogleMap() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void timerAutoRun() {
    timerRun = Timer.periodic(const Duration(seconds: 3), (timer) { 
      List<HiveLocation> listLocations = _myBox.values.toList();     
      print("listLocation length: ${listLocations.length}");
      print("temp length: ${temps.length}");
    });
  }

  Future<void> getUpdateDatabase() async {
    location.stt = 0;
    const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,);
    positionDatabase =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      lat = position!.latitude;
      long = position.longitude;
      latLngCurent = LatLng(position.latitude, position.longitude);
      print('lat2: ${position.latitude} and long2: ${position.longitude}');
      drawMarker();
      location.stt++;      
      location.lat = lat;
      location.long = long;
      _myBox.put(location.stt, location);
      temps.add(location);
      print('location: $_myBox');      
    });
  }

  Future<void> getUpdateXml() async {
    const LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 0);
    positionXml =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      print('lat2: ${position!.latitude} and long2: ${position.longitude}');
    });
  }
}
