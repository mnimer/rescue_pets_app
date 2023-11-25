// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetListStruct extends FFFirebaseStruct {
  PetListStruct({
    String? last,
    List<PetsStruct>? pets,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _last = last,
        _pets = pets,
        super(firestoreUtilData);

  // "last" field.
  String? _last;
  String get last => _last ?? '';
  set last(String? val) => _last = val;
  bool hasLast() => _last != null;

  // "pets" field.
  List<PetsStruct>? _pets;
  List<PetsStruct> get pets => _pets ?? const [];
  set pets(List<PetsStruct>? val) => _pets = val;
  void updatePets(Function(List<PetsStruct>) updateFn) =>
      updateFn(_pets ??= []);
  bool hasPets() => _pets != null;

  static PetListStruct fromMap(Map<String, dynamic> data) => PetListStruct(
        last: data['last'] as String?,
        pets: getStructList(
          data['pets'],
          PetsStruct.fromMap,
        ),
      );

  static PetListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PetListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'last': _last,
        'pets': _pets?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'last': serializeParam(
          _last,
          ParamType.String,
        ),
        'pets': serializeParam(
          _pets,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static PetListStruct fromSerializableMap(Map<String, dynamic> data) =>
      PetListStruct(
        last: deserializeParam(
          data['last'],
          ParamType.String,
          false,
        ),
        pets: deserializeStructParam<PetsStruct>(
          data['pets'],
          ParamType.DataStruct,
          true,
          structBuilder: PetsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PetListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PetListStruct &&
        last == other.last &&
        listEquality.equals(pets, other.pets);
  }

  @override
  int get hashCode => const ListEquality().hash([last, pets]);
}

PetListStruct createPetListStruct({
  String? last,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PetListStruct(
      last: last,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PetListStruct? updatePetListStruct(
  PetListStruct? petList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    petList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPetListStructData(
  Map<String, dynamic> firestoreData,
  PetListStruct? petList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (petList == null) {
    return;
  }
  if (petList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && petList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final petListData = getPetListFirestoreData(petList, forFieldValue);
  final nestedData = petListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = petList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPetListFirestoreData(
  PetListStruct? petList, [
  bool forFieldValue = false,
]) {
  if (petList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(petList.toMap());

  // Add any Firestore field values
  petList.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPetListListFirestoreData(
  List<PetListStruct>? petLists,
) =>
    petLists?.map((e) => getPetListFirestoreData(e, true)).toList() ?? [];
