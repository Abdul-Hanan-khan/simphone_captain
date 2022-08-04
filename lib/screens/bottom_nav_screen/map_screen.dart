import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/all_captain_cubit/all_captain_cubit.dart';
import '../../models/api_response/all_captain_api_response.dart';
import '../../ui_components/show_snack_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  List<Franchises> franchises = [];
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(31.506869932714107, 74.27823920188905),
    zoom: 14.4746,
  );

  List<Marker> list = [];
  late BitmapDescriptor customIcon;

  void customMarker() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(50, 50)),
      'assets/images/marker.png',
    ).then((value) => {customIcon = value});
  }

  @override
  void initState() {
    customMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCaptainCubit()..allCaptain(),
      child: BlocConsumer<AllCaptainCubit, AllCaptainState>(
        listener: (context, state) {
          if (state is FailedToFetchedCaptain) {
            showSnackBar(context, state.name);
          }
          if (state is SuccessfullyGetFetchedAllCaptain) {
            franchises.clear();
            franchises.addAll(state.franchises);
          }
        },
        builder: (context, state) {
          for (int i = 0; i < franchises.length; i++) {
            var mark = Marker(
              markerId: MarkerId(franchises[i].name ?? ""),
              position: LatLng(double.parse("${franchises[i].lat}"), double.parse("${franchises[i].long}")),
              infoWindow: InfoWindow(
                  title: franchises[i].address,
                  onTap: () {
                   // Nav.push(context, CaptainSimScreen(franchises[i].name!, franchises[i].id!));
                  }),
              icon: customIcon,
            );
            list.add(mark);
          }

          return Scaffold(
            body: GoogleMap(
              markers: Set<Marker>.of(list),
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          );
        },
      ),
    );
  }
}
