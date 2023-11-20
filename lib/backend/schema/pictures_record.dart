import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PicturesRecord extends FirestoreRecord {
  PicturesRecord._(
    super.reference,
    super.data,
  ) {
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

  // "smallUrlBase64" field.
  String? _smallUrlBase64;
  String get smallUrlBase64 => _smallUrlBase64 ?? '';
  bool hasSmallUrlBase64() => _smallUrlBase64 != null;

  // "originalUrl" field.
  String? _originalUrl;
  String get originalUrl => _originalUrl ?? '';
  bool hasOriginalUrl() => _originalUrl != null;

  // "originalUrlPath" field.
  String? _originalUrlPath;
  String get originalUrlPath => _originalUrlPath ?? '';
  bool hasOriginalUrlPath() => _originalUrlPath != null;

  // "originalUrlCdnLink" field.
  String? _originalUrlCdnLink;
  String get originalUrlCdnLink => _originalUrlCdnLink ?? '';
  bool hasOriginalUrlCdnLink() => _originalUrlCdnLink != null;

  void _initializeFields() {
    _largeUrl = snapshotData['largeUrl'] as String?;
    _smallUrl = snapshotData['smallUrl'] as String?;
    _thumbnailUrl = snapshotData['thumbnailUrl'] as String?;
    _fullsizeUrl = snapshotData['fullsizeUrl'] as String?;
    _mediaOrder = castToType<int>(snapshotData['mediaOrder']);
    _lastUpdated = castToType<int>(snapshotData['lastUpdated']);
    _smallUrlBase64 = snapshotData['smallUrlBase64'] as String?;
    _originalUrl = snapshotData['originalUrl'] as String?;
    _originalUrlPath = snapshotData['originalUrlPath'] as String?;
    _originalUrlCdnLink = snapshotData['originalUrlCdnLink'] as String?;
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
  String? smallUrlBase64,
  String? originalUrl,
  String? originalUrlPath,
  String? originalUrlCdnLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'largeUrl': largeUrl,
      'smallUrl': smallUrl,
      'thumbnailUrl': thumbnailUrl,
      'fullsizeUrl': fullsizeUrl,
      'mediaOrder': mediaOrder,
      'lastUpdated': lastUpdated,
      'smallUrlBase64': smallUrlBase64,
      'originalUrl': originalUrl,
      'originalUrlPath': originalUrlPath,
      'originalUrlCdnLink': originalUrlCdnLink,
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
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.smallUrlBase64 == e2?.smallUrlBase64 &&
        e1?.originalUrl == e2?.originalUrl &&
        e1?.originalUrlPath == e2?.originalUrlPath &&
        e1?.originalUrlCdnLink == e2?.originalUrlCdnLink;
  }

  @override
  int hash(PicturesRecord? e) => const ListEquality().hash([
        e?.largeUrl,
        e?.smallUrl,
        e?.thumbnailUrl,
        e?.fullsizeUrl,
        e?.mediaOrder,
        e?.lastUpdated,
        e?.smallUrlBase64,
        e?.originalUrl,
        e?.originalUrlPath,
        e?.originalUrlCdnLink
      ]);

  @override
  bool isValidKey(Object? o) => o is PicturesRecord;
}
