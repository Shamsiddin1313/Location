import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:location_package/src/location_client.dart';

class LocationService {
  final _locationClient = LocationClient();
  bool _isServiceRunning = false;
  LatLng? _currPosition;
  final _points = <LatLng>[];
  StreamSubscription<LatLng>? _locationSubscription;

  LocationService() {
    _init();
  }

  void _init() {
    _locationClient.init();
    _listenLocation();
    Timer.periodic(const Duration(seconds: 30), (_) {
      _listenLocation();
    });
  }

  LatLng? get currentPosition => _currPosition;
  List<LatLng> get points => List.unmodifiable(_points);

  void _listenLocation() async {
    if (!_isServiceRunning && await _locationClient.isServiceEnabled()) {
      _isServiceRunning = true;
      _locationSubscription = _locationClient.locationStream.listen((event) {
        _currPosition = event;
        _points.add(_currPosition!);
      });
    } else {
      _isServiceRunning = false;
    }
  }

  void dispose() {
    _locationSubscription?.cancel();
  }
}
