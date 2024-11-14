import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialDonationsRecord extends FirestoreRecord {
  FinancialDonationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "payment_method" field.
  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _paymentMethod;
  bool hasPaymentMethod() => _paymentMethod != null;

  // "transaction_id" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "status" field.
  ContributionStatus? _status;
  ContributionStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _amount = castToType<double>(snapshotData['amount']);
    _paymentMethod =
        deserializeEnum<PaymentMethod>(snapshotData['payment_method']);
    _transactionId = snapshotData['transaction_id'] as String?;
    _status = deserializeEnum<ContributionStatus>(snapshotData['status']);
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financial_donations')
          : FirebaseFirestore.instance.collectionGroup('financial_donations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financial_donations').doc(id);

  static Stream<FinancialDonationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialDonationsRecord.fromSnapshot(s));

  static Future<FinancialDonationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialDonationsRecord.fromSnapshot(s));

  static FinancialDonationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialDonationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialDonationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialDonationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialDonationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialDonationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialDonationsRecordData({
  DateTime? paymentDate,
  double? amount,
  PaymentMethod? paymentMethod,
  String? transactionId,
  ContributionStatus? status,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payment_date': paymentDate,
      'amount': amount,
      'payment_method': paymentMethod,
      'transaction_id': transactionId,
      'status': status,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialDonationsRecordDocumentEquality
    implements Equality<FinancialDonationsRecord> {
  const FinancialDonationsRecordDocumentEquality();

  @override
  bool equals(FinancialDonationsRecord? e1, FinancialDonationsRecord? e2) {
    return e1?.paymentDate == e2?.paymentDate &&
        e1?.amount == e2?.amount &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.transactionId == e2?.transactionId &&
        e1?.status == e2?.status &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(FinancialDonationsRecord? e) => const ListEquality().hash([
        e?.paymentDate,
        e?.amount,
        e?.paymentMethod,
        e?.transactionId,
        e?.status,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialDonationsRecord;
}
