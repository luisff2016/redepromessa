// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraduationHistoryStruct extends FFFirebaseStruct {
  GraduationHistoryStruct({
    int? level,
    DateTime? achievedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _level = level,
        _achievedAt = achievedAt,
        super(firestoreUtilData);

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  set level(int? val) => _level = val;

  void incrementLevel(int amount) => level = level + amount;

  bool hasLevel() => _level != null;

  // "achieved_at" field.
  DateTime? _achievedAt;
  DateTime? get achievedAt => _achievedAt;
  set achievedAt(DateTime? val) => _achievedAt = val;

  bool hasAchievedAt() => _achievedAt != null;

  static GraduationHistoryStruct fromMap(Map<String, dynamic> data) =>
      GraduationHistoryStruct(
        level: castToType<int>(data['level']),
        achievedAt: data['achieved_at'] as DateTime?,
      );

  static GraduationHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? GraduationHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'level': _level,
        'achieved_at': _achievedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'level': serializeParam(
          _level,
          ParamType.int,
        ),
        'achieved_at': serializeParam(
          _achievedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GraduationHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraduationHistoryStruct(
        level: deserializeParam(
          data['level'],
          ParamType.int,
          false,
        ),
        achievedAt: deserializeParam(
          data['achieved_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GraduationHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraduationHistoryStruct &&
        level == other.level &&
        achievedAt == other.achievedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([level, achievedAt]);
}

GraduationHistoryStruct createGraduationHistoryStruct({
  int? level,
  DateTime? achievedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraduationHistoryStruct(
      level: level,
      achievedAt: achievedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraduationHistoryStruct? updateGraduationHistoryStruct(
  GraduationHistoryStruct? graduationHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graduationHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraduationHistoryStructData(
  Map<String, dynamic> firestoreData,
  GraduationHistoryStruct? graduationHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graduationHistory == null) {
    return;
  }
  if (graduationHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && graduationHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graduationHistoryData =
      getGraduationHistoryFirestoreData(graduationHistory, forFieldValue);
  final nestedData =
      graduationHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = graduationHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraduationHistoryFirestoreData(
  GraduationHistoryStruct? graduationHistory, [
  bool forFieldValue = false,
]) {
  if (graduationHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graduationHistory.toMap());

  // Add any Firestore field values
  graduationHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraduationHistoryListFirestoreData(
  List<GraduationHistoryStruct>? graduationHistorys,
) =>
    graduationHistorys
        ?.map((e) => getGraduationHistoryFirestoreData(e, true))
        .toList() ??
    [];
