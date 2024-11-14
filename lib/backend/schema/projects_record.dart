import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "project_type" field.
  String? _projectType;
  String get projectType => _projectType ?? '';
  bool hasProjectType() => _projectType != null;

  // "leader_id" field.
  List<DocumentReference>? _leaderId;
  List<DocumentReference> get leaderId => _leaderId ?? const [];
  bool hasLeaderId() => _leaderId != null;

  // "church_id" field.
  DocumentReference? _churchId;
  DocumentReference? get churchId => _churchId;
  bool hasChurchId() => _churchId != null;

  // "org_id" field.
  DocumentReference? _orgId;
  DocumentReference? get orgId => _orgId;
  bool hasOrgId() => _orgId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _projectType = snapshotData['project_type'] as String?;
    _leaderId = getDataList(snapshotData['leader_id']);
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _orgId = snapshotData['org_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? name,
  String? description,
  String? projectType,
  DocumentReference? churchId,
  DocumentReference? orgId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'project_type': projectType,
      'church_id': churchId,
      'org_id': orgId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.projectType == e2?.projectType &&
        listEquality.equals(e1?.leaderId, e2?.leaderId) &&
        e1?.churchId == e2?.churchId &&
        e1?.orgId == e2?.orgId;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.projectType,
        e?.leaderId,
        e?.churchId,
        e?.orgId
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
