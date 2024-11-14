import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssetsRecord extends FirestoreRecord {
  AssetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "church_id" field.
  DocumentReference? _churchId;
  DocumentReference? get churchId => _churchId;
  bool hasChurchId() => _churchId != null;

  // "org_id" field.
  DocumentReference? _orgId;
  DocumentReference? get orgId => _orgId;
  bool hasOrgId() => _orgId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "purchase_date" field.
  DateTime? _purchaseDate;
  DateTime? get purchaseDate => _purchaseDate;
  bool hasPurchaseDate() => _purchaseDate != null;

  // "purchase_value" field.
  double? _purchaseValue;
  double get purchaseValue => _purchaseValue ?? 0.0;
  bool hasPurchaseValue() => _purchaseValue != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "acquisition_method" field.
  String? _acquisitionMethod;
  String get acquisitionMethod => _acquisitionMethod ?? '';
  bool hasAcquisitionMethod() => _acquisitionMethod != null;

  // "restrictions" field.
  String? _restrictions;
  String get restrictions => _restrictions ?? '';
  bool hasRestrictions() => _restrictions != null;

  // "last_evaluation" field.
  DateTime? _lastEvaluation;
  DateTime? get lastEvaluation => _lastEvaluation;
  bool hasLastEvaluation() => _lastEvaluation != null;

  // "documentation" field.
  List<String>? _documentation;
  List<String> get documentation => _documentation ?? const [];
  bool hasDocumentation() => _documentation != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  void _initializeFields() {
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _orgId = snapshotData['org_id'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _purchaseDate = snapshotData['purchase_date'] as DateTime?;
    _purchaseValue = castToType<double>(snapshotData['purchase_value']);
    _condition = snapshotData['condition'] as String?;
    _status = snapshotData['status'] as bool?;
    _acquisitionMethod = snapshotData['acquisition_method'] as String?;
    _restrictions = snapshotData['restrictions'] as String?;
    _lastEvaluation = snapshotData['last_evaluation'] as DateTime?;
    _documentation = getDataList(snapshotData['documentation']);
    _notes = snapshotData['notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('assets');

  static Stream<AssetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssetsRecord.fromSnapshot(s));

  static Future<AssetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssetsRecord.fromSnapshot(s));

  static AssetsRecord fromSnapshot(DocumentSnapshot snapshot) => AssetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssetsRecordData({
  DocumentReference? churchId,
  DocumentReference? orgId,
  String? type,
  String? description,
  DateTime? purchaseDate,
  double? purchaseValue,
  String? condition,
  bool? status,
  String? acquisitionMethod,
  String? restrictions,
  DateTime? lastEvaluation,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'church_id': churchId,
      'org_id': orgId,
      'type': type,
      'description': description,
      'purchase_date': purchaseDate,
      'purchase_value': purchaseValue,
      'condition': condition,
      'status': status,
      'acquisition_method': acquisitionMethod,
      'restrictions': restrictions,
      'last_evaluation': lastEvaluation,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssetsRecordDocumentEquality implements Equality<AssetsRecord> {
  const AssetsRecordDocumentEquality();

  @override
  bool equals(AssetsRecord? e1, AssetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.churchId == e2?.churchId &&
        e1?.orgId == e2?.orgId &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.purchaseDate == e2?.purchaseDate &&
        e1?.purchaseValue == e2?.purchaseValue &&
        e1?.condition == e2?.condition &&
        e1?.status == e2?.status &&
        e1?.acquisitionMethod == e2?.acquisitionMethod &&
        e1?.restrictions == e2?.restrictions &&
        e1?.lastEvaluation == e2?.lastEvaluation &&
        listEquality.equals(e1?.documentation, e2?.documentation) &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(AssetsRecord? e) => const ListEquality().hash([
        e?.churchId,
        e?.orgId,
        e?.type,
        e?.description,
        e?.purchaseDate,
        e?.purchaseValue,
        e?.condition,
        e?.status,
        e?.acquisitionMethod,
        e?.restrictions,
        e?.lastEvaluation,
        e?.documentation,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is AssetsRecord;
}
