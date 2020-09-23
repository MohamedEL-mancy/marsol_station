import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/screens/delivery_place.dart';

class UserLocation extends StatefulWidget {
  static String id = "UserLocation";
  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  double lat, long;
  Location location = Location();
  GoogleMapController _controller;
  Map<MarkerId, Marker> _markers = {};
  String adressName = "";
  void getCurrentLocation() async {
    if (lat == null && long == null) {
      LocationData position = await location.getLocation();
      setState(() {
        lat = position.latitude;
        long = position.longitude;
      });
      print("bgd: $lat");
      print(long);
    }
  }

  void _onMapCreated(controller) {
    _controller = controller;
    MarkerId markerId = MarkerId("Home");
    LatLng position = LatLng(lat, long);
    Marker marker = Marker(
      markerId: markerId,
      position: position,
      draggable: false,
    );
    setState(() {
      _markers[markerId] = marker;
    });
  }

  void _getAddressName() async {
    var coordinates = Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      adressName = address.first.featureName;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 18.0,
              ),
              onMapCreated: _onMapCreated,
              markers: Set.of(_markers.values),
              onCameraMove: (position) {
                MarkerId markerId = MarkerId("Home");
                Marker marker = _markers[markerId];
                Marker updateMarker =
                    marker.copyWith(positionParam: position.target);
                setState(() {
                  _markers[markerId] = updateMarker;
                  lat = position.target.latitude;
                  long = position.target.longitude;
                });
              },
              onCameraIdle: () {
                _getAddressName();
              },
              myLocationEnabled: true,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryPlace(
                          clientAddres: adressName,
                        ),
                      ),
                    );
                  },
                  child: buttons(
                    font: 18.0,
                    title: "تأكيد الطلب",
                    height: height * 0.06,
                    width: width * 0.56,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
