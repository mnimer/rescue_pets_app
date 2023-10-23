// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrgLocationStruct extends FFFirebaseStruct {
  OrgLocationStruct({
    List<double>? center,
    String? geoHash,
    List<String>? hexArray,
    double? lat,
    double? lng,
    String? placeId,
    LatLng? latAndLng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _center = center,
        _geoHash = geoHash,
        _hexArray = hexArray,
        _lat = lat,
        _lng = lng,
        _placeId = placeId,
        _latAndLng = latAndLng,
        super(firestoreUtilData);

  // "center" field.
  List<double>? _center;
  List<double> get center => _center ?? const [];
  set center(List<double>? val) => _center = val;
  void updateCenter(Function(List<double>) updateFn) =>
      updateFn(_center ??= []);
  bool hasCenter() => _center != null;

  // "geoHash" field.
  String? _geoHash;
  String get geoHash => _geoHash ?? '';
  set geoHash(String? val) => _geoHash = val;
  bool hasGeoHash() => _geoHash != null;

  // "hexArray" field.
  List<String>? _hexArray;
  List<String> get hexArray => _hexArray ?? const [];
  set hexArray(List<String>? val) => _hexArray = val;
  void updateHexArray(Function(List<String>) updateFn) =>
      updateFn(_hexArray ??= []);
  bool hasHexArray() => _hexArray != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;
  void incrementLat(double amount) => _lat = lat + amount;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;
  void incrementLng(double amount) => _lng = lng + amount;
  bool hasLng() => _lng != null;

  // "placeId" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  set placeId(String? val) => _placeId = val;
  bool hasPlaceId() => _placeId != null;

  // "LatAndLng" field.
  LatLng? _latAndLng;
  LatLng? get latAndLng => _latAndLng;
  set latAndLng(LatLng? val) => _latAndLng = val;
  bool hasLatAndLng() => _latAndLng != null;

  static OrgLocationStruct fromMap(Map<String, dynamic> data) =>
      OrgLocationStruct(
        center: getDataList(data['center']),
        geoHash: data['geoHash'] as String?,
        hexArray: getDataList(data['hexArray']),
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        placeId: data['placeId'] as String?,
        latAndLng: data['LatAndLng'] as LatLng?,
      );

  static OrgLocationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrgLocationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'center': _center,
        'geoHash': _geoHash,
        'hexArray': _hexArray,
        'lat': _lat,
        'lng': _lng,
        'placeId': _placeId,
        'LatAndLng': _latAndLng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'center': serializeParam(
          _center,
          ParamType.double,
          true,
        ),
        'geoHash': serializeParam(
          _geoHash,
          ParamType.String,
        ),
        'hexArray': serializeParam(
          _hexArray,
          ParamType.String,
          true,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'placeId': serializeParam(
          _placeId,
          ParamType.String,
        ),
        'LatAndLng': serializeParam(
          _latAndLng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static OrgLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrgLocationStruct(
        center: deserializeParam<double>(
          data['center'],
          ParamType.double,
          true,
        ),
        geoHash: deserializeParam(
          data['geoHash'],
          ParamType.String,
          false,
        ),
        hexArray: deserializeParam<String>(
          data['hexArray'],
          ParamType.String,
          true,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        placeId: deserializeParam(
          data['placeId'],
          ParamType.String,
          false,
        ),
        latAndLng: deserializeParam(
          data['LatAndLng'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'OrgLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrgLocationStruct &&
        listEquality.equals(center, other.center) &&
        geoHash == other.geoHash &&
        listEquality.equals(hexArray, other.hexArray) &&
        lat == other.lat &&
        lng == other.lng &&
        placeId == other.placeId &&
        latAndLng == other.latAndLng;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([center, geoHash, hexArray, lat, lng, placeId, latAndLng]);
}

OrgLocationStruct createOrgLocationStruct({
  String? geoHash,
  double? lat,
  double? lng,
  String? placeId,
  LatLng? latAndLng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrgLocationStruct(
      geoHash: geoHash,
      lat: lat,
      lng: lng,
      placeId: placeId,
      latAndLng: latAndLng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrgLocationStruct? updateOrgLocationStruct(
  OrgLocationStruct? orgLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orgLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrgLocationStructData(
  Map<String, dynamic> firestoreData,
  OrgLocationStruct? orgLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orgLocation == null) {
    return;
  }
  if (orgLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orgLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orgLocationData =
      getOrgLocationFirestoreData(orgLocation, forFieldValue);
  final nestedData =
      orgLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orgLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrgLocationFirestoreData(
  OrgLocationStruct? orgLocation, [
  bool forFieldValue = false,
]) {
  if (orgLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orgLocation.toMap());

  // Add any Firestore field values
  orgLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrgLocationListFirestoreData(
  List<OrgLocationStruct>? orgLocations,
) =>
    orgLocations?.map((e) => getOrgLocationFirestoreData(e, true)).toList() ??
    [];
