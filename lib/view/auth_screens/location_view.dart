import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/location_widgets/get_location_popup.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'dart:async';
import 'package:scaleapp/utils/utils.dart';
import 'package:uuid/uuid.dart';

import '../../view_model/auth_view_model/update_location_view_model.dart';

class GoogleLocationView extends StatefulWidget {
  const GoogleLocationView({Key? key}) : super(key: key);

  @override
  State<GoogleLocationView> createState() => _GoogleLocationViewState();
}

class _GoogleLocationViewState extends State<GoogleLocationView> {
  /// Google map Variables
  Position? p;
  String location = 'Null, Press Button';
  String mapaddress = 'search';
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(33.6844, 73.0479));

  final List<Marker> _marker = <Marker>[];
  //////////////for textfeild map search//////////////////////
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _placeList = [];
  var uuid = const Uuid();
  String? _sessionToken;

  double? latitudeVal;
  double? longitudeVal;
  bool gotCurrentLoc = false;

  /// Google map Variables
  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  @override
  void initState() {
    ///
    Geolocator.requestPermission();
    super.initState();
    _searchController.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_searchController.text);
  }

  void getSuggestion(String input) async {
    String aPIKEY = "AIzaSyA7EU6iqJ-NAtGUVS8OWch83JsIyhitScw";

    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$aPIKEY&sessiontoken=$_sessionToken';
      if (kDebugMode) {
        print('before api');
        print(request);
      }

      Dio dio = Dio();
      Response response;
      response = await dio.get(request);
      if (kDebugMode) {
        print('fffffffffffff');
      }
      var data = response.data;
      if (kDebugMode) {
        print('mydata');
        print(data);
      }

      if (response.statusCode == 200) {
        setState(() {
          _placeList = response.data['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      // toastMessage('success');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final googlemapGetAddressProvider =
    //     Provider.of<GooglemapGetAddressProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                onTap: (latLng) {
                  getAddressFromLatLong(
                    latLng,
                  ).then((value) {
                    setState(() {
                      setmarker(latLng.latitude, latLng.longitude);
                    });
                  });
                  if (kDebugMode) {
                    print('${latLng.latitude}, ${latLng.longitude}');
                  }
                },
                initialCameraPosition: _cameraPosition,
                markers: Set<Marker>.of(_marker),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                }),
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 105, left: 20, right: 20),
                        child: MyCustomTextField(
                          hintText: 'Search Location',
                          passcontroller: _searchController,
                          validator: (val) => val!.isEmpty ? "" : null,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              getSuggestion(_searchController.text);
                            },
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _placeList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: ListTile(
                              title: Text(_placeList[index]["description"]),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 80, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          getUserCurrentLocation().then((value) async {
                            if (kDebugMode) {
                              print('my current location');
                              print("${value.latitude} ${value.longitude}");
                            }
                            setState(() {
                              setmarker(value.latitude, value.longitude);
                            });
                            // setmarker(value.latitude, value.longitude);
                            CameraPosition cameraPosition = CameraPosition(
                                zoom: 16,
                                target:
                                    LatLng(value.latitude, value.longitude));

                            final GoogleMapController controller =
                                await _controller.future;
                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(cameraPosition));
                            setState(() {});
                          });
                          Geolocator.getCurrentPosition();
                          Position position =
                              await Geolocator.getCurrentPosition();
                          getAddressFromLatLong(
                            position,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor().tealcolor,
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColor().whitecolor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<UpdateLocationViewModel>(
                          builder: (context, value, child) {
                        return PrimaryButtonLoading(
                          buttonText: value.updatelocationloading == false
                              ? Text(
                                  'Set Address',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor().textwhitecolor,
                                  ),
                                )
                              : customcircularprogress(
                                  passcolor: AppColor().whitecolor,
                                ),
                          passOnTap: () async {
                            /// Todo Here Location APi
                            ///
                            if (latitudeVal == null || longitudeVal == null) {
                              Utils.toastMessage(
                                  message: 'Please Select Location From Map');
                            } else {
                              getLocationPopup(
                                context: context,
                                passonTabDeny: () {
                                  Navigator.pop(context);
                                },
                                passonTabAllow: () {
                                  Navigator.pop(context);
                                  if (latitudeVal == null ||
                                      longitudeVal == null) {
                                    Utils.toastMessage(
                                        message:
                                            'Please Select Location From Map');
                                  } else {
                                    debugPrint('Actual Value');
                                    debugPrint(latitudeVal.toString());
                                    debugPrint(longitudeVal.toString());
                                    debugPrint('Fixed to six digit');

                                    double vallatitude = double.parse(
                                        latitudeVal!.toStringAsFixed(6));

                                    double vallongitudeVal = double.parse(
                                        longitudeVal!.toStringAsFixed(6));

                                    debugPrint('/////////////////////////');
                                    debugPrint(latitudeVal!.toStringAsFixed(6));
                                    debugPrint(
                                        longitudeVal!.toStringAsFixed(6));
                                    debugPrint('/////////////////////////');

                                    ///
                                    Map data = {
                                      'latitude':
                                          double.parse(vallatitude.toString()),
                                      'longitude': double.parse(
                                          vallongitudeVal.toString()),
                                    };
                                    value.updateLocationApi(
                                      context,
                                      data,
                                    );
                                  }
                                },
                              );
                            }
                          },
                        );
                      }),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacementNamed(
                      //       context,
                      //       RoutesName.logIn,
                      //     );
                      //   },
                      //   child: Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           vertical: 8, horizontal: 15),
                      //       decoration: BoxDecoration(
                      //         color: AppColor().appIconcolor,
                      //         borderRadius: BorderRadius.circular(200),
                      //       ),
                      //       child: Text(
                      //         'Set Address',
                      //         style: TextStyle(
                      //           color: AppColor().textwhitecolor,
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Get Address From Lat Long
  Future<void> getAddressFromLatLong(
    position,
  ) async {
    if (kDebugMode) {
      print("${position.latitude}");
      print("${position.longitude}");
    }
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print('placemarks');
      print(placemarks);
    }
    Placemark place = placemarks[0];
    mapaddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setmarker(position.latitude, position.longitude);

    ///
    // googlemapGetAddressProvider.setAddress(
    //   passcity: place.locality,
    //   passcountry: place.country,
    //   passstreetaddress: '${place.street} , ${place.subLocality}',
    //   passpostalcode: place.postalCode,
    //   passsetinitial: false,
    // );

    setState(() {
      latitudeVal = position.latitude;
      longitudeVal = position.longitude;
    });

    ///
    if (kDebugMode) {
      print('mapaddress');
      print(mapaddress);
      print('place.locality.toString()+"123456789');
      print("${place.locality}123456789");
    }
  }

  /// Set Marker
  Future<Position> setmarker(lat, long) {
    _marker.add(
      Marker(
        markerId: const MarkerId('2'),
        position: LatLng(lat, long),
        infoWindow: const InfoWindow(title: 'My current location'),
      ),
    );
    return Geolocator.getCurrentPosition();
  }

  /// Get current address
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print('error$error');
      }
    });
    return Geolocator.getCurrentPosition();
  }
}
