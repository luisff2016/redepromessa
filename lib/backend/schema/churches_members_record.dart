import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurchesMembersRecord extends FirestoreRecord {
  ChurchesMembersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "church_id" field.
  DocumentReference? _churchId;
  DocumentReference? get churchId => _churchId;
  bool hasChurchId() => _churchId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

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

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "role" field.
  MemberRole? _role;
  MemberRole? get role => _role;
  bool hasRole() => _role != null;

  void _initializeFields() {
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _role = deserializeEnum<MemberRole>(snapshotData['role']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('churches_members');

  static Stream<ChurchesMembersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChurchesMembersRecord.fromSnapshot(s));

  static Future<ChurchesMembersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChurchesMembersRecord.fromSnapshot(s));

  static ChurchesMembersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChurchesMembersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChurchesMembersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChurchesMembersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChurchesMembersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChurchesMembersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChurchesMembersRecordData({
  DocumentReference? churchId,
  DocumentReference? userId,
  bool? status,
  DateTime? startDate,
  DateTime? endDate,
  String? notes,
  MemberRole? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'church_id': churchId,
      'user_id': userId,
      'status': status,
      'start_date': startDate,
      'end_date': endDate,
      'notes': notes,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChurchesMembersRecordDocumentEquality
    implements Equality<ChurchesMembersRecord> {
  const ChurchesMembersRecordDocumentEquality();

  @override
  bool equals(ChurchesMembersRecord? e1, ChurchesMembersRecord? e2) {
    return e1?.churchId == e2?.churchId &&
        e1?.userId == e2?.userId &&
        e1?.status == e2?.status &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.notes == e2?.notes &&
        e1?.role == e2?.role;
  }

  @override
  int hash(ChurchesMembersRecord? e) => const ListEquality().hash([
        e?.churchId,
        e?.userId,
        e?.status,
        e?.startDate,
        e?.endDate,
        e?.notes,
        e?.role
      ]);

  @override
  bool isValidKey(Object? o) => o is ChurchesMembersRecord;
}
