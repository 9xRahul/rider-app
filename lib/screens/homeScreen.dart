import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/screens/car_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  LatLng _currentPosition = LatLng(00, 0);
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      print(_currentPosition);
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 3000,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.black, Colors.yellow],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceBetween,

                children: [
                  Icon(Icons.drag_indicator, color: Colors.white),
                  Text(
                    "Lets Ride",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(child: Icon(Icons.person)),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, color: Colors.white),

                            Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  "Pickup",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "St marys hospital",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.arrow_downward, color: Colors.white),

                            Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  "Pickup",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "St marys hospital",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 500,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _currentPosition,
                          zoom: 16.0,
                        ),
                      ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CarDetailsScreen()),
                  );
                },

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 130,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: .start,
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(
                                            "Texi Basic",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star_border,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "in 15 minutes",
                                                overflow: .ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "4\$/1mi",
                                            overflow: .ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 80,
                            top: 30,
                            child: Icon(
                              Icons.car_crash,
                              size: 50,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: .start,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    "Texi Basic",
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "in 15 minutes",
                                        overflow: .ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "4\$/1mi",
                                    overflow: .ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 80,
                              top: 30,
                              child: Icon(
                                Icons.car_crash,
                                size: 50,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
