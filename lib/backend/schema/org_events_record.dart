import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrgEventsRecord extends FirestoreRecord {
  OrgEventsRecord._(
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

  // "expenses" field.
  double? _expenses;
  double get expenses => _expenses ?? 0.0;
  bool hasExpenses() => _expenses != null;

  // "revenue" field.
  double? _revenue;
  double get revenue => _revenue ?? 0.0;
  bool hasRevenue() => _revenue != null;

  // "organizers" field.
  List<DocumentReference>? _organizers;
  List<DocumentReference> get organizers => _organizers ?? const [];
  bool hasOrganizers() => _organizers != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "org_events_type" field.
  EventsType? _orgEventsType;
  EventsType? get orgEventsType => _orgEventsType;
  bool hasOrgEventsType() => _orgEventsType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _expenses = castToType<double>(snapshotData['expenses']);
    _revenue = castToType<double>(snapshotData['revenue']);
    _organizers = getDataList(snapshotData['organizers']);
    _participants = getDataList(snapshotData['participants']);
    _orgEventsType =
        deserializeEnum<EventsType>(snapshotData['org_events_type']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('org_events')
          : FirebaseFirestore.instance.collectionGroup('org_events');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('org_events').doc(id);

  static Stream<OrgEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrgEventsRecord.fromSnapshot(s));

  static Future<OrgEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrgEventsRecord.fromSnapshot(s));

  static OrgEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrgEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrgEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrgEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrgEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrgEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrgEventsRecordData({
  String? name,
  DateTime? date,
  String? location,
  double? expenses,
  double? revenue,
  EventsType? orgEventsType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'location': location,
      'expenses': expenses,
      'revenue': revenue,
      'org_events_type': orgEventsType,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrgEventsRecordDocumentEquality implements Equality<OrgEventsRecord> {
  const OrgEventsRecordDocumentEquality();

  @override
  bool equals(OrgEventsRecord? e1, OrgEventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.expenses == e2?.expenses &&
        e1?.revenue == e2?.revenue &&
        listEquality.equals(e1?.organizers, e2?.organizers) &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.orgEventsType == e2?.orgEventsType;
  }

  @override
  int hash(OrgEventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.date,
        e?.location,
        e?.expenses,
        e?.revenue,
        e?.organizers,
        e?.participants,
        e?.orgEventsType
      ]);

  @override
  bool isValidKey(Object? o) => o is OrgEventsRecord;
}
