import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialPdfRecord extends FirestoreRecord {
  MaterialPdfRecord._(
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

  // "document_url" field.
  String? _documentUrl;
  String get documentUrl => _documentUrl ?? '';
  bool hasDocumentUrl() => _documentUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _documentUrl = snapshotData['document_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_pdf')
          : FirebaseFirestore.instance.collectionGroup('material_pdf');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_pdf').doc(id);

  static Stream<MaterialPdfRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialPdfRecord.fromSnapshot(s));

  static Future<MaterialPdfRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialPdfRecord.fromSnapshot(s));

  static MaterialPdfRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialPdfRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialPdfRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialPdfRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialPdfRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialPdfRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialPdfRecordData({
  String? title,
  String? description,
  String? documentUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'document_url': documentUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialPdfRecordDocumentEquality implements Equality<MaterialPdfRecord> {
  const MaterialPdfRecordDocumentEquality();

  @override
  bool equals(MaterialPdfRecord? e1, MaterialPdfRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.documentUrl == e2?.documentUrl;
  }

  @override
  int hash(MaterialPdfRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.documentUrl]);

  @override
  bool isValidKey(Object? o) => o is MaterialPdfRecord;
}
