import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PoliciesRecord extends FirestoreRecord {
  PoliciesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "administration" field.
  List<String>? _administration;
  List<String> get administration => _administration ?? const [];
  bool hasAdministration() => _administration != null;

  // "doctrine" field.
  List<String>? _doctrine;
  List<String> get doctrine => _doctrine ?? const [];
  bool hasDoctrine() => _doctrine != null;

  // "legal" field.
  List<String>? _legal;
  List<String> get legal => _legal ?? const [];
  bool hasLegal() => _legal != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _administration = getDataList(snapshotData['administration']);
    _doctrine = getDataList(snapshotData['doctrine']);
    _legal = getDataList(snapshotData['legal']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('policies')
          : FirebaseFirestore.instance.collectionGroup('policies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('policies').doc(id);

  static Stream<PoliciesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PoliciesRecord.fromSnapshot(s));

  static Future<PoliciesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PoliciesRecord.fromSnapshot(s));

  static PoliciesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PoliciesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PoliciesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PoliciesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PoliciesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PoliciesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPoliciesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PoliciesRecordDocumentEquality implements Equality<PoliciesRecord> {
  const PoliciesRecordDocumentEquality();

  @override
  bool equals(PoliciesRecord? e1, PoliciesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.administration, e2?.administration) &&
        listEquality.equals(e1?.doctrine, e2?.doctrine) &&
        listEquality.equals(e1?.legal, e2?.legal);
  }

  @override
  int hash(PoliciesRecord? e) =>
      const ListEquality().hash([e?.administration, e?.doctrine, e?.legal]);

  @override
  bool isValidKey(Object? o) => o is PoliciesRecord;
}
