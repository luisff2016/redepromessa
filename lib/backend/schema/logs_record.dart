import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "log_date" field.
  DateTime? _logDate;
  DateTime? get logDate => _logDate;
  bool hasLogDate() => _logDate != null;

  // "log_action" field.
  String? _logAction;
  String get logAction => _logAction ?? '';
  bool hasLogAction() => _logAction != null;

  // "log_details" field.
  String? _logDetails;
  String get logDetails => _logDetails ?? '';
  bool hasLogDetails() => _logDetails != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _logDate = snapshotData['log_date'] as DateTime?;
    _logAction = snapshotData['log_action'] as String?;
    _logDetails = snapshotData['log_details'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logs');

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogsRecordData({
  DateTime? logDate,
  String? logAction,
  String? logDetails,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'log_date': logDate,
      'log_action': logAction,
      'log_details': logDetails,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogsRecordDocumentEquality implements Equality<LogsRecord> {
  const LogsRecordDocumentEquality();

  @override
  bool equals(LogsRecord? e1, LogsRecord? e2) {
    return e1?.logDate == e2?.logDate &&
        e1?.logAction == e2?.logAction &&
        e1?.logDetails == e2?.logDetails &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(LogsRecord? e) => const ListEquality()
      .hash([e?.logDate, e?.logAction, e?.logDetails, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is LogsRecord;
}
