import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  // const PlacesListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            }, 
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting 
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<GreatPlaces>(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Got no places yet, start adding some!'),
                TextButton.icon(
                  onPressed: (){
                    Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                  }, 
                  icon: Icon(Icons.add_location), 
                  label: Text('Add a place')
                )
              ],
            ),
          ),
          builder: (ctx, greatPlaces, ch) => 
            greatPlaces.items.length <= 0 ? ch : ListView.builder(
              itemCount: greatPlaces.items.length,  
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlaces.items[i].image),
                ),
                title: Text(greatPlaces.items[i].title),
                onTap: () {
                  //!TODO go to detail page
                },
              ),
            ),
        ),
      )
    );
  }
}