import 'package:chat_app/Views/GoogleMap/googlemap_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => GoogleMapViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: GoogleMap(
              mapType: MapType.normal,
              trafficEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: viewModel.getKGooglePlex()),
        );
      },
    );
  }
}
