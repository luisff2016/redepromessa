import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurchesRecord extends FirestoreRecord {
  ChurchesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "leader_id" field.
  DocumentReference? _leaderId;
  DocumentReference? get leaderId => _leaderId;
  bool hasLeaderId() => _leaderId != null;

  // "regional_org_id" field.
  DocumentReference? _regionalOrgId;
  DocumentReference? get regionalOrgId => _regionalOrgId;
  bool hasRegionalOrgId() => _regionalOrgId != null;

  // "founded_at" field.
  DateTime? _foundedAt;
  DateTime? get foundedAt => _foundedAt;
  bool hasFoundedAt() => _foundedAt != null;

  // "features" field.
  List<String>? _features;
  List<String> get features => _features ?? const [];
  bool hasFeatures() => _features != null;

  // "church_address" field.
  AddressStruct? _churchAddress;
  AddressStruct get churchAddress => _churchAddress ?? AddressStruct();
  bool hasChurchAddress() => _churchAddress != null;

  // "property" field.
  Headquarters? _property;
  Headquarters? get property => _property;
  bool hasProperty() => _property != null;

  // "historical_text" field.
  String? _historicalText;
  String get historicalText => _historicalText ?? '';
  bool hasHistoricalText() => _historicalText != null;

  // "historical_video" field.
  String? _historicalVideo;
  String get historicalVideo => _historicalVideo ?? '';
  bool hasHistoricalVideo() => _historicalVideo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
    _leaderId = snapshotData['leader_id'] as DocumentReference?;
    _regionalOrgId = snapshotData['regional_org_id'] as DocumentReference?;
    _foundedAt = snapshotData['founded_at'] as DateTime?;
    _features = getDataList(snapshotData['features']);
    _churchAddress = AddressStruct.maybeFromMap(snapshotData['church_address']);
    _property = deserializeEnum<Headquarters>(snapshotData['property']);
    _historicalText = snapshotData['historical_text'] as String?;
    _historicalVideo = snapshotData['historical_video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('churches');

  static Stream<ChurchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChurchesRecord.fromSnapshot(s));

  static Future<ChurchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChurchesRecord.fromSnapshot(s));

  static ChurchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChurchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChurchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChurchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChurchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChurchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChurchesRecordData({
  String? name,
  bool? status,
  DocumentReference? leaderId,
  DocumentReference? regionalOrgId,
  DateTime? foundedAt,
  AddressStruct? churchAddress,
  Headquarters? property,
  String? historicalText,
  String? historicalVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'leader_id': leaderId,
      'regional_org_id': regionalOrgId,
      'founded_at': foundedAt,
      'church_address': AddressStruct().toMap(),
      'property': property,
      'historical_text': historicalText,
      'historical_video': historicalVideo,
    }.withoutNulls,
  );

  // Handle nested data for "church_address" field.
  addAddressStructData(firestoreData, churchAddress, 'church_address');

  return firestoreData;
}

class ChurchesRecordDocumentEquality implements Equality<ChurchesRecord> {
  const ChurchesRecordDocumentEquality();

  @override
  bool equals(ChurchesRecord? e1, ChurchesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.leaderId == e2?.leaderId &&
        e1?.regionalOrgId == e2?.regionalOrgId &&
        e1?.foundedAt == e2?.foundedAt &&
        listEquality.equals(e1?.features, e2?.features) &&
        e1?.churchAddress == e2?.churchAddress &&
        e1?.property == e2?.property &&
        e1?.historicalText == e2?.historicalText &&
        e1?.historicalVideo == e2?.historicalVideo;
  }

  @override
  int hash(ChurchesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.status,
        e?.leaderId,
        e?.regionalOrgId,
        e?.foundedAt,
        e?.features,
        e?.churchAddress,
        e?.property,
        e?.historicalText,
        e?.historicalVideo
      ]);

  @override
  bool isValidKey(Object? o) => o is ChurchesRecord;
}
