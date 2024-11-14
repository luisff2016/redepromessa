import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankQuestionsRecord extends FirestoreRecord {
  BankQuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question_text" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "right_answer" field.
  int? _rightAnswer;
  int get rightAnswer => _rightAnswer ?? 0;
  bool hasRightAnswer() => _rightAnswer != null;

  // "category" field.
  QuestionCategory? _category;
  QuestionCategory? get category => _category;
  bool hasCategory() => _category != null;

  // "dificulty_level" field.
  DificultyLevel? _dificultyLevel;
  DificultyLevel? get dificultyLevel => _dificultyLevel;
  bool hasDificultyLevel() => _dificultyLevel != null;

  void _initializeFields() {
    _questionText = snapshotData['question_text'] as String?;
    _options = getDataList(snapshotData['options']);
    _rightAnswer = castToType<int>(snapshotData['right_answer']);
    _category = deserializeEnum<QuestionCategory>(snapshotData['category']);
    _dificultyLevel =
        deserializeEnum<DificultyLevel>(snapshotData['dificulty_level']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bank_questions');

  static Stream<BankQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankQuestionsRecord.fromSnapshot(s));

  static Future<BankQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankQuestionsRecord.fromSnapshot(s));

  static BankQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankQuestionsRecordData({
  String? questionText,
  int? rightAnswer,
  QuestionCategory? category,
  DificultyLevel? dificultyLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_text': questionText,
      'right_answer': rightAnswer,
      'category': category,
      'dificulty_level': dificultyLevel,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankQuestionsRecordDocumentEquality
    implements Equality<BankQuestionsRecord> {
  const BankQuestionsRecordDocumentEquality();

  @override
  bool equals(BankQuestionsRecord? e1, BankQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionText == e2?.questionText &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.rightAnswer == e2?.rightAnswer &&
        e1?.category == e2?.category &&
        e1?.dificultyLevel == e2?.dificultyLevel;
  }

  @override
  int hash(BankQuestionsRecord? e) => const ListEquality().hash([
        e?.questionText,
        e?.options,
        e?.rightAnswer,
        e?.category,
        e?.dificultyLevel
      ]);

  @override
  bool isValidKey(Object? o) => o is BankQuestionsRecord;
}
