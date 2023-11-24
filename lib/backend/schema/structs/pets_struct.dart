// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsStruct extends FFFirebaseStruct {
  PetsStruct({
    String? animalID,
    String? orgID,
    String? name,
    String? description,
    String? descriptionPlain,
    List<PetPictureStruct>? pictures,
    String? breed,
    int? likes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _animalID = animalID,
        _orgID = orgID,
        _name = name,
        _description = description,
        _descriptionPlain = descriptionPlain,
        _pictures = pictures,
        _breed = breed,
        _likes = likes,
        super(firestoreUtilData);

  // "animalID" field.
  String? _animalID;
  String get animalID => _animalID ?? '';
  set animalID(String? val) => _animalID = val;
  bool hasAnimalID() => _animalID != null;

  // "orgID" field.
  String? _orgID;
  String get orgID => _orgID ?? '';
  set orgID(String? val) => _orgID = val;
  bool hasOrgID() => _orgID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "descriptionPlain" field.
  String? _descriptionPlain;
  String get descriptionPlain => _descriptionPlain ?? '';
  set descriptionPlain(String? val) => _descriptionPlain = val;
  bool hasDescriptionPlain() => _descriptionPlain != null;

  // "pictures" field.
  List<PetPictureStruct>? _pictures;
  List<PetPictureStruct> get pictures => _pictures ?? const [];
  set pictures(List<PetPictureStruct>? val) => _pictures = val;
  void updatePictures(Function(List<PetPictureStruct>) updateFn) =>
      updateFn(_pictures ??= []);
  bool hasPictures() => _pictures != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  set breed(String? val) => _breed = val;
  bool hasBreed() => _breed != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  set likes(int? val) => _likes = val;
  void incrementLikes(int amount) => _likes = likes + amount;
  bool hasLikes() => _likes != null;

  static PetsStruct fromMap(Map<String, dynamic> data) => PetsStruct(
        animalID: data['animalID'] as String?,
        orgID: data['orgID'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        descriptionPlain: data['descriptionPlain'] as String?,
        pictures: getStructList(
          data['pictures'],
          PetPictureStruct.fromMap,
        ),
        breed: data['breed'] as String?,
        likes: castToType<int>(data['likes']),
      );

  static PetsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PetsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'animalID': _animalID,
        'orgID': _orgID,
        'name': _name,
        'description': _description,
        'descriptionPlain': _descriptionPlain,
        'pictures': _pictures?.map((e) => e.toMap()).toList(),
        'breed': _breed,
        'likes': _likes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'animalID': serializeParam(
          _animalID,
          ParamType.String,
        ),
        'orgID': serializeParam(
          _orgID,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'descriptionPlain': serializeParam(
          _descriptionPlain,
          ParamType.String,
        ),
        'pictures': serializeParam(
          _pictures,
          ParamType.DataStruct,
          true,
        ),
        'breed': serializeParam(
          _breed,
          ParamType.String,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.int,
        ),
      }.withoutNulls;

  static PetsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PetsStruct(
        animalID: deserializeParam(
          data['animalID'],
          ParamType.String,
          false,
        ),
        orgID: deserializeParam(
          data['orgID'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        descriptionPlain: deserializeParam(
          data['descriptionPlain'],
          ParamType.String,
          false,
        ),
        pictures: deserializeStructParam<PetPictureStruct>(
          data['pictures'],
          ParamType.DataStruct,
          true,
          structBuilder: PetPictureStruct.fromSerializableMap,
        ),
        breed: deserializeParam(
          data['breed'],
          ParamType.String,
          false,
        ),
        likes: deserializeParam(
          data['likes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PetsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PetsStruct &&
        animalID == other.animalID &&
        orgID == other.orgID &&
        name == other.name &&
        description == other.description &&
        descriptionPlain == other.descriptionPlain &&
        listEquality.equals(pictures, other.pictures) &&
        breed == other.breed &&
        likes == other.likes;
  }

  @override
  int get hashCode => const ListEquality().hash([
        animalID,
        orgID,
        name,
        description,
        descriptionPlain,
        pictures,
        breed,
        likes
      ]);
}

PetsStruct createPetsStruct({
  String? animalID,
  String? orgID,
  String? name,
  String? description,
  String? descriptionPlain,
  String? breed,
  int? likes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PetsStruct(
      animalID: animalID,
      orgID: orgID,
      name: name,
      description: description,
      descriptionPlain: descriptionPlain,
      breed: breed,
      likes: likes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PetsStruct? updatePetsStruct(
  PetsStruct? pets, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pets
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPetsStructData(
  Map<String, dynamic> firestoreData,
  PetsStruct? pets,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pets == null) {
    return;
  }
  if (pets.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && pets.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final petsData = getPetsFirestoreData(pets, forFieldValue);
  final nestedData = petsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pets.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPetsFirestoreData(
  PetsStruct? pets, [
  bool forFieldValue = false,
]) {
  if (pets == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pets.toMap());

  // Add any Firestore field values
  pets.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPetsListFirestoreData(
  List<PetsStruct>? petss,
) =>
    petss?.map((e) => getPetsFirestoreData(e, true)).toList() ?? [];
