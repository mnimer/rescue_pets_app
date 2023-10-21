// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetPictureStruct extends FFFirebaseStruct {
  PetPictureStruct({
    String? smallUrl,
    String? largeUrl,
    String? fullsizeUrl,
    String? mediaOrder,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _smallUrl = smallUrl,
        _largeUrl = largeUrl,
        _fullsizeUrl = fullsizeUrl,
        _mediaOrder = mediaOrder,
        super(firestoreUtilData);

  // "smallUrl" field.
  String? _smallUrl;
  String get smallUrl => _smallUrl ?? '';
  set smallUrl(String? val) => _smallUrl = val;
  bool hasSmallUrl() => _smallUrl != null;

  // "largeUrl" field.
  String? _largeUrl;
  String get largeUrl => _largeUrl ?? '';
  set largeUrl(String? val) => _largeUrl = val;
  bool hasLargeUrl() => _largeUrl != null;

  // "fullsizeUrl" field.
  String? _fullsizeUrl;
  String get fullsizeUrl => _fullsizeUrl ?? '';
  set fullsizeUrl(String? val) => _fullsizeUrl = val;
  bool hasFullsizeUrl() => _fullsizeUrl != null;

  // "mediaOrder" field.
  String? _mediaOrder;
  String get mediaOrder => _mediaOrder ?? '';
  set mediaOrder(String? val) => _mediaOrder = val;
  bool hasMediaOrder() => _mediaOrder != null;

  static PetPictureStruct fromMap(Map<String, dynamic> data) =>
      PetPictureStruct(
        smallUrl: data['smallUrl'] as String?,
        largeUrl: data['largeUrl'] as String?,
        fullsizeUrl: data['fullsizeUrl'] as String?,
        mediaOrder: data['mediaOrder'] as String?,
      );

  static PetPictureStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PetPictureStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'smallUrl': _smallUrl,
        'largeUrl': _largeUrl,
        'fullsizeUrl': _fullsizeUrl,
        'mediaOrder': _mediaOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'smallUrl': serializeParam(
          _smallUrl,
          ParamType.String,
        ),
        'largeUrl': serializeParam(
          _largeUrl,
          ParamType.String,
        ),
        'fullsizeUrl': serializeParam(
          _fullsizeUrl,
          ParamType.String,
        ),
        'mediaOrder': serializeParam(
          _mediaOrder,
          ParamType.String,
        ),
      }.withoutNulls;

  static PetPictureStruct fromSerializableMap(Map<String, dynamic> data) =>
      PetPictureStruct(
        smallUrl: deserializeParam(
          data['smallUrl'],
          ParamType.String,
          false,
        ),
        largeUrl: deserializeParam(
          data['largeUrl'],
          ParamType.String,
          false,
        ),
        fullsizeUrl: deserializeParam(
          data['fullsizeUrl'],
          ParamType.String,
          false,
        ),
        mediaOrder: deserializeParam(
          data['mediaOrder'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PetPictureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PetPictureStruct &&
        smallUrl == other.smallUrl &&
        largeUrl == other.largeUrl &&
        fullsizeUrl == other.fullsizeUrl &&
        mediaOrder == other.mediaOrder;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([smallUrl, largeUrl, fullsizeUrl, mediaOrder]);
}

PetPictureStruct createPetPictureStruct({
  String? smallUrl,
  String? largeUrl,
  String? fullsizeUrl,
  String? mediaOrder,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PetPictureStruct(
      smallUrl: smallUrl,
      largeUrl: largeUrl,
      fullsizeUrl: fullsizeUrl,
      mediaOrder: mediaOrder,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PetPictureStruct? updatePetPictureStruct(
  PetPictureStruct? petPicture, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    petPicture
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPetPictureStructData(
  Map<String, dynamic> firestoreData,
  PetPictureStruct? petPicture,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (petPicture == null) {
    return;
  }
  if (petPicture.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && petPicture.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final petPictureData = getPetPictureFirestoreData(petPicture, forFieldValue);
  final nestedData = petPictureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = petPicture.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPetPictureFirestoreData(
  PetPictureStruct? petPicture, [
  bool forFieldValue = false,
]) {
  if (petPicture == null) {
    return {};
  }
  final firestoreData = mapToFirestore(petPicture.toMap());

  // Add any Firestore field values
  petPicture.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPetPictureListFirestoreData(
  List<PetPictureStruct>? petPictures,
) =>
    petPictures?.map((e) => getPetPictureFirestoreData(e, true)).toList() ?? [];
