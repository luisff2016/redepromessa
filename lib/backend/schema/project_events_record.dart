import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectEventsRecord extends FirestoreRecord {
  ProjectEventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "revenue" field.
  double? _revenue;
  double get revenue => _revenue ?? 0.0;
  bool hasRevenue() => _revenue != null;

  // "expenses" field.
  double? _expenses;
  double get expenses => _expenses ?? 0.0;
  bool hasExpenses() => _expenses != null;

  // "organizers" field.
  List<DocumentReference>? _organizers;
  List<DocumentReference> get organizers => _organizers ?? const [];
  bool hasOrganizers() => _organizers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _type = snapshotData['type'] as String?;
    _revenue = castToType<double>(snapshotData['revenue']);
    _expenses = castToType<double>(snapshotData['expenses']);
    _organizers = getDataList(snapshotData['organizers']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('project_events')
          : FirebaseFirestore.instance.collectionGroup('project_events');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('project_events').doc(id);

  static Stream<ProjectEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectEventsRecord.fromSnapshot(s));

  static Future<ProjectEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectEventsRecord.fromSnapshot(s));

  static ProjectEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectEventsRecordData({
  String? name,
  DateTime? date,
  String? location,
  String? type,
  double? revenue,
  double? expenses,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'location': location,
      'type': type,
      'revenue': revenue,
      'expenses': expenses,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectEventsRecordDocumentEquality
    implements Equality<ProjectEventsRecord> {
  const ProjectEventsRecordDocumentEquality();

  @override
  bool equals(ProjectEventsRecord? e1, ProjectEventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.type == e2?.type &&
        e1?.revenue == e2?.revenue &&
        e1?.expenses == e2?.expenses &&
        listEquality.equals(e1?.organizers, e2?.organizers);
  }

  @override
  int hash(ProjectEventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.date,
        e?.location,
        e?.type,
        e?.revenue,
        e?.expenses,
        e?.organizers
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectEventsRecord;
}
