import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _searchBreed = prefs.getString('ff_searchBreed') ?? _searchBreed;
    });
    _safeInit(() {
      _searchDogs = prefs.getBool('ff_searchDogs') ?? _searchDogs;
    });
    _safeInit(() {
      _searchCats = prefs.getBool('ff_searchCats') ?? _searchCats;
    });
    _safeInit(() {
      _searchDistance = prefs.getInt('ff_searchDistance') ?? _searchDistance;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _searchBreed = '';
  String get searchBreed => _searchBreed;
  set searchBreed(String _value) {
    _searchBreed = _value;
    prefs.setString('ff_searchBreed', _value);
  }

  bool _searchDogs = true;
  bool get searchDogs => _searchDogs;
  set searchDogs(bool _value) {
    _searchDogs = _value;
    prefs.setBool('ff_searchDogs', _value);
  }

  bool _searchCats = false;
  bool get searchCats => _searchCats;
  set searchCats(bool _value) {
    _searchCats = _value;
    prefs.setBool('ff_searchCats', _value);
  }

  int _searchDistance = 50;
  int get searchDistance => _searchDistance;
  set searchDistance(int _value) {
    _searchDistance = _value;
    prefs.setInt('ff_searchDistance', _value);
  }

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? _value) {
    _userLocation = _value;
  }

  bool _searchFavorites = false;
  bool get searchFavorites => _searchFavorites;
  set searchFavorites(bool _value) {
    _searchFavorites = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
