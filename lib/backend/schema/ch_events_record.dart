import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChEventsRecord extends FirestoreRecord {
  ChEventsRecord._(
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

  // "ch_expenses" field.
  double? _chExpenses;
  double get chExpenses => _chExpenses ?? 0.0;
  bool hasChExpenses() => _chExpenses != null;

  // "ch_revenues" field.
  double? _chRevenues;
  double get chRevenues => _chRevenues ?? 0.0;
  bool hasChRevenues() => _chRevenues != null;

  // "ch_organizers" field.
  DocumentReference? _chOrganizers;
  DocumentReference? get chOrganizers => _chOrganizers;
  bool hasChOrganizers() => _chOrganizers != null;

  // "ch_participants" field.
  DocumentReference? _chParticipants;
  DocumentReference? get chParticipants => _chParticipants;
  bool hasChParticipants() => _chParticipants != null;

  // "event_type" field.
  EventsType? _eventType;
  EventsType? get eventType => _eventType;
  bool hasEventType() => _eventType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _chExpenses = castToType<double>(snapshotData['ch_expenses']);
    _chRevenues = castToType<double>(snapshotData['ch_revenues']);
    _chOrganizers = snapshotData['ch_organizers'] as DocumentReference?;
    _chParticipants = snapshotData['ch_participants'] as DocumentReference?;
    _eventType = deserializeEnum<EventsType>(snapshotData['event_type']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ch_events')
          : FirebaseFirestore.instance.collectionGroup('ch_events');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ch_events').doc(id);

  static Stream<ChEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChEventsRecord.fromSnapshot(s));

  static Future<ChEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChEventsRecord.fromSnapshot(s));

  static ChEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChEventsRecordData({
  String? name,
  DateTime? date,
  String? location,
  double? chExpenses,
  double? chRevenues,
  DocumentReference? chOrganizers,
  DocumentReference? chParticipants,
  EventsType? eventType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'location': location,
      'ch_expenses': chExpenses,
      'ch_revenues': chRevenues,
      'ch_organizers': chOrganizers,
      'ch_participants': chParticipants,
      'event_type': eventType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChEventsRecordDocumentEquality implements Equality<ChEventsRecord> {
  const ChEventsRecordDocumentEquality();

  @override
  bool equals(ChEventsRecord? e1, ChEventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.chExpenses == e2?.chExpenses &&
        e1?.chRevenues == e2?.chRevenues &&
        e1?.chOrganizers == e2?.chOrganizers &&
        e1?.chParticipants == e2?.chParticipants &&
        e1?.eventType == e2?.eventType;
  }

  @override
  int hash(ChEventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.date,
        e?.location,
        e?.chExpenses,
        e?.chRevenues,
        e?.chOrganizers,
        e?.chParticipants,
        e?.eventType
      ]);

  @override
  bool isValidKey(Object? o) => o is ChEventsRecord;
}
