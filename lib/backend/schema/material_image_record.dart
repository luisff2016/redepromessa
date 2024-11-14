import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialImageRecord extends FirestoreRecord {
  MaterialImageRecord._(
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

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_image')
          : FirebaseFirestore.instance.collectionGroup('material_image');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_image').doc(id);

  static Stream<MaterialImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialImageRecord.fromSnapshot(s));

  static Future<MaterialImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialImageRecord.fromSnapshot(s));

  static MaterialImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialImageRecordData({
  String? title,
  String? description,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialImageRecordDocumentEquality
    implements Equality<MaterialImageRecord> {
  const MaterialImageRecordDocumentEquality();

  @override
  bool equals(MaterialImageRecord? e1, MaterialImageRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(MaterialImageRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is MaterialImageRecord;
}
