import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPointsRecord extends FirestoreRecord {
  UserPointsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "source_type" field.
  SourceType? _sourceType;
  SourceType? get sourceType => _sourceType;
  bool hasSourceType() => _sourceType != null;

  // "source_id" field.
  String? _sourceId;
  String get sourceId => _sourceId ?? '';
  bool hasSourceId() => _sourceId != null;

  // "points_awarded" field.
  int? _pointsAwarded;
  int get pointsAwarded => _pointsAwarded ?? 0;
  bool hasPointsAwarded() => _pointsAwarded != null;

  // "date_awarded" field.
  DateTime? _dateAwarded;
  DateTime? get dateAwarded => _dateAwarded;
  bool hasDateAwarded() => _dateAwarded != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "status" field.
  PointStatus? _status;
  PointStatus? get status => _status;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _sourceType = deserializeEnum<SourceType>(snapshotData['source_type']);
    _sourceId = snapshotData['source_id'] as String?;
    _pointsAwarded = castToType<int>(snapshotData['points_awarded']);
    _dateAwarded = snapshotData['date_awarded'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _status = deserializeEnum<PointStatus>(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_points')
          : FirebaseFirestore.instance.collectionGroup('user_points');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_points').doc(id);

  static Stream<UserPointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPointsRecord.fromSnapshot(s));

  static Future<UserPointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPointsRecord.fromSnapshot(s));

  static UserPointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPointsRecordData({
  DocumentReference? userId,
  SourceType? sourceType,
  String? sourceId,
  int? pointsAwarded,
  DateTime? dateAwarded,
  String? description,
  PointStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'source_type': sourceType,
      'source_id': sourceId,
      'points_awarded': pointsAwarded,
      'date_awarded': dateAwarded,
      'description': description,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPointsRecordDocumentEquality implements Equality<UserPointsRecord> {
  const UserPointsRecordDocumentEquality();

  @override
  bool equals(UserPointsRecord? e1, UserPointsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sourceType == e2?.sourceType &&
        e1?.sourceId == e2?.sourceId &&
        e1?.pointsAwarded == e2?.pointsAwarded &&
        e1?.dateAwarded == e2?.dateAwarded &&
        e1?.description == e2?.description &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserPointsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.sourceType,
        e?.sourceId,
        e?.pointsAwarded,
        e?.dateAwarded,
        e?.description,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPointsRecord;
}
