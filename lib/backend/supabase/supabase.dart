import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://nxihscpkbpcsvymynknd.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im54aWhzY3BrYnBjc3Z5bXlua25kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk0NjQ5MjUsImV4cCI6MjAyNTA0MDkyNX0.p8vN2wfqYrN5Xrgkhxe6lAfFdam36bOZJ4XFqLzCB2o';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
