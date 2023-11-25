import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

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

  // "_allBreeds" field.
  List<String>? _allBreeds;
  List<String> get allBreeds => _allBreeds ?? const [];
  bool hasAllBreeds() => _allBreeds != null;

  // "_birthDate" field.
  int? _birthDate;
  int get birthDate => _birthDate ?? 0;
  bool hasBirthDate() => _birthDate != null;

  // "_mediaLastUpdated" field.
  int? _mediaLastUpdated;
  int get mediaLastUpdated => _mediaLastUpdated ?? 0;
  bool hasMediaLastUpdated() => _mediaLastUpdated != null;

  // "_saveInCollection" field.
  int? _saveInCollection;
  int get saveInCollection => _saveInCollection ?? 0;
  bool hasSaveInCollection() => _saveInCollection != null;

  // "_lastUpdated" field.
  int? _lastUpdated;
  int get lastUpdated => _lastUpdated ?? 0;
  bool hasLastUpdated() => _lastUpdated != null;

  // "location" field.
  OrgLocationStruct? _location;
  OrgLocationStruct get location => _location ?? OrgLocationStruct();
  bool hasLocation() => _location != null;

  // "_isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "animalID" field.
  String? _animalID;
  String get animalID => _animalID ?? '';
  bool hasAnimalID() => _animalID != null;

  // "petImages" field.
  List<String>? _petImages;
  List<String> get petImages => _petImages ?? const [];
  bool hasPetImages() => _petImages != null;

  // "_likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _breed = snapshotData['breed'] as String?;
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
    _allBreeds = getDataList(snapshotData['_allBreeds']);
    _birthDate = castToType<int>(snapshotData['_birthDate']);
    _mediaLastUpdated = castToType<int>(snapshotData['_mediaLastUpdated']);
    _saveInCollection = castToType<int>(snapshotData['_saveInCollection']);
    _lastUpdated = castToType<int>(snapshotData['_lastUpdated']);
    _location = OrgLocationStruct.maybeFromMap(snapshotData['location']);
    _isDeleted = snapshotData['_isDeleted'] as bool?;
    _animalID = snapshotData['animalID'] as String?;
    _petImages = getDataList(snapshotData['petImages']);
    _likes = castToType<int>(snapshotData['_likes']);
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
  int? birthDate,
  int? mediaLastUpdated,
  int? saveInCollection,
  int? lastUpdated,
  OrgLocationStruct? location,
  bool? isDeleted,
  String? animalID,
  int? likes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'breed': breed,
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
      '_birthDate': birthDate,
      '_mediaLastUpdated': mediaLastUpdated,
      '_saveInCollection': saveInCollection,
      '_lastUpdated': lastUpdated,
      'location': OrgLocationStruct().toMap(),
      '_isDeleted': isDeleted,
      'animalID': animalID,
      '_likes': likes,
    }.withoutNulls,
  );

  // Handle nested data for "location" field.
  addOrgLocationStructData(firestoreData, location, 'location');

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.breed == e2?.breed &&
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
        listEquality.equals(e1?.allBreeds, e2?.allBreeds) &&
        e1?.birthDate == e2?.birthDate &&
        e1?.mediaLastUpdated == e2?.mediaLastUpdated &&
        e1?.saveInCollection == e2?.saveInCollection &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.location == e2?.location &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.animalID == e2?.animalID &&
        listEquality.equals(e1?.petImages, e2?.petImages) &&
        e1?.likes == e2?.likes;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash([
        e?.breed,
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
        e?.allBreeds,
        e?.birthDate,
        e?.mediaLastUpdated,
        e?.saveInCollection,
        e?.lastUpdated,
        e?.location,
        e?.isDeleted,
        e?.animalID,
        e?.petImages,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
