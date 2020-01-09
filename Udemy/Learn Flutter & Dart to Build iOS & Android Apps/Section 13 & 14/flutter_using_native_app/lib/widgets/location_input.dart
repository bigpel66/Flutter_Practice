import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';
import '../models/place.dart';

class LocationInput extends StatefulWidget {
  final Function selectHandler;

  LocationInput({@required this.selectHandler});

  @override
  State createState() => _LocationInput();
}

class _LocationInput extends State<LocationInput> {
  String _previewImageUrl;

  void _showPreview(double latitude, double longitude) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: latitude, longitude: longitude);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });

    widget.selectHandler(latitude, longitude);
  }

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    _showPreview(locData.latitude, locData.longitude);
  }

  Future<void> _selectOnMap() async {
    final currentData = await Location().getLocation();
    final placeLocationData = PlaceLocation(
      latitude: currentData.latitude,
      longitude: currentData.longitude,
    );
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) {
          return MapScreen(
            initialLocation: placeLocationData,
            isSelecting: true,
          );
        },
      ),
    );

    if (selectedLocation == null) {
      return;
    }

    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () => _getCurrentUserLocation(),
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () => _selectOnMap(),
            )
          ],
        ),
      ],
    );
  }
}
