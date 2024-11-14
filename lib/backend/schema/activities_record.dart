import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitiesRecord extends FirestoreRecord {
  ActivitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "act_status" field.
  ActivityStatus? _actStatus;
  ActivityStatus? get actStatus => _actStatus;
  bool hasActStatus() => _actStatus != null;

  // "act_created_by" field.
  DocumentReference? _actCreatedBy;
  DocumentReference? get actCreatedBy => _actCreatedBy;
  bool hasActCreatedBy() => _actCreatedBy != null;

  // "act_created_at" field.
  DateTime? _actCreatedAt;
  DateTime? get actCreatedAt => _actCreatedAt;
  bool hasActCreatedAt() => _actCreatedAt != null;

  // "act_updated_at" field.
  DateTime? _actUpdatedAt;
  DateTime? get actUpdatedAt => _actUpdatedAt;
  bool hasActUpdatedAt() => _actUpdatedAt != null;

  // "act_type" field.
  ActivityType? _actType;
  ActivityType? get actType => _actType;
  bool hasActType() => _actType != null;

  void _initializeFields() {
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _actStatus = deserializeEnum<ActivityStatus>(snapshotData['act_status']);
    _actCreatedBy = snapshotData['act_created_by'] as DocumentReference?;
    _actCreatedAt = snapshotData['act_created_at'] as DateTime?;
    _actUpdatedAt = snapshotData['act_updated_at'] as DateTime?;
    _actType = deserializeEnum<ActivityType>(snapshotData['act_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activities');

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesRecord.fromSnapshot(s));

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitiesRecord.fromSnapshot(s));

  static ActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesRecordData({
  DocumentReference? projectId,
  String? name,
  String? description,
  DateTime? date,
  String? location,
  ActivityStatus? actStatus,
  DocumentReference? actCreatedBy,
  DateTime? actCreatedAt,
  DateTime? actUpdatedAt,
  ActivityType? actType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'project_id': projectId,
      'name': name,
      'description': description,
      'date': date,
      'location': location,
      'act_status': actStatus,
      'act_created_by': actCreatedBy,
      'act_created_at': actCreatedAt,
      'act_updated_at': actUpdatedAt,
      'act_type': actType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesRecordDocumentEquality implements Equality<ActivitiesRecord> {
  const ActivitiesRecordDocumentEquality();

  @override
  bool equals(ActivitiesRecord? e1, ActivitiesRecord? e2) {
    return e1?.projectId == e2?.projectId &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.actStatus == e2?.actStatus &&
        e1?.actCreatedBy == e2?.actCreatedBy &&
        e1?.actCreatedAt == e2?.actCreatedAt &&
        e1?.actUpdatedAt == e2?.actUpdatedAt &&
        e1?.actType == e2?.actType;
  }

  @override
  int hash(ActivitiesRecord? e) => const ListEquality().hash([
        e?.projectId,
        e?.name,
        e?.description,
        e?.date,
        e?.location,
        e?.actStatus,
        e?.actCreatedBy,
        e?.actCreatedAt,
        e?.actUpdatedAt,
        e?.actType
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesRecord;
}
