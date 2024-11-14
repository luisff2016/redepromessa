import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityAlbumRecord extends FirestoreRecord {
  ActivityAlbumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date_include_item" field.
  DateTime? _dateIncludeItem;
  DateTime? get dateIncludeItem => _dateIncludeItem;
  bool hasDateIncludeItem() => _dateIncludeItem != null;

  // "album_photo" field.
  List<String>? _albumPhoto;
  List<String> get albumPhoto => _albumPhoto ?? const [];
  bool hasAlbumPhoto() => _albumPhoto != null;

  // "album_text" field.
  String? _albumText;
  String get albumText => _albumText ?? '';
  bool hasAlbumText() => _albumText != null;

  void _initializeFields() {
    _dateIncludeItem = snapshotData['date_include_item'] as DateTime?;
    _albumPhoto = getDataList(snapshotData['album_photo']);
    _albumText = snapshotData['album_text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity_album');

  static Stream<ActivityAlbumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityAlbumRecord.fromSnapshot(s));

  static Future<ActivityAlbumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityAlbumRecord.fromSnapshot(s));

  static ActivityAlbumRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityAlbumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityAlbumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityAlbumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityAlbumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityAlbumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityAlbumRecordData({
  DateTime? dateIncludeItem,
  String? albumText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_include_item': dateIncludeItem,
      'album_text': albumText,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityAlbumRecordDocumentEquality
    implements Equality<ActivityAlbumRecord> {
  const ActivityAlbumRecordDocumentEquality();

  @override
  bool equals(ActivityAlbumRecord? e1, ActivityAlbumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateIncludeItem == e2?.dateIncludeItem &&
        listEquality.equals(e1?.albumPhoto, e2?.albumPhoto) &&
        e1?.albumText == e2?.albumText;
  }

  @override
  int hash(ActivityAlbumRecord? e) => const ListEquality()
      .hash([e?.dateIncludeItem, e?.albumPhoto, e?.albumText]);

  @override
  bool isValidKey(Object? o) => o is ActivityAlbumRecord;
}
