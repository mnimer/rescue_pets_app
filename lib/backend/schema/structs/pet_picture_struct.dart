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
    String? originalUrl,
    String? smallUrlBase64,
    String? originalUrlPath,
    String? originalUrlCdnLink,
    int? mediaOrder,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _smallUrl = smallUrl,
        _largeUrl = largeUrl,
        _fullsizeUrl = fullsizeUrl,
        _originalUrl = originalUrl,
        _smallUrlBase64 = smallUrlBase64,
        _originalUrlPath = originalUrlPath,
        _originalUrlCdnLink = originalUrlCdnLink,
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

  // "originalUrl" field.
  String? _originalUrl;
  String get originalUrl => _originalUrl ?? '';
  set originalUrl(String? val) => _originalUrl = val;
  bool hasOriginalUrl() => _originalUrl != null;

  // "smallUrlBase64" field.
  String? _smallUrlBase64;
  String get smallUrlBase64 => _smallUrlBase64 ?? '';
  set smallUrlBase64(String? val) => _smallUrlBase64 = val;
  bool hasSmallUrlBase64() => _smallUrlBase64 != null;

  // "originalUrlPath" field.
  String? _originalUrlPath;
  String get originalUrlPath => _originalUrlPath ?? '';
  set originalUrlPath(String? val) => _originalUrlPath = val;
  bool hasOriginalUrlPath() => _originalUrlPath != null;

  // "originalUrlCdnLink" field.
  String? _originalUrlCdnLink;
  String get originalUrlCdnLink => _originalUrlCdnLink ?? '';
  set originalUrlCdnLink(String? val) => _originalUrlCdnLink = val;
  bool hasOriginalUrlCdnLink() => _originalUrlCdnLink != null;

  // "mediaOrder" field.
  int? _mediaOrder;
  int get mediaOrder => _mediaOrder ?? 0;
  set mediaOrder(int? val) => _mediaOrder = val;
  void incrementMediaOrder(int amount) => _mediaOrder = mediaOrder + amount;
  bool hasMediaOrder() => _mediaOrder != null;

  static PetPictureStruct fromMap(Map<String, dynamic> data) =>
      PetPictureStruct(
        smallUrl: data['smallUrl'] as String?,
        largeUrl: data['largeUrl'] as String?,
        fullsizeUrl: data['fullsizeUrl'] as String?,
        originalUrl: data['originalUrl'] as String?,
        smallUrlBase64: data['smallUrlBase64'] as String?,
        originalUrlPath: data['originalUrlPath'] as String?,
        originalUrlCdnLink: data['originalUrlCdnLink'] as String?,
        mediaOrder: castToType<int>(data['mediaOrder']),
      );

  static PetPictureStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PetPictureStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'smallUrl': _smallUrl,
        'largeUrl': _largeUrl,
        'fullsizeUrl': _fullsizeUrl,
        'originalUrl': _originalUrl,
        'smallUrlBase64': _smallUrlBase64,
        'originalUrlPath': _originalUrlPath,
        'originalUrlCdnLink': _originalUrlCdnLink,
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
        'originalUrl': serializeParam(
          _originalUrl,
          ParamType.String,
        ),
        'smallUrlBase64': serializeParam(
          _smallUrlBase64,
          ParamType.String,
        ),
        'originalUrlPath': serializeParam(
          _originalUrlPath,
          ParamType.String,
        ),
        'originalUrlCdnLink': serializeParam(
          _originalUrlCdnLink,
          ParamType.String,
        ),
        'mediaOrder': serializeParam(
          _mediaOrder,
          ParamType.int,
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
        originalUrl: deserializeParam(
          data['originalUrl'],
          ParamType.String,
          false,
        ),
        smallUrlBase64: deserializeParam(
          data['smallUrlBase64'],
          ParamType.String,
          false,
        ),
        originalUrlPath: deserializeParam(
          data['originalUrlPath'],
          ParamType.String,
          false,
        ),
        originalUrlCdnLink: deserializeParam(
          data['originalUrlCdnLink'],
          ParamType.String,
          false,
        ),
        mediaOrder: deserializeParam(
          data['mediaOrder'],
          ParamType.int,
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
        originalUrl == other.originalUrl &&
        smallUrlBase64 == other.smallUrlBase64 &&
        originalUrlPath == other.originalUrlPath &&
        originalUrlCdnLink == other.originalUrlCdnLink &&
        mediaOrder == other.mediaOrder;
  }

  @override
  int get hashCode => const ListEquality().hash([
        smallUrl,
        largeUrl,
        fullsizeUrl,
        originalUrl,
        smallUrlBase64,
        originalUrlPath,
        originalUrlCdnLink,
        mediaOrder
      ]);
}

PetPictureStruct createPetPictureStruct({
  String? smallUrl,
  String? largeUrl,
  String? fullsizeUrl,
  String? originalUrl,
  String? smallUrlBase64,
  String? originalUrlPath,
  String? originalUrlCdnLink,
  int? mediaOrder,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PetPictureStruct(
      smallUrl: smallUrl,
      largeUrl: largeUrl,
      fullsizeUrl: fullsizeUrl,
      originalUrl: originalUrl,
      smallUrlBase64: smallUrlBase64,
      originalUrlPath: originalUrlPath,
      originalUrlCdnLink: originalUrlCdnLink,
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
