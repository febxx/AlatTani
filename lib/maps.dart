import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = const LatLng(-7.8032076, 110.3573354);

  @override
  void initState() {
    _markers.add(Marker(
      markerId: const MarkerId('-7.8032076, 110.3573354'),
      position: _currentPosition,
      icon: BitmapDescriptor.defaultMarker)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final sizeHeight = MediaQuery.of(context).size.height;
    // final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Alamat",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // body: Column(children: [Text(latitudeData), Text(longitudeData)]),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 14),
        markers: _markers,
      )
    );
  }
}