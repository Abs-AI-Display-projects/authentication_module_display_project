import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:maligali/BusinessLogic/Models/auth_owner_model.dart';
import 'package:maligali/Screens/authentication/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../../components/buttons.dart';
import '../../../../../../constants.dart';
import '../../../../BusinessLogic/view_models/authentication_view_models/authentication_view_model.dart';
import '../../../../BusinessLogic/utils/globalSnackBar.dart';
import '../../../../components/returnAppBar.dart';
import '../../log_in/log_in_screen.dart';
import '../../otp/otp_screen.dart';
import '../../../../BusinessLogic/Services/location_services.dart';

/*this screen is responsible for letting the user select his store location from google maps, as well as passing the user sign up information that was passed from the
previous sign up screen to the authentication services class and attempting authentication 
if authentication is successful then the users account is created and then the user is then navigated to the otp screen to sign in with the newly created account*/
class SelectLocationOnMapScreen extends StatefulWidget {
  //constructor user for taking the user information from the previous screen
  SelectLocationOnMapScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<SelectLocationOnMapScreen> createState() =>
      SelectLocationOnMapScreenState();
}

class SelectLocationOnMapScreenState extends State<SelectLocationOnMapScreen> {
  //map attributes
  final String apiKey =
      "AIzaSyBm6JUr-ucXfHBj4syvNWCh52K9AjaA_Rc"; // api key used to allow google maps to work , you may find this api key on google console page for the application

  LatLng currentLocation = _initialCameraPosition
      .target; //used to track the currently focused location ,
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>(); //controller for the google map widget

  static const CameraPosition _initialCameraPosition = CameraPosition(
    //initial position that the camera is focused on when google maps first loads
    target: LatLng(30.033333, 31.233334),
    zoom: 8,
  );

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _getMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purplePrimaryColor,
      //////////////appbar of the screen///////////////////////
      appBar: ReturnAppBar(
        key: null,
        pageTitle: "موقع محلك",
        textColor: textWhite,
        appBarColor: purpleAppbar,
        bottom: Container(
          decoration: BoxDecoration(
            color: textWhite,
            borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))
                .w,
          ),
        ),
        preferredSize: Size.fromHeight(40.h),
      ),

      body: Stack(alignment: Alignment.center, children: [
        Stack(
          children: [
            SizedBox(
              height: double.infinity,
              //google map widget initialized with map attributes set above
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMove: (CameraPosition newPos) {
                  setState(() {
                    currentLocation = newPos.target;
                  });
                },
                markers: _markers,
              ),
            ),
            //sign up button
            Positioned(
              bottom: 16.h,
              right: 85.w,
              child: DefaultButton(
                text: "تسجيل الدخول",
                fontSize: subFontSize,
                onPressed: () async {
                  var provider = Provider.of<AuthenticationServices>(context,
                      listen: false);

                  provider.previousRoute = SignUpScreen.routeName;
                  await provider
                      .sendVerificationCode(
                    '${provider.authUserModel?.storeOwnerNumber}',
                  )
                      .then((vID) {
                    provider.authUserModel = provider.authUserModel?.copyWith(
                        shopGPSLocation:
                            '${currentLocation.latitude}-${currentLocation.longitude}');
                    Navigator.pushNamed(
                      context,
                      OtpScreen.routeName,
                    );
                  });

                  //////////////////////
                  _getPlaceId(
                      currentLocation); //gets the location id google map is focused on
                },
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Image.asset(
              'assets/images/pin.png',
              color: redTextAlert,
            ),
          ),
        )
      ]),
    );
  }

//responsible for searching, showing and browsing search results for locations by name if the user clicks the search button
  Future<void> _showSearchDialog() async {
    var p = await PlacesAutocomplete.show(
        context: context,
        apiKey: apiKey,
        mode: Mode.overlay,
        language: "ar",
        region: "eg",
        offset: 0,
        hint: "Type here...",
        radius: 1000.r,
        types: [],
        strictbounds: false,
        components: [Component(Component.country, "eg")]);

    _getLocationFromPlaceId(p!
        .placeId!); //gets the location id of the place the user searched for and selected
  }

  //responsible for showing an error message for the user if authentication failed
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('مشكلة في تسجيل الدخول'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('تمام'),
          )
        ],
      ),
    );
  }

  ///////////////////////////location finding and camera animating helper functions///////////////////////////////
  ///
  //gets the current location of the user based on device gps
  Future<void> _getMyLocation() async {
    LocationData _myLocation = await LocationService().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
  }

  Future<void> _animateCamera(LatLng _location) async {
    //responsible for moving the google map focus area (camera) to the place being selected
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(_location.latitude, _location.longitude),
      zoom: 18.00.r,
    );

    if (kDebugMode) {
      print(
          "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  Future<void> _getLocationFromPlaceId(String placeId) async {
    //gets an actual location from a location id and focuses the google map camera on it
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(placeId);

    _animateCamera(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
  }

  //responsible for getting the location id of the place google maps is currently focused on
  void _getPlaceId(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
  }
}
