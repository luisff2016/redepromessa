import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
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

  // "evaluation_type" field.
  List<String>? _evaluationType;
  List<String> get evaluationType => _evaluationType ?? const [];
  bool hasEvaluationType() => _evaluationType != null;

  // "lesson_video" field.
  DocumentReference? _lessonVideo;
  DocumentReference? get lessonVideo => _lessonVideo;
  bool hasLessonVideo() => _lessonVideo != null;

  // "lesson_audio" field.
  DocumentReference? _lessonAudio;
  DocumentReference? get lessonAudio => _lessonAudio;
  bool hasLessonAudio() => _lessonAudio != null;

  // "lesson_image" field.
  DocumentReference? _lessonImage;
  DocumentReference? get lessonImage => _lessonImage;
  bool hasLessonImage() => _lessonImage != null;

  // "lesson_quiz" field.
  DocumentReference? _lessonQuiz;
  DocumentReference? get lessonQuiz => _lessonQuiz;
  bool hasLessonQuiz() => _lessonQuiz != null;

  // "lesson_presentation" field.
  DocumentReference? _lessonPresentation;
  DocumentReference? get lessonPresentation => _lessonPresentation;
  bool hasLessonPresentation() => _lessonPresentation != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _evaluationType = getDataList(snapshotData['evaluation_type']);
    _lessonVideo = snapshotData['lesson_video'] as DocumentReference?;
    _lessonAudio = snapshotData['lesson_audio'] as DocumentReference?;
    _lessonImage = snapshotData['lesson_image'] as DocumentReference?;
    _lessonQuiz = snapshotData['lesson_quiz'] as DocumentReference?;
    _lessonPresentation =
        snapshotData['lesson_presentation'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons')
          : FirebaseFirestore.instance.collectionGroup('lessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lessons').doc(id);

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? title,
  String? description,
  DocumentReference? lessonVideo,
  DocumentReference? lessonAudio,
  DocumentReference? lessonImage,
  DocumentReference? lessonQuiz,
  DocumentReference? lessonPresentation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'lesson_video': lessonVideo,
      'lesson_audio': lessonAudio,
      'lesson_image': lessonImage,
      'lesson_quiz': lessonQuiz,
      'lesson_presentation': lessonPresentation,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.evaluationType, e2?.evaluationType) &&
        e1?.lessonVideo == e2?.lessonVideo &&
        e1?.lessonAudio == e2?.lessonAudio &&
        e1?.lessonImage == e2?.lessonImage &&
        e1?.lessonQuiz == e2?.lessonQuiz &&
        e1?.lessonPresentation == e2?.lessonPresentation;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.evaluationType,
        e?.lessonVideo,
        e?.lessonAudio,
        e?.lessonImage,
        e?.lessonQuiz,
        e?.lessonPresentation
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
