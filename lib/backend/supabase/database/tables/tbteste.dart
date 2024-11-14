import '../database.dart';

class TbtesteTable extends SupabaseTable<TbtesteRow> {
  @override
  String get tableName => 'tbteste';

  @override
  TbtesteRow createRow(Map<String, dynamic> data) => TbtesteRow(data);
}

class TbtesteRow extends SupabaseDataRow {
  TbtesteRow(super.data);

  @override
  SupabaseTable get table => TbtesteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get nivel => getField<int>('nivel');
  set nivel(int? value) => setField<int>('nivel', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);
}
