import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberFunctionsRecord extends FirestoreRecord {
  MemberFunctionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "role" field.
  MemberRole? _role;
  MemberRole? get role => _role;
  bool hasRole() => _role != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "church_id" field.
  DocumentReference? _churchId;
  DocumentReference? get churchId => _churchId;
  bool hasChurchId() => _churchId != null;

  // "org_id" field.
  DocumentReference? _orgId;
  DocumentReference? get orgId => _orgId;
  bool hasOrgId() => _orgId != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "update_at" field.
  DateTime? _updateAt;
  DateTime? get updateAt => _updateAt;
  bool hasUpdateAt() => _updateAt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _role = deserializeEnum<MemberRole>(snapshotData['role']);
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _orgId = snapshotData['org_id'] as DocumentReference?;
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updateAt = snapshotData['update_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('member_functions');

  static Stream<MemberFunctionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemberFunctionsRecord.fromSnapshot(s));

  static Future<MemberFunctionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemberFunctionsRecord.fromSnapshot(s));

  static MemberFunctionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemberFunctionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemberFunctionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemberFunctionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemberFunctionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemberFunctionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemberFunctionsRecordData({
  DocumentReference? userId,
  MemberRole? role,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? churchId,
  DocumentReference? orgId,
  DocumentReference? projectId,
  bool? status,
  DateTime? createdAt,
  DateTime? updateAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'role': role,
      'start_date': startDate,
      'end_date': endDate,
      'church_id': churchId,
      'org_id': orgId,
      'project_id': projectId,
      'status': status,
      'created_at': createdAt,
      'update_at': updateAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemberFunctionsRecordDocumentEquality
    implements Equality<MemberFunctionsRecord> {
  const MemberFunctionsRecordDocumentEquality();

  @override
  bool equals(MemberFunctionsRecord? e1, MemberFunctionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.role == e2?.role &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.churchId == e2?.churchId &&
        e1?.orgId == e2?.orgId &&
        e1?.projectId == e2?.projectId &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updateAt == e2?.updateAt;
  }

  @override
  int hash(MemberFunctionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.role,
        e?.startDate,
        e?.endDate,
        e?.churchId,
        e?.orgId,
        e?.projectId,
        e?.status,
        e?.createdAt,
        e?.updateAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MemberFunctionsRecord;
}
