import 'package:flutter/material.dart';
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
    _safeInit(() {
      _user = prefs.getString('ff_user')?.ref ?? _user;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _searchBreed = '';
  String get searchBreed => _searchBreed;
  set searchBreed(String value) {
    _searchBreed = value;
    prefs.setString('ff_searchBreed', value);
  }

  bool _searchDogs = true;
  bool get searchDogs => _searchDogs;
  set searchDogs(bool value) {
    _searchDogs = value;
    prefs.setBool('ff_searchDogs', value);
  }

  bool _searchCats = true;
  bool get searchCats => _searchCats;
  set searchCats(bool value) {
    _searchCats = value;
    prefs.setBool('ff_searchCats', value);
  }

  int _searchDistance = 50;
  int get searchDistance => _searchDistance;
  set searchDistance(int value) {
    _searchDistance = value;
    prefs.setInt('ff_searchDistance', value);
  }

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
  }

  bool _searchFavorites = false;
  bool get searchFavorites => _searchFavorites;
  set searchFavorites(bool value) {
    _searchFavorites = value;
  }

  int _last = 0;
  int get last => _last;
  set last(int value) {
    _last = value;
  }

  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? value) {
    _user = value;
    value != null
        ? prefs.setString('ff_user', value.path)
        : prefs.remove('ff_user');
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
