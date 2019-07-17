import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location_permissions/location_permissions.dart';

//import 'package:geolocator/geolocator.dart';

class MapData extends StatefulWidget {
  @override
  _MapDataState createState() => _MapDataState();
}

class _MapDataState extends State<MapData> {
  GoogleMapController mapController;
  MapType _defaultMapType = MapType.normal;
  static LatLng _center = LatLng(45.521563, -122.677433);
  LatLng _lastposition = _center;
  final Set<Marker> _markers = Set();

/*   var location = new Location();
  Map<String, double> userLocation; */

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      //_getLocation();
    });
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();

    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId('My Location'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
      // mapController.setMapStyle(mapStyle)
    });
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _center == null ? LatLng(0, 0) : _center, zoom: 15.0)));
  }

  /*  Future<LocationData> _getLocation() async {
    try {
      currentLocation = await location.getLocation();
      setState(() {
        _center = LatLng(currentLocation.latitude, currentLocation.longitude);
        _markers.add(
          Marker(
            markerId: MarkerId('My Location'),
            position:
                LatLng(currentLocation.latitude, currentLocation.longitude),
          ),
        );
        // mapController.setMapStyle(mapStyle)
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: _center == null ? LatLng(0, 0) : _center, zoom: 15.0)));
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
 */
  /* void getLocation() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();

    geo.Position position = await geo.Geolocator()
        .getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
    print(position);

    //getNearbyPlaces(_center);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId('My Location'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
      // mapController.setMapStyle(mapStyle)
    });
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _center == null ? LatLng(0, 0) : _center, zoom: 15.0)));
  }

  */
  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastposition = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          /* appBar: AppBar(
            title: Text('Google Map'),
            backgroundColor: Colors.green[700],
          ), */
          body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: _defaultMapType,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 18.0,
            ),
            onCameraMove: _onCameraMove,
          ),
        ],
      )),
    );
  }
}
