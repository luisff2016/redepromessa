// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? postalCode,
    String? street,
    String? number,
    String? complement,
    String? neighborhood,
    String? city,
    String? state,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postalCode = postalCode,
        _street = street,
        _number = number,
        _complement = complement,
        _neighborhood = neighborhood,
        _city = city,
        _state = state,
        _country = country,
        super(firestoreUtilData);

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '49000000';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "street" field.
  String? _street;
  String get street => _street ?? 'Rua';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "number" field.
  String? _number;
  String get number => _number ?? 's/n';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? 'nenhum';
  set complement(String? val) => _complement = val;

  bool hasComplement() => _complement != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? 'Bairro';
  set neighborhood(String? val) => _neighborhood = val;

  bool hasNeighborhood() => _neighborhood != null;

  // "city" field.
  String? _city;
  String get city => _city ?? 'Cidade';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? 'UF';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? 'Brasil';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        postalCode: data['postal_code'] as String?,
        street: data['street'] as String?,
        number: data['number'] as String?,
        complement: data['complement'] as String?,
        neighborhood: data['neighborhood'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'postal_code': _postalCode,
        'street': _street,
        'number': _number,
        'complement': _complement,
        'neighborhood': _neighborhood,
        'city': _city,
        'state': _state,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postal_code': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'complement': serializeParam(
          _complement,
          ParamType.String,
        ),
        'neighborhood': serializeParam(
          _neighborhood,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        postalCode: deserializeParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        complement: deserializeParam(
          data['complement'],
          ParamType.String,
          false,
        ),
        neighborhood: deserializeParam(
          data['neighborhood'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        postalCode == other.postalCode &&
        street == other.street &&
        number == other.number &&
        complement == other.complement &&
        neighborhood == other.neighborhood &&
        city == other.city &&
        state == other.state &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality().hash([
        postalCode,
        street,
        number,
        complement,
        neighborhood,
        city,
        state,
        country
      ]);
}

AddressStruct createAddressStruct({
  String? postalCode,
  String? street,
  String? number,
  String? complement,
  String? neighborhood,
  String? city,
  String? state,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      postalCode: postalCode,
      street: street,
      number: number,
      complement: complement,
      neighborhood: neighborhood,
      city: city,
      state: state,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
