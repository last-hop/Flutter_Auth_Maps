import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Confirmed'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage('assets/profile_photo.png'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Current Position',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Handle current position input change
                    // Perform places autocomplete with value
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Handle destination input change
                    // Perform places autocomplete with value
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMapWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Routes',
          ),
        ],
      ),
    );
  }
}

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      onTap: (LatLng latLng) {
        // Handle map tap
        // Navigate to Google Maps or any other action
      },
    );
  }
}
