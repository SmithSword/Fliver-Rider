import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/utils/functions.dart';

class MyMapViewPage extends StatefulWidget {
  @override
  _MyMapViewPageState createState() => _MyMapViewPageState();
}

class _MyMapViewPageState extends State<MyMapViewPage> {
  Location location = new Location();
  GoogleMapController mapController;
 // final LatLng _center = const LatLng(18.9548, 72.7985); //malabar hill
  final LatLng _center = const LatLng(pos['latitude'],pos['langitude']); //to detect current location
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              mapToolbarEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: false, //replace with a custom button
              compassEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Menu',
                    color: invertColorsMild(context),
                    iconSize: 22.0,
                    onPressed: doNothing,
                  ),
                  Text(
                    'Fliver',
                    style: TextStyle(
//                    fontFamily: '',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                      color: invertColorsMild(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.my_location),
          foregroundColor: invertInvertColorsTheme(context),
          backgroundColor: invertColorsTheme(context),
          onPressed: doNothing),
    );
  }

//To detect location - 13/8/19 (added)
  _animateToUser() async{
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(pos['latitude'], pos['longitude']),
          zoom: 15.0,
    )));

  }



}
