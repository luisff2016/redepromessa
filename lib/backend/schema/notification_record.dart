import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "list_of_recipients" field.
  List<DocumentReference>? _listOfRecipients;
  List<DocumentReference> get listOfRecipients => _listOfRecipients ?? const [];
  bool hasListOfRecipients() => _listOfRecipients != null;

  // "notification_type" field.
  NotificationType? _notificationType;
  NotificationType? get notificationType => _notificationType;
  bool hasNotificationType() => _notificationType != null;

  void _initializeFields() {
    _notificationText = snapshotData['notification_text'] as String?;
    _listOfRecipients = getDataList(snapshotData['list_of_recipients']);
    _notificationType =
        deserializeEnum<NotificationType>(snapshotData['notification_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? notificationText,
  NotificationType? notificationType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_text': notificationText,
      'notification_type': notificationType,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationText == e2?.notificationText &&
        listEquality.equals(e1?.listOfRecipients, e2?.listOfRecipients) &&
        e1?.notificationType == e2?.notificationType;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality()
      .hash([e?.notificationText, e?.listOfRecipients, e?.notificationType]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
