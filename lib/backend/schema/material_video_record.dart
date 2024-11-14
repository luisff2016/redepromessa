import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialVideoRecord extends FirestoreRecord {
  MaterialVideoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_video')
          : FirebaseFirestore.instance.collectionGroup('material_video');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_video').doc(id);

  static Stream<MaterialVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialVideoRecord.fromSnapshot(s));

  static Future<MaterialVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialVideoRecord.fromSnapshot(s));

  static MaterialVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialVideoRecordData({
  String? title,
  String? description,
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'video_url': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialVideoRecordDocumentEquality
    implements Equality<MaterialVideoRecord> {
  const MaterialVideoRecordDocumentEquality();

  @override
  bool equals(MaterialVideoRecord? e1, MaterialVideoRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(MaterialVideoRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.videoUrl]);

  @override
  bool isValidKey(Object? o) => o is MaterialVideoRecord;
}
