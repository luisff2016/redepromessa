import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialQuizRecord extends FirestoreRecord {
  MaterialQuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "questions" field.
  List<DocumentReference>? _questions;
  List<DocumentReference> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "max_time_seg" field.
  int? _maxTimeSeg;
  int get maxTimeSeg => _maxTimeSeg ?? 0;
  bool hasMaxTimeSeg() => _maxTimeSeg != null;

  // "quantity_questions" field.
  int? _quantityQuestions;
  int get quantityQuestions => _quantityQuestions ?? 0;
  bool hasQuantityQuestions() => _quantityQuestions != null;

  // "category_quiz" field.
  QuestionCategory? _categoryQuiz;
  QuestionCategory? get categoryQuiz => _categoryQuiz;
  bool hasCategoryQuiz() => _categoryQuiz != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _questions = getDataList(snapshotData['questions']);
    _maxTimeSeg = castToType<int>(snapshotData['max_time_seg']);
    _quantityQuestions = castToType<int>(snapshotData['quantity_questions']);
    _categoryQuiz =
        deserializeEnum<QuestionCategory>(snapshotData['category_quiz']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('material_quiz')
          : FirebaseFirestore.instance.collectionGroup('material_quiz');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('material_quiz').doc(id);

  static Stream<MaterialQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialQuizRecord.fromSnapshot(s));

  static Future<MaterialQuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialQuizRecord.fromSnapshot(s));

  static MaterialQuizRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialQuizRecordData({
  String? title,
  String? description,
  int? maxTimeSeg,
  int? quantityQuestions,
  QuestionCategory? categoryQuiz,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'max_time_seg': maxTimeSeg,
      'quantity_questions': quantityQuestions,
      'category_quiz': categoryQuiz,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialQuizRecordDocumentEquality
    implements Equality<MaterialQuizRecord> {
  const MaterialQuizRecordDocumentEquality();

  @override
  bool equals(MaterialQuizRecord? e1, MaterialQuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.maxTimeSeg == e2?.maxTimeSeg &&
        e1?.quantityQuestions == e2?.quantityQuestions &&
        e1?.categoryQuiz == e2?.categoryQuiz;
  }

  @override
  int hash(MaterialQuizRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.questions,
        e?.maxTimeSeg,
        e?.quantityQuestions,
        e?.categoryQuiz
      ]);

  @override
  bool isValidKey(Object? o) => o is MaterialQuizRecord;
}
