import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:marsol/constants/widgets.dart';
import 'package:marsol/helper_provider/map_data.dart';
import 'package:marsol/screens/delivery_place.dart';
import 'package:provider/provider.dart';

class UserLocation extends StatefulWidget {
  static String id = "UserLocation";
  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  GoogleMapController _controller;
  Map<MarkerId, Marker> _markers = {};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var lat = Provider.of<MapData>(context);
    var long = Provider.of<MapData>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat.latAddress, long.longAddres),
                zoom: 18.0,
              ),
              onMapCreated: (controller) {
                _controller = controller;
                MarkerId markerId = MarkerId("Home");
                LatLng position = LatLng(lat.latAddress, long.longAddres);
                Marker marker = Marker(
                  markerId: markerId,
                  position: position,
                  draggable: false,
                );
                setState(() {
                  _markers[markerId] = marker;
                });
              },
              markers: Set.of(_markers.values),
              onCameraMove: (position) {
                MarkerId markerId = MarkerId("Home");

                Marker updateMarker =
                    _markers[markerId].copyWith(positionParam: position.target);
                setState(() {
                  _markers[markerId] = updateMarker;
                  lat.latAddress = position.target.latitude;
                  long.longAddres = position.target.longitude;
                });
                print(lat.latAddress);
              },
              onCameraIdle: () async {
                var coordinates = Coordinates(lat.latAddress, long.longAddres);
                var address = await Geocoder.local
                    .findAddressesFromCoordinates(coordinates);
                Provider.of<MapData>(context, listen: false)
                    .getPlaceName(address.first.addressLine);
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
                        builder: (context) => DeliveryPlace(),
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
