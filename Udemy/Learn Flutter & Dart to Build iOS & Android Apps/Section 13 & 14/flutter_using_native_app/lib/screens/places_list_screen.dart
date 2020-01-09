import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, child) {
          return greatPlaces.places.length <= 0
              ? child
              : ListView.builder(
                  itemCount: greatPlaces.places.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(greatPlaces.places[i].image),
                      ),
                      title: Text(greatPlaces.places[i].title),
                      onTap: () {},
                    );
                  },
                );
        },
        child: const Center(
          child: Text('Got no places yet, start adding some!'),
        ),
      ),
    );
  }
}
