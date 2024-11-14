import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialPptRecord extends FirestoreRecord {
  MaterialPptRecord._(
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

  // "ppt_url" field.
  String? _pptUrl;
  String get pptUrl => _pptUrl ?? '';
  bool hasPptUrl() => _pptUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _pptUrl = snapshotData['ppt_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_ppt')
          : FirebaseFirestore.instance.collectionGroup('material_ppt');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_ppt').doc(id);

  static Stream<MaterialPptRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialPptRecord.fromSnapshot(s));

  static Future<MaterialPptRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialPptRecord.fromSnapshot(s));

  static MaterialPptRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialPptRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialPptRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialPptRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialPptRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialPptRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialPptRecordData({
  String? title,
  String? description,
  String? pptUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'ppt_url': pptUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialPptRecordDocumentEquality implements Equality<MaterialPptRecord> {
  const MaterialPptRecordDocumentEquality();

  @override
  bool equals(MaterialPptRecord? e1, MaterialPptRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.pptUrl == e2?.pptUrl;
  }

  @override
  int hash(MaterialPptRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.pptUrl]);

  @override
  bool isValidKey(Object? o) => o is MaterialPptRecord;
}
