// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

// final myKey = dotenv.env['GOOGLE_API_KEY'];
final myKey = FlutterConfig.get('GOOGLE_API_KEY');


class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$latitude,$longitude&key=$myKey'; 
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&amp;key=$myKey');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}