import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContributionsRecord extends FirestoreRecord {
  ContributionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "contribution_type" field.
  ContributionType? _contributionType;
  ContributionType? get contributionType => _contributionType;
  bool hasContributionType() => _contributionType != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

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

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  // "cont_status" field.
  ContributionStatus? _contStatus;
  ContributionStatus? get contStatus => _contStatus;
  bool hasContStatus() => _contStatus != null;

  // "contribution_date" field.
  DateTime? _contributionDate;
  DateTime? get contributionDate => _contributionDate;
  bool hasContributionDate() => _contributionDate != null;

  // "confirmation_date" field.
  DateTime? _confirmationDate;
  DateTime? get confirmationDate => _confirmationDate;
  bool hasConfirmationDate() => _confirmationDate != null;

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
    _contributionType =
        deserializeEnum<ContributionType>(snapshotData['contribution_type']);
    _amount = castToType<double>(snapshotData['amount']);
    _description = snapshotData['description'] as String?;
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _orgId = snapshotData['org_id'] as DocumentReference?;
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _contStatus =
        deserializeEnum<ContributionStatus>(snapshotData['cont_status']);
    _contributionDate = snapshotData['contribution_date'] as DateTime?;
    _confirmationDate = snapshotData['confirmation_date'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updateAt = snapshotData['update_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contributions');

  static Stream<ContributionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContributionsRecord.fromSnapshot(s));

  static Future<ContributionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContributionsRecord.fromSnapshot(s));

  static ContributionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContributionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContributionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContributionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContributionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContributionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContributionsRecordData({
  DocumentReference? userId,
  ContributionType? contributionType,
  double? amount,
  String? description,
  DocumentReference? churchId,
  DocumentReference? orgId,
  DocumentReference? projectId,
  DocumentReference? eventId,
  ContributionStatus? contStatus,
  DateTime? contributionDate,
  DateTime? confirmationDate,
  DateTime? createdAt,
  DateTime? updateAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'contribution_type': contributionType,
      'amount': amount,
      'description': description,
      'church_id': churchId,
      'org_id': orgId,
      'project_id': projectId,
      'event_id': eventId,
      'cont_status': contStatus,
      'contribution_date': contributionDate,
      'confirmation_date': confirmationDate,
      'created_at': createdAt,
      'update_at': updateAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContributionsRecordDocumentEquality
    implements Equality<ContributionsRecord> {
  const ContributionsRecordDocumentEquality();

  @override
  bool equals(ContributionsRecord? e1, ContributionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.contributionType == e2?.contributionType &&
        e1?.amount == e2?.amount &&
        e1?.description == e2?.description &&
        e1?.churchId == e2?.churchId &&
        e1?.orgId == e2?.orgId &&
        e1?.projectId == e2?.projectId &&
        e1?.eventId == e2?.eventId &&
        e1?.contStatus == e2?.contStatus &&
        e1?.contributionDate == e2?.contributionDate &&
        e1?.confirmationDate == e2?.confirmationDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updateAt == e2?.updateAt;
  }

  @override
  int hash(ContributionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.contributionType,
        e?.amount,
        e?.description,
        e?.churchId,
        e?.orgId,
        e?.projectId,
        e?.eventId,
        e?.contStatus,
        e?.contributionDate,
        e?.confirmationDate,
        e?.createdAt,
        e?.updateAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ContributionsRecord;
}
