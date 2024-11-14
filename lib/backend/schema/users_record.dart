import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "user_address" field.
  AddressStruct? _userAddress;
  AddressStruct get userAddress => _userAddress ?? AddressStruct();
  bool hasUserAddress() => _userAddress != null;

  // "current_points" field.
  int? _currentPoints;
  int get currentPoints => _currentPoints ?? 0;
  bool hasCurrentPoints() => _currentPoints != null;

  // "current_level" field.
  int? _currentLevel;
  int get currentLevel => _currentLevel ?? 0;
  bool hasCurrentLevel() => _currentLevel != null;

  // "completed_corses" field.
  List<DocumentReference>? _completedCorses;
  List<DocumentReference> get completedCorses => _completedCorses ?? const [];
  bool hasCompletedCorses() => _completedCorses != null;

  // "completed_activities" field.
  List<DocumentReference>? _completedActivities;
  List<DocumentReference> get completedActivities =>
      _completedActivities ?? const [];
  bool hasCompletedActivities() => _completedActivities != null;

  // "completed_tasks" field.
  List<DocumentReference>? _completedTasks;
  List<DocumentReference> get completedTasks => _completedTasks ?? const [];
  bool hasCompletedTasks() => _completedTasks != null;

  // "graduation_history" field.
  List<GraduationHistoryStruct>? _graduationHistory;
  List<GraduationHistoryStruct> get graduationHistory =>
      _graduationHistory ?? const [];
  bool hasGraduationHistory() => _graduationHistory != null;

  // "user_role" field.
  RoleSystem? _userRole;
  RoleSystem? get userRole => _userRole;
  bool hasUserRole() => _userRole != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _userAddress = AddressStruct.maybeFromMap(snapshotData['user_address']);
    _currentPoints = castToType<int>(snapshotData['current_points']);
    _currentLevel = castToType<int>(snapshotData['current_level']);
    _completedCorses = getDataList(snapshotData['completed_corses']);
    _completedActivities = getDataList(snapshotData['completed_activities']);
    _completedTasks = getDataList(snapshotData['completed_tasks']);
    _graduationHistory = getStructList(
      snapshotData['graduation_history'],
      GraduationHistoryStruct.fromMap,
    );
    _userRole = deserializeEnum<RoleSystem>(snapshotData['user_role']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? displayName,
  String? fullName,
  String? cpf,
  AddressStruct? userAddress,
  int? currentPoints,
  int? currentLevel,
  RoleSystem? userRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'display_name': displayName,
      'full_name': fullName,
      'cpf': cpf,
      'user_address': AddressStruct().toMap(),
      'current_points': currentPoints,
      'current_level': currentLevel,
      'user_role': userRole,
    }.withoutNulls,
  );

  // Handle nested data for "user_address" field.
  addAddressStructData(firestoreData, userAddress, 'user_address');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayName == e2?.displayName &&
        e1?.fullName == e2?.fullName &&
        e1?.cpf == e2?.cpf &&
        e1?.userAddress == e2?.userAddress &&
        e1?.currentPoints == e2?.currentPoints &&
        e1?.currentLevel == e2?.currentLevel &&
        listEquality.equals(e1?.completedCorses, e2?.completedCorses) &&
        listEquality.equals(e1?.completedActivities, e2?.completedActivities) &&
        listEquality.equals(e1?.completedTasks, e2?.completedTasks) &&
        listEquality.equals(e1?.graduationHistory, e2?.graduationHistory) &&
        e1?.userRole == e2?.userRole;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.displayName,
        e?.fullName,
        e?.cpf,
        e?.userAddress,
        e?.currentPoints,
        e?.currentLevel,
        e?.completedCorses,
        e?.completedActivities,
        e?.completedTasks,
        e?.graduationHistory,
        e?.userRole
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
