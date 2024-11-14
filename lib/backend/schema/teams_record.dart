import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamsRecord extends FirestoreRecord {
  TeamsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  List<DocumentReference>? _userId;
  List<DocumentReference> get userId => _userId ?? const [];
  bool hasUserId() => _userId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "requirements_met" field.
  bool? _requirementsMet;
  bool get requirementsMet => _requirementsMet ?? false;
  bool hasRequirementsMet() => _requirementsMet != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = getDataList(snapshotData['user_id']);
    _status = snapshotData['status'] as bool?;
    _requirementsMet = snapshotData['requirements_met'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('teams')
          : FirebaseFirestore.instance.collectionGroup('teams');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('teams').doc(id);

  static Stream<TeamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamsRecord.fromSnapshot(s));

  static Future<TeamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamsRecord.fromSnapshot(s));

  static TeamsRecord fromSnapshot(DocumentSnapshot snapshot) => TeamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamsRecordData({
  bool? status,
  bool? requirementsMet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'requirements_met': requirementsMet,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamsRecordDocumentEquality implements Equality<TeamsRecord> {
  const TeamsRecordDocumentEquality();

  @override
  bool equals(TeamsRecord? e1, TeamsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userId, e2?.userId) &&
        e1?.status == e2?.status &&
        e1?.requirementsMet == e2?.requirementsMet;
  }

  @override
  int hash(TeamsRecord? e) =>
      const ListEquality().hash([e?.userId, e?.status, e?.requirementsMet]);

  @override
  bool isValidKey(Object? o) => o is TeamsRecord;
}
