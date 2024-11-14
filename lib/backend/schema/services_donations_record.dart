import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesDonationsRecord extends FirestoreRecord {
  ServicesDonationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "service_type" field.
  ServiceType? _serviceType;
  ServiceType? get serviceType => _serviceType;
  bool hasServiceType() => _serviceType != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "hours_donated" field.
  double? _hoursDonated;
  double get hoursDonated => _hoursDonated ?? 0.0;
  bool hasHoursDonated() => _hoursDonated != null;

  // "date_provided" field.
  DateTime? _dateProvided;
  DateTime? get dateProvided => _dateProvided;
  bool hasDateProvided() => _dateProvided != null;

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
    _serviceType = deserializeEnum<ServiceType>(snapshotData['service_type']);
    _description = snapshotData['description'] as String?;
    _hoursDonated = castToType<double>(snapshotData['hours_donated']);
    _dateProvided = snapshotData['date_provided'] as DateTime?;
    _status = deserializeEnum<ContributionStatus>(snapshotData['status']);
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('services_donations')
          : FirebaseFirestore.instance.collectionGroup('services_donations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('services_donations').doc(id);

  static Stream<ServicesDonationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesDonationsRecord.fromSnapshot(s));

  static Future<ServicesDonationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServicesDonationsRecord.fromSnapshot(s));

  static ServicesDonationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesDonationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesDonationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesDonationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesDonationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesDonationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesDonationsRecordData({
  ServiceType? serviceType,
  String? description,
  double? hoursDonated,
  DateTime? dateProvided,
  ContributionStatus? status,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'service_type': serviceType,
      'description': description,
      'hours_donated': hoursDonated,
      'date_provided': dateProvided,
      'status': status,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesDonationsRecordDocumentEquality
    implements Equality<ServicesDonationsRecord> {
  const ServicesDonationsRecordDocumentEquality();

  @override
  bool equals(ServicesDonationsRecord? e1, ServicesDonationsRecord? e2) {
    return e1?.serviceType == e2?.serviceType &&
        e1?.description == e2?.description &&
        e1?.hoursDonated == e2?.hoursDonated &&
        e1?.dateProvided == e2?.dateProvided &&
        e1?.status == e2?.status &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(ServicesDonationsRecord? e) => const ListEquality().hash([
        e?.serviceType,
        e?.description,
        e?.hoursDonated,
        e?.dateProvided,
        e?.status,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesDonationsRecord;
}
