// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'KortexOne Mobile';

  @override
  String get loginTitle => 'Welcome Back';

  @override
  String get loginSubtitle => 'Sign in to continue to KortexOne';

  @override
  String get emailLabel => 'EMAIL';

  @override
  String get emailHint => 'you@company.com';

  @override
  String get passwordLabel => 'PASSWORD';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get copyright => '© 2026 KortexOne. All rights reserved.';

  @override
  String get signInButton => 'Sign In';

  @override
  String get emptyEmailError => 'Email cannot be empty';

  @override
  String get invalidEmailError => 'Please enter a valid email';

  @override
  String get emptyPasswordError => 'Password cannot be empty';

  @override
  String get passwordTooShortError => 'Password must be at least 6 characters';
}
