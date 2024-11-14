import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesStudentsRecord extends FirestoreRecord {
  CoursesStudentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "course_id" field.
  DocumentReference? _courseId;
  DocumentReference? get courseId => _courseId;
  bool hasCourseId() => _courseId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "status" field.
  ActivityStatus? _status;
  ActivityStatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _courseId = snapshotData['course_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _status = deserializeEnum<ActivityStatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses_students');

  static Stream<CoursesStudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesStudentsRecord.fromSnapshot(s));

  static Future<CoursesStudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesStudentsRecord.fromSnapshot(s));

  static CoursesStudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesStudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesStudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesStudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesStudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesStudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesStudentsRecordData({
  DocumentReference? courseId,
  DocumentReference? userId,
  ActivityStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_id': courseId,
      'user_id': userId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesStudentsRecordDocumentEquality
    implements Equality<CoursesStudentsRecord> {
  const CoursesStudentsRecordDocumentEquality();

  @override
  bool equals(CoursesStudentsRecord? e1, CoursesStudentsRecord? e2) {
    return e1?.courseId == e2?.courseId &&
        e1?.userId == e2?.userId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(CoursesStudentsRecord? e) =>
      const ListEquality().hash([e?.courseId, e?.userId, e?.status]);

  @override
  bool isValidKey(Object? o) => o is CoursesStudentsRecord;
}
