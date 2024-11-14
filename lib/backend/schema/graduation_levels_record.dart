import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraduationLevelsRecord extends FirestoreRecord {
  GraduationLevelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "points_required" field.
  int? _pointsRequired;
  int get pointsRequired => _pointsRequired ?? 0;
  bool hasPointsRequired() => _pointsRequired != null;

  // "courses_required" field.
  List<DocumentReference>? _coursesRequired;
  List<DocumentReference> get coursesRequired => _coursesRequired ?? const [];
  bool hasCoursesRequired() => _coursesRequired != null;

  // "activities_required" field.
  List<DocumentReference>? _activitiesRequired;
  List<DocumentReference> get activitiesRequired =>
      _activitiesRequired ?? const [];
  bool hasActivitiesRequired() => _activitiesRequired != null;

  // "tasks_required" field.
  List<DocumentReference>? _tasksRequired;
  List<DocumentReference> get tasksRequired => _tasksRequired ?? const [];
  bool hasTasksRequired() => _tasksRequired != null;

  void _initializeFields() {
    _level = castToType<int>(snapshotData['level']);
    _pointsRequired = castToType<int>(snapshotData['points_required']);
    _coursesRequired = getDataList(snapshotData['courses_required']);
    _activitiesRequired = getDataList(snapshotData['activities_required']);
    _tasksRequired = getDataList(snapshotData['tasks_required']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('graduation_levels');

  static Stream<GraduationLevelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GraduationLevelsRecord.fromSnapshot(s));

  static Future<GraduationLevelsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GraduationLevelsRecord.fromSnapshot(s));

  static GraduationLevelsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GraduationLevelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GraduationLevelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GraduationLevelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GraduationLevelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GraduationLevelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGraduationLevelsRecordData({
  int? level,
  int? pointsRequired,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'level': level,
      'points_required': pointsRequired,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraduationLevelsRecordDocumentEquality
    implements Equality<GraduationLevelsRecord> {
  const GraduationLevelsRecordDocumentEquality();

  @override
  bool equals(GraduationLevelsRecord? e1, GraduationLevelsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.level == e2?.level &&
        e1?.pointsRequired == e2?.pointsRequired &&
        listEquality.equals(e1?.coursesRequired, e2?.coursesRequired) &&
        listEquality.equals(e1?.activitiesRequired, e2?.activitiesRequired) &&
        listEquality.equals(e1?.tasksRequired, e2?.tasksRequired);
  }

  @override
  int hash(GraduationLevelsRecord? e) => const ListEquality().hash([
        e?.level,
        e?.pointsRequired,
        e?.coursesRequired,
        e?.activitiesRequired,
        e?.tasksRequired
      ]);

  @override
  bool isValidKey(Object? o) => o is GraduationLevelsRecord;
}
