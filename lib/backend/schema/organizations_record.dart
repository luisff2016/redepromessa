import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationsRecord extends FirestoreRecord {
  OrganizationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cnpj" field.
  int? _cnpj;
  int get cnpj => _cnpj ?? 0;
  bool hasCnpj() => _cnpj != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "org_address" field.
  AddressStruct? _orgAddress;
  AddressStruct get orgAddress => _orgAddress ?? AddressStruct();
  bool hasOrgAddress() => _orgAddress != null;

  // "org_type" field.
  OrganizationType? _orgType;
  OrganizationType? get orgType => _orgType;
  bool hasOrgType() => _orgType != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cnpj = castToType<int>(snapshotData['cnpj']);
    _phone = snapshotData['phone'] as String?;
    _status = snapshotData['status'] as bool?;
    _orgAddress = AddressStruct.maybeFromMap(snapshotData['org_address']);
    _orgType = deserializeEnum<OrganizationType>(snapshotData['org_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizations');

  static Stream<OrganizationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizationsRecord.fromSnapshot(s));

  static Future<OrganizationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizationsRecord.fromSnapshot(s));

  static OrganizationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizationsRecordData({
  String? name,
  int? cnpj,
  String? phone,
  bool? status,
  AddressStruct? orgAddress,
  OrganizationType? orgType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'cnpj': cnpj,
      'phone': phone,
      'status': status,
      'org_address': AddressStruct().toMap(),
      'org_type': orgType,
    }.withoutNulls,
  );

  // Handle nested data for "org_address" field.
  addAddressStructData(firestoreData, orgAddress, 'org_address');

  return firestoreData;
}

class OrganizationsRecordDocumentEquality
    implements Equality<OrganizationsRecord> {
  const OrganizationsRecordDocumentEquality();

  @override
  bool equals(OrganizationsRecord? e1, OrganizationsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.cnpj == e2?.cnpj &&
        e1?.phone == e2?.phone &&
        e1?.status == e2?.status &&
        e1?.orgAddress == e2?.orgAddress &&
        e1?.orgType == e2?.orgType;
  }

  @override
  int hash(OrganizationsRecord? e) => const ListEquality()
      .hash([e?.name, e?.cnpj, e?.phone, e?.status, e?.orgAddress, e?.orgType]);

  @override
  bool isValidKey(Object? o) => o is OrganizationsRecord;
}
