import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/constants/widgets/screens_widgets/delivery_place_widgets.dart';
import 'package:marsol/screens/ready_to_order.dart';
import 'package:marsol/screens/user_location.dart';

class DeliveryPlace extends StatefulWidget {
  static String id = "DeliveryPlace";
  final String clientAddres;
  DeliveryPlace({this.clientAddres = ""});
  @override
  _DeliveryPlaceState createState() => _DeliveryPlaceState();
}

class _DeliveryPlaceState extends State<DeliveryPlace> {
  bool active = true;
  bool inActive = false;
  int index = 0;
  Location location = Location();
  double long, lat;
  bool serviceEnable = false;

  void getCurrentLocation() async {
    LocationData position = await location.getLocation();
    setState(() {
      long = position.longitude;
      lat = position.latitude;
    });
    if (await location.serviceEnabled()) {
      setState(() {
        serviceEnable = true;
      });
    } else {
      setState(() {
        serviceEnable = false;
      });
    }
  }

  GoogleMapController _controller;
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 64, 35, 57),
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: Color.fromARGB(255, 23, 18, 29),
          title: ShaderMask(
            shaderCallback: (rec) => LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromARGB(255, 1, 130, 158),
                Color.fromARGB(255, 1, 130, 158),
                Color.fromARGB(255, 153, 0, 229),
              ],
            ).createShader(rec),
            child: Text(
              "مكان التوصيل",
              style: headLineTextStyle,
            ),
          ),
          leading: ShaderMask(
            shaderCallback: (rec) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors)
                .createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: lat != null && long != null
                      ? GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(lat, long), zoom: 17.0),
                          markers: {
                            Marker(
                              flat: false,
                              draggable: true,
                              markerId: MarkerId("Home"),
                              position: LatLng(lat, long),
                            )
                          },
                          onMapCreated: (controller) {
                            setState(() {
                              _controller = controller;
                            });
                          },
                          gestureRecognizers:
                              <Factory<OneSequenceGestureRecognizer>>[
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            )
                          ].toSet(),
                        )
                      : serviceEnable
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center(
                              child: Text("You Need To Turn On Your GPS"),
                            ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 25.0, top: 10.0),
                child: Text(
                  "التوصيل",
                  style: headLineTextStyle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                  Navigator.pushReplacementNamed(context, UserLocation.id);
                },
                child: deliveryInfo(
                  height: height * 0.12,
                  title: "التوصيل إلي",
                  subTitle: widget.clientAddres,
                  icon: Icons.location_on,
                  isActive: index == 0 ? active : inActive,
                ),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: deliveryInfo(
                  height: height * 0.12,
                  title: "وقت التوصيل",
                  subTitle: "الساعة 1.00",
                  icon: FontAwesomeIcons.clock,
                  isActive: index == 1 ? active : inActive,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(right: 10.0, left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadyToOrder(),
                      ),
                    );
                  },
                  child: buttons(
                    font: 20.0,
                    title: "أرسل الطلب",
                    height: 50,
                    width: double.infinity,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
