import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoodsDonationsRecord extends FirestoreRecord {
  GoodsDonationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "item_type" field.
  DonationType? _itemType;
  DonationType? get itemType => _itemType;
  bool hasItemType() => _itemType != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "unit" field.
  DonationUnit? _unit;
  DonationUnit? get unit => _unit;
  bool hasUnit() => _unit != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "condition" field.
  DonationCondition? _condition;
  DonationCondition? get condition => _condition;
  bool hasCondition() => _condition != null;

  // "received_date" field.
  DateTime? _receivedDate;
  DateTime? get receivedDate => _receivedDate;
  bool hasReceivedDate() => _receivedDate != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemType = deserializeEnum<DonationType>(snapshotData['item_type']);
    _quantity = castToType<double>(snapshotData['quantity']);
    _unit = deserializeEnum<DonationUnit>(snapshotData['unit']);
    _description = snapshotData['description'] as String?;
    _condition = deserializeEnum<DonationCondition>(snapshotData['condition']);
    _receivedDate = snapshotData['received_date'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goods_donations')
          : FirebaseFirestore.instance.collectionGroup('goods_donations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('goods_donations').doc(id);

  static Stream<GoodsDonationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoodsDonationsRecord.fromSnapshot(s));

  static Future<GoodsDonationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoodsDonationsRecord.fromSnapshot(s));

  static GoodsDonationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoodsDonationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoodsDonationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoodsDonationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoodsDonationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoodsDonationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoodsDonationsRecordData({
  DonationType? itemType,
  double? quantity,
  DonationUnit? unit,
  String? description,
  DonationCondition? condition,
  DateTime? receivedDate,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item_type': itemType,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'condition': condition,
      'received_date': receivedDate,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoodsDonationsRecordDocumentEquality
    implements Equality<GoodsDonationsRecord> {
  const GoodsDonationsRecordDocumentEquality();

  @override
  bool equals(GoodsDonationsRecord? e1, GoodsDonationsRecord? e2) {
    return e1?.itemType == e2?.itemType &&
        e1?.quantity == e2?.quantity &&
        e1?.unit == e2?.unit &&
        e1?.description == e2?.description &&
        e1?.condition == e2?.condition &&
        e1?.receivedDate == e2?.receivedDate &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(GoodsDonationsRecord? e) => const ListEquality().hash([
        e?.itemType,
        e?.quantity,
        e?.unit,
        e?.description,
        e?.condition,
        e?.receivedDate,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is GoodsDonationsRecord;
}
