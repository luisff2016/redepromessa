import 'package:collection/collection.dart';

enum Headquarters {
  own_property,
  rented_property,
  borrowed_property,
  no_fixed_location,
}

enum NotificationType {
  connection,
  update,
  alert,
  reminder,
  information,
  task,
  event,
  activity,
  transaction,
  system,
  marketing,
  confirmation,
  canceled,
  fix,
}

enum MemberRole {
  visitor,
  donor,
  regular,
  member,
  ordained,
  employee,
  inactive,
  transferred,
}

enum EventsType {
  GeneralAssembly,
  SolemnAssembly,
  ExtraordinaryAssembly,
  Cults,
}

enum QuestionCategory {
  Utilities,
  Doctrine,
  ChristianEthics,
  Evangelism,
  Inclusion,
  Chaplaincy,
  HumanitarianAction,
  Leadership,
  Relationship,
  DevotionalLife,
  Volunteering,
  Church,
  Citizenship,
  BiblicalKnowledge,
}

enum DificultyLevel {
  Easy,
  Medium,
  Difficult,
}

enum ActivityStatus {
  Scheduled,
  Pending,
  InProgress,
  Completed,
  Canceled,
  Postponed,
}

enum AttendanceStatus {
  Present,
  Absent,
  Excused,
  Late,
  LeftEarly,
  Remote,
  Pending,
}

enum ActivityType {
  WorshipService,
  BibleStudy,
  PrayerMeeting,
  CommunityOutreach,
  Training,
  Workshop,
  YouthGroup,
  LeadershipMeeting,
  Retreat,
  FundraisingEvent,
  Seminar,
  Conference,
  ChildrensProgram,
  FamilyEvent,
  Visitation,
  SpecialCelebration,
}

enum TaskType {
  ReadBook,
  ReadBible,
  VisitPatient,
  HospitalVisit,
  CommunityService,
  ChurchActivity,
  Other,
}

enum TaskStatus {
  Pending,
  InProgress,
  Completed,
  Approved,
  Rejected,
}

enum ContributionType {
  Fiinancial,
  InKind,
  Service,
}

enum PaymentMethod {
  Cash,
  PIX,
  Transfer,
  Card,
}

enum ContributionStatus {
  Pending,
  Confirmed,
  Cancelled,
}

enum OrganizationType {
  GeneralConvention,
  RegionalConvention,
  ChurchWithitsOwnCNPJ,
}

enum DonationType {
  Food,
  Clothes,
  Books,
}

enum DonationUnit {
  Pieces,
  Kg,
}

enum DonationCondition {
  NewItem,
  UsedGood,
}

enum ServiceType {
  psychologist,
  dentist,
  lawyer,
  accountant,
  nurse,
  barber,
  hairdresser,
  manicurist,
  speaker,
  teacher,
  speech_therapist,
  programmer,
  electrician,
  plumber,
  bricklayer,
  general_helper,
}

enum SourceType {
  Activity,
  Tasks,
  Donation,
  Course,
}

enum PointStatus {
  Awarded,
  Pending,
}

enum RoleSystem {
  Visitor,
  Collaborator,
  Volunteer,
  Leader,
  Employee,
  Manager,
  Administrator,
  Blocked,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Headquarters):
      return Headquarters.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (MemberRole):
      return MemberRole.values.deserialize(value) as T?;
    case (EventsType):
      return EventsType.values.deserialize(value) as T?;
    case (QuestionCategory):
      return QuestionCategory.values.deserialize(value) as T?;
    case (DificultyLevel):
      return DificultyLevel.values.deserialize(value) as T?;
    case (ActivityStatus):
      return ActivityStatus.values.deserialize(value) as T?;
    case (AttendanceStatus):
      return AttendanceStatus.values.deserialize(value) as T?;
    case (ActivityType):
      return ActivityType.values.deserialize(value) as T?;
    case (TaskType):
      return TaskType.values.deserialize(value) as T?;
    case (TaskStatus):
      return TaskStatus.values.deserialize(value) as T?;
    case (ContributionType):
      return ContributionType.values.deserialize(value) as T?;
    case (PaymentMethod):
      return PaymentMethod.values.deserialize(value) as T?;
    case (ContributionStatus):
      return ContributionStatus.values.deserialize(value) as T?;
    case (OrganizationType):
      return OrganizationType.values.deserialize(value) as T?;
    case (DonationType):
      return DonationType.values.deserialize(value) as T?;
    case (DonationUnit):
      return DonationUnit.values.deserialize(value) as T?;
    case (DonationCondition):
      return DonationCondition.values.deserialize(value) as T?;
    case (ServiceType):
      return ServiceType.values.deserialize(value) as T?;
    case (SourceType):
      return SourceType.values.deserialize(value) as T?;
    case (PointStatus):
      return PointStatus.values.deserialize(value) as T?;
    case (RoleSystem):
      return RoleSystem.values.deserialize(value) as T?;
    default:
      return null;
  }
}
