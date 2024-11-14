import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequirementsRecord extends FirestoreRecord {
  RequirementsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requirements')
          : FirebaseFirestore.instance.collectionGroup('requirements');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('requirements').doc(id);

  static Stream<RequirementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequirementsRecord.fromSnapshot(s));

  static Future<RequirementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequirementsRecord.fromSnapshot(s));

  static RequirementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequirementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequirementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequirementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequirementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequirementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequirementsRecordData({
  String? description,
  String? type,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'type': type,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequirementsRecordDocumentEquality
    implements Equality<RequirementsRecord> {
  const RequirementsRecordDocumentEquality();

  @override
  bool equals(RequirementsRecord? e1, RequirementsRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status;
  }

  @override
  int hash(RequirementsRecord? e) =>
      const ListEquality().hash([e?.description, e?.type, e?.status]);

  @override
  bool isValidKey(Object? o) => o is RequirementsRecord;
}
