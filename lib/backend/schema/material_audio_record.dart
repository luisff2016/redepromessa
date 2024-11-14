import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialAudioRecord extends FirestoreRecord {
  MaterialAudioRecord._(
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

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_audio')
          : FirebaseFirestore.instance.collectionGroup('material_audio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_audio').doc(id);

  static Stream<MaterialAudioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialAudioRecord.fromSnapshot(s));

  static Future<MaterialAudioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialAudioRecord.fromSnapshot(s));

  static MaterialAudioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialAudioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialAudioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialAudioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialAudioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialAudioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialAudioRecordData({
  String? title,
  String? description,
  String? audioUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'audio_url': audioUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialAudioRecordDocumentEquality
    implements Equality<MaterialAudioRecord> {
  const MaterialAudioRecordDocumentEquality();

  @override
  bool equals(MaterialAudioRecord? e1, MaterialAudioRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.audioUrl == e2?.audioUrl;
  }

  @override
  int hash(MaterialAudioRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.audioUrl]);

  @override
  bool isValidKey(Object? o) => o is MaterialAudioRecord;
}
