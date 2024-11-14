import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
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

  // "related_projects" field.
  List<DocumentReference>? _relatedProjects;
  List<DocumentReference> get relatedProjects => _relatedProjects ?? const [];
  bool hasRelatedProjects() => _relatedProjects != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "list_lessons" field.
  List<DocumentReference>? _listLessons;
  List<DocumentReference> get listLessons => _listLessons ?? const [];
  bool hasListLessons() => _listLessons != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _relatedProjects = getDataList(snapshotData['related_projects']);
    _status = snapshotData['status'] as bool?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _listLessons = getDataList(snapshotData['list_lessons']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? name,
  String? description,
  bool? status,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'status': status,
      'start_date': startDate,
      'end_date': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.relatedProjects, e2?.relatedProjects) &&
        e1?.status == e2?.status &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        listEquality.equals(e1?.listLessons, e2?.listLessons);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.relatedProjects,
        e?.status,
        e?.startDate,
        e?.endDate,
        e?.listLessons
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
