import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrgsRecord extends FirestoreRecord {
  OrgsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orgID" field.
  String? _orgID;
  String get orgID => _orgID ?? '';
  bool hasOrgID() => _orgID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "fax" field.
  String? _fax;
  String get fax => _fax ?? '';
  bool hasFax() => _fax != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "orgurl" field.
  String? _orgurl;
  String get orgurl => _orgurl ?? '';
  bool hasOrgurl() => _orgurl != null;

  // "facebookUrl" field.
  String? _facebookUrl;
  String get facebookUrl => _facebookUrl ?? '';
  bool hasFacebookUrl() => _facebookUrl != null;

  // "orgType" field.
  String? _orgType;
  String get orgType => _orgType ?? '';
  bool hasOrgType() => _orgType != null;

  // "orgSpecies" field.
  String? _orgSpecies;
  String get orgSpecies => _orgSpecies ?? '';
  bool hasOrgSpecies() => _orgSpecies != null;

  // "serveAreas" field.
  String? _serveAreas;
  String get serveAreas => _serveAreas ?? '';
  bool hasServeAreas() => _serveAreas != null;

  // "adoptionProcess" field.
  String? _adoptionProcess;
  String get adoptionProcess => _adoptionProcess ?? '';
  bool hasAdoptionProcess() => _adoptionProcess != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "meetPets" field.
  String? _meetPets;
  String get meetPets => _meetPets ?? '';
  bool hasMeetPets() => _meetPets != null;

  // "services" field.
  String? _services;
  String get services => _services ?? '';
  bool hasServices() => _services != null;

  // "allowAppSubmissions" field.
  String? _allowAppSubmissions;
  String get allowAppSubmissions => _allowAppSubmissions ?? '';
  bool hasAllowAppSubmissions() => _allowAppSubmissions != null;

  // "messageOrg" field.
  String? _messageOrg;
  String get messageOrg => _messageOrg ?? '';
  bool hasMessageOrg() => _messageOrg != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "saveInCollection" field.
  DateTime? _saveInCollection;
  DateTime? get saveInCollection => _saveInCollection;
  bool hasSaveInCollection() => _saveInCollection != null;

  // "location" field.
  OrgLocationStruct? _location;
  OrgLocationStruct get location => _location ?? OrgLocationStruct();
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _orgID = snapshotData['orgID'] as String?;
    _status = snapshotData['status'] as String?;
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _zip = snapshotData['zip'] as String?;
    _country = snapshotData['country'] as String?;
    _phone = snapshotData['phone'] as String?;
    _fax = snapshotData['fax'] as String?;
    _email = snapshotData['email'] as String?;
    _orgurl = snapshotData['orgurl'] as String?;
    _facebookUrl = snapshotData['facebookUrl'] as String?;
    _orgType = snapshotData['orgType'] as String?;
    _orgSpecies = snapshotData['orgSpecies'] as String?;
    _serveAreas = snapshotData['serveAreas'] as String?;
    _adoptionProcess = snapshotData['adoptionProcess'] as String?;
    _about = snapshotData['about'] as String?;
    _meetPets = snapshotData['meetPets'] as String?;
    _services = snapshotData['services'] as String?;
    _allowAppSubmissions = snapshotData['allowAppSubmissions'] as String?;
    _messageOrg = snapshotData['messageOrg'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _saveInCollection = snapshotData['saveInCollection'] as DateTime?;
    _location = OrgLocationStruct.maybeFromMap(snapshotData['location']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orgs');

  static Stream<OrgsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrgsRecord.fromSnapshot(s));

  static Future<OrgsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrgsRecord.fromSnapshot(s));

  static OrgsRecord fromSnapshot(DocumentSnapshot snapshot) => OrgsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrgsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrgsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrgsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrgsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrgsRecordData({
  String? orgID,
  String? status,
  String? name,
  String? address,
  String? city,
  String? state,
  String? zip,
  String? country,
  String? phone,
  String? fax,
  String? email,
  String? orgurl,
  String? facebookUrl,
  String? orgType,
  String? orgSpecies,
  String? serveAreas,
  String? adoptionProcess,
  String? about,
  String? meetPets,
  String? services,
  String? allowAppSubmissions,
  String? messageOrg,
  bool? isDeleted,
  DateTime? saveInCollection,
  OrgLocationStruct? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orgID': orgID,
      'status': status,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
      'phone': phone,
      'fax': fax,
      'email': email,
      'orgurl': orgurl,
      'facebookUrl': facebookUrl,
      'orgType': orgType,
      'orgSpecies': orgSpecies,
      'serveAreas': serveAreas,
      'adoptionProcess': adoptionProcess,
      'about': about,
      'meetPets': meetPets,
      'services': services,
      'allowAppSubmissions': allowAppSubmissions,
      'messageOrg': messageOrg,
      'isDeleted': isDeleted,
      'saveInCollection': saveInCollection,
      'location': OrgLocationStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "location" field.
  addOrgLocationStructData(firestoreData, location, 'location');

  return firestoreData;
}

class OrgsRecordDocumentEquality implements Equality<OrgsRecord> {
  const OrgsRecordDocumentEquality();

  @override
  bool equals(OrgsRecord? e1, OrgsRecord? e2) {
    return e1?.orgID == e2?.orgID &&
        e1?.status == e2?.status &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.zip == e2?.zip &&
        e1?.country == e2?.country &&
        e1?.phone == e2?.phone &&
        e1?.fax == e2?.fax &&
        e1?.email == e2?.email &&
        e1?.orgurl == e2?.orgurl &&
        e1?.facebookUrl == e2?.facebookUrl &&
        e1?.orgType == e2?.orgType &&
        e1?.orgSpecies == e2?.orgSpecies &&
        e1?.serveAreas == e2?.serveAreas &&
        e1?.adoptionProcess == e2?.adoptionProcess &&
        e1?.about == e2?.about &&
        e1?.meetPets == e2?.meetPets &&
        e1?.services == e2?.services &&
        e1?.allowAppSubmissions == e2?.allowAppSubmissions &&
        e1?.messageOrg == e2?.messageOrg &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.saveInCollection == e2?.saveInCollection &&
        e1?.location == e2?.location;
  }

  @override
  int hash(OrgsRecord? e) => const ListEquality().hash([
        e?.orgID,
        e?.status,
        e?.name,
        e?.address,
        e?.city,
        e?.state,
        e?.zip,
        e?.country,
        e?.phone,
        e?.fax,
        e?.email,
        e?.orgurl,
        e?.facebookUrl,
        e?.orgType,
        e?.orgSpecies,
        e?.serveAreas,
        e?.adoptionProcess,
        e?.about,
        e?.meetPets,
        e?.services,
        e?.allowAppSubmissions,
        e?.messageOrg,
        e?.isDeleted,
        e?.saveInCollection,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is OrgsRecord;
}
