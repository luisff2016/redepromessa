import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DirectorsRecord extends FirestoreRecord {
  DirectorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "president" field.
  DocumentReference? _president;
  DocumentReference? get president => _president;
  bool hasPresident() => _president != null;

  // "vice_president" field.
  DocumentReference? _vicePresident;
  DocumentReference? get vicePresident => _vicePresident;
  bool hasVicePresident() => _vicePresident != null;

  // "secretary" field.
  DocumentReference? _secretary;
  DocumentReference? get secretary => _secretary;
  bool hasSecretary() => _secretary != null;

  // "treasurer" field.
  DocumentReference? _treasurer;
  DocumentReference? get treasurer => _treasurer;
  bool hasTreasurer() => _treasurer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _president = snapshotData['president'] as DocumentReference?;
    _vicePresident = snapshotData['vice_president'] as DocumentReference?;
    _secretary = snapshotData['secretary'] as DocumentReference?;
    _treasurer = snapshotData['treasurer'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('directors')
          : FirebaseFirestore.instance.collectionGroup('directors');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('directors').doc(id);

  static Stream<DirectorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DirectorsRecord.fromSnapshot(s));

  static Future<DirectorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DirectorsRecord.fromSnapshot(s));

  static DirectorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DirectorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DirectorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DirectorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DirectorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DirectorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDirectorsRecordData({
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? president,
  DocumentReference? vicePresident,
  DocumentReference? secretary,
  DocumentReference? treasurer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'president': president,
      'vice_president': vicePresident,
      'secretary': secretary,
      'treasurer': treasurer,
    }.withoutNulls,
  );

  return firestoreData;
}

class DirectorsRecordDocumentEquality implements Equality<DirectorsRecord> {
  const DirectorsRecordDocumentEquality();

  @override
  bool equals(DirectorsRecord? e1, DirectorsRecord? e2) {
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.president == e2?.president &&
        e1?.vicePresident == e2?.vicePresident &&
        e1?.secretary == e2?.secretary &&
        e1?.treasurer == e2?.treasurer;
  }

  @override
  int hash(DirectorsRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.president,
        e?.vicePresident,
        e?.secretary,
        e?.treasurer
      ]);

  @override
  bool isValidKey(Object? o) => o is DirectorsRecord;
}
