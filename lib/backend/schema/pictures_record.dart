import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PicturesRecord extends FirestoreRecord {
  PicturesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "largeUrl" field.
  String? _largeUrl;
  String get largeUrl => _largeUrl ?? '';
  bool hasLargeUrl() => _largeUrl != null;

  // "smallUrl" field.
  String? _smallUrl;
  String get smallUrl => _smallUrl ?? '';
  bool hasSmallUrl() => _smallUrl != null;

  // "thumbnailUrl" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  bool hasThumbnailUrl() => _thumbnailUrl != null;

  // "fullsizeUrl" field.
  String? _fullsizeUrl;
  String get fullsizeUrl => _fullsizeUrl ?? '';
  bool hasFullsizeUrl() => _fullsizeUrl != null;

  // "mediaOrder" field.
  int? _mediaOrder;
  int get mediaOrder => _mediaOrder ?? 0;
  bool hasMediaOrder() => _mediaOrder != null;

  // "lastUpdated" field.
  int? _lastUpdated;
  int get lastUpdated => _lastUpdated ?? 0;
  bool hasLastUpdated() => _lastUpdated != null;

  void _initializeFields() {
    _largeUrl = snapshotData['largeUrl'] as String?;
    _smallUrl = snapshotData['smallUrl'] as String?;
    _thumbnailUrl = snapshotData['thumbnailUrl'] as String?;
    _fullsizeUrl = snapshotData['fullsizeUrl'] as String?;
    _mediaOrder = castToType<int>(snapshotData['mediaOrder']);
    _lastUpdated = castToType<int>(snapshotData['lastUpdated']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pictures');

  static Stream<PicturesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PicturesRecord.fromSnapshot(s));

  static Future<PicturesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PicturesRecord.fromSnapshot(s));

  static PicturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PicturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PicturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PicturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PicturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PicturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPicturesRecordData({
  String? largeUrl,
  String? smallUrl,
  String? thumbnailUrl,
  String? fullsizeUrl,
  int? mediaOrder,
  int? lastUpdated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'largeUrl': largeUrl,
      'smallUrl': smallUrl,
      'thumbnailUrl': thumbnailUrl,
      'fullsizeUrl': fullsizeUrl,
      'mediaOrder': mediaOrder,
      'lastUpdated': lastUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class PicturesRecordDocumentEquality implements Equality<PicturesRecord> {
  const PicturesRecordDocumentEquality();

  @override
  bool equals(PicturesRecord? e1, PicturesRecord? e2) {
    return e1?.largeUrl == e2?.largeUrl &&
        e1?.smallUrl == e2?.smallUrl &&
        e1?.thumbnailUrl == e2?.thumbnailUrl &&
        e1?.fullsizeUrl == e2?.fullsizeUrl &&
        e1?.mediaOrder == e2?.mediaOrder &&
        e1?.lastUpdated == e2?.lastUpdated;
  }

  @override
  int hash(PicturesRecord? e) => const ListEquality().hash([
        e?.largeUrl,
        e?.smallUrl,
        e?.thumbnailUrl,
        e?.fullsizeUrl,
        e?.mediaOrder,
        e?.lastUpdated
      ]);

  @override
  bool isValidKey(Object? o) => o is PicturesRecord;
}
