import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "animalId" field.
  int? _animalId;
  int get animalId => _animalId ?? 0;
  bool hasAnimalId() => _animalId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "descriptionPlain" field.
  String? _descriptionPlain;
  String get descriptionPlain => _descriptionPlain ?? '';
  bool hasDescriptionPlain() => _descriptionPlain != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "orgID" field.
  String? _orgID;
  String get orgID => _orgID ?? '';
  bool hasOrgID() => _orgID != null;

  // "activityLevel" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  bool hasActivityLevel() => _activityLevel != null;

  // "adoptionFee" field.
  String? _adoptionFee;
  String get adoptionFee => _adoptionFee ?? '';
  bool hasAdoptionFee() => _adoptionFee != null;

  // "affectionate" field.
  String? _affectionate;
  String get affectionate => _affectionate ?? '';
  bool hasAffectionate() => _affectionate != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  bool hasBirthdate() => _birthdate != null;

  // "cats" field.
  String? _cats;
  String get cats => _cats ?? '';
  bool hasCats() => _cats != null;

  // "dogs" field.
  String? _dogs;
  String get dogs => _dogs ?? '';
  bool hasDogs() => _dogs != null;

  // "coatLength" field.
  String? _coatLength;
  String get coatLength => _coatLength ?? '';
  bool hasCoatLength() => _coatLength != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "declawed" field.
  String? _declawed;
  String get declawed => _declawed ?? '';
  bool hasDeclawed() => _declawed != null;

  // "pictures" field.
  List<PetPictureStruct>? _pictures;
  List<PetPictureStruct> get pictures => _pictures ?? const [];
  bool hasPictures() => _pictures != null;

  // "species" field.
  String? _species;
  String get species => _species ?? '';
  bool hasSpecies() => _species != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _breed = snapshotData['breed'] as String?;
    _animalId = castToType<int>(snapshotData['animalId']);
    _description = snapshotData['description'] as String?;
    _descriptionPlain = snapshotData['descriptionPlain'] as String?;
    _name = snapshotData['name'] as String?;
    _orgID = snapshotData['orgID'] as String?;
    _activityLevel = snapshotData['activityLevel'] as String?;
    _adoptionFee = snapshotData['adoptionFee'] as String?;
    _affectionate = snapshotData['affectionate'] as String?;
    _age = snapshotData['age'] as String?;
    _birthdate = snapshotData['birthdate'] as String?;
    _cats = snapshotData['cats'] as String?;
    _dogs = snapshotData['dogs'] as String?;
    _coatLength = snapshotData['coatLength'] as String?;
    _color = snapshotData['color'] as String?;
    _declawed = snapshotData['declawed'] as String?;
    _pictures = getStructList(
      snapshotData['pictures'],
      PetPictureStruct.fromMap,
    );
    _species = snapshotData['species'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pets');

  static Stream<PetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsRecord.fromSnapshot(s));

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsRecord.fromSnapshot(s));

  static PetsRecord fromSnapshot(DocumentSnapshot snapshot) => PetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsRecordData({
  String? breed,
  int? animalId,
  String? description,
  String? descriptionPlain,
  String? name,
  String? orgID,
  String? activityLevel,
  String? adoptionFee,
  String? affectionate,
  String? age,
  String? birthdate,
  String? cats,
  String? dogs,
  String? coatLength,
  String? color,
  String? declawed,
  String? species,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'breed': breed,
      'animalId': animalId,
      'description': description,
      'descriptionPlain': descriptionPlain,
      'name': name,
      'orgID': orgID,
      'activityLevel': activityLevel,
      'adoptionFee': adoptionFee,
      'affectionate': affectionate,
      'age': age,
      'birthdate': birthdate,
      'cats': cats,
      'dogs': dogs,
      'coatLength': coatLength,
      'color': color,
      'declawed': declawed,
      'species': species,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.breed == e2?.breed &&
        e1?.animalId == e2?.animalId &&
        e1?.description == e2?.description &&
        e1?.descriptionPlain == e2?.descriptionPlain &&
        e1?.name == e2?.name &&
        e1?.orgID == e2?.orgID &&
        e1?.activityLevel == e2?.activityLevel &&
        e1?.adoptionFee == e2?.adoptionFee &&
        e1?.affectionate == e2?.affectionate &&
        e1?.age == e2?.age &&
        e1?.birthdate == e2?.birthdate &&
        e1?.cats == e2?.cats &&
        e1?.dogs == e2?.dogs &&
        e1?.coatLength == e2?.coatLength &&
        e1?.color == e2?.color &&
        e1?.declawed == e2?.declawed &&
        listEquality.equals(e1?.pictures, e2?.pictures) &&
        e1?.species == e2?.species &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash([
        e?.breed,
        e?.animalId,
        e?.description,
        e?.descriptionPlain,
        e?.name,
        e?.orgID,
        e?.activityLevel,
        e?.adoptionFee,
        e?.affectionate,
        e?.age,
        e?.birthdate,
        e?.cats,
        e?.dogs,
        e?.coatLength,
        e?.color,
        e?.declawed,
        e?.pictures,
        e?.species,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
