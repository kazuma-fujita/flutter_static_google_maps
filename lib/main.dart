import 'package:flutter/material.dart';

class EnvironmentVariables {
  static const googleApiKey = String.fromEnvironment('GOOGLE_API_KEY');
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Static Maps View'),
        ),
        body: StaticMapView(),
      ),
    );
  }
}

class StaticMapView extends StatelessWidget {
  static const _baseMapURL = 'https://maps.googleapis.com/maps/api/staticmap';
  static const _latitude = 35.667097;
  static const _longitude = 139.740178;
  static const _mapZoom = 'zoom=18';
  static const _mapSize = 'size=720x640';
  static const _scale = 'scale=2';
  static const _language = 'language=ja';
  static const _mapCenter = 'center=$_latitude,$_longitude';
  static const _mapMarkers = 'markers=$_latitude,$_longitude';
  static const _apiKey = 'key=${EnvironmentVariables.googleApiKey}';
  static const _imageUrl =
      '$_baseMapURL?$_mapCenter&$_mapZoom&$_mapMarkers&$_mapSize&$_scale&$_language&$_apiKey';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 240,
            ),
            Image.network(
              _imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 240,
            ),
          ],
        ),
      ),
    );
  }
}
