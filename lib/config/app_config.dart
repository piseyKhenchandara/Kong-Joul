class AppConfig {
  static const supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://sdeltabhnujeskzviplz.supabase.co',
  );

  static const supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'sb_publishable_BM8zzatlX4Ai3tjtxRpWYA_rs-K_2E6',
  );
}
