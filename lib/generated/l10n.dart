// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TRY AGAIN`
  String get tryAgain {
    return Intl.message('TRY AGAIN', name: 'tryAgain', desc: '', args: []);
  }

  /// `INTERNAL SERVER ERROR`
  String get error_internal_server {
    return Intl.message(
      'INTERNAL SERVER ERROR',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `BAD REQUEST`
  String get error_BadRequest_Error {
    return Intl.message(
      'BAD REQUEST',
      name: 'error_BadRequest_Error',
      desc: '',
      args: [],
    );
  }

  /// `No result found`
  String get error_NotFound_Error {
    return Intl.message(
      'No result found',
      name: 'error_NotFound_Error',
      desc: '',
      args: [],
    );
  }

  /// `TIME OUT`
  String get error_Timeout_Error {
    return Intl.message(
      'TIME OUT',
      name: 'error_Timeout_Error',
      desc: '',
      args: [],
    );
  }

  /// `AN UNEXPECTED ERROR OCCURRED`
  String get error_general {
    return Intl.message(
      'AN UNEXPECTED ERROR OCCURRED',
      name: 'error_general',
      desc: '',
      args: [],
    );
  }

  /// `UNAUTHORIZED`
  String get error_Unauthorized_Error {
    return Intl.message(
      'UNAUTHORIZED',
      name: 'error_Unauthorized_Error',
      desc: '',
      args: [],
    );
  }

  /// `YOU DO NOT HAVE PRIVILEGE`
  String get error_forbidden_error {
    return Intl.message(
      'YOU DO NOT HAVE PRIVILEGE',
      name: 'error_forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during the connection`
  String get error_connection {
    return Intl.message(
      'An error occurred during the connection',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  /// `Connection error`
  String get error_connection_lost {
    return Intl.message(
      'Connection error',
      name: 'error_connection_lost',
      desc: '',
      args: [],
    );
  }

  /// `The connection is interrupted`
  String get error_cancel_token {
    return Intl.message(
      'The connection is interrupted',
      name: 'error_cancel_token',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_confirm_password {
    return Intl.message(
      'Passwords do not match',
      name: 'error_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter this field`
  String get fillField {
    return Intl.message(
      'Please enter this field',
      name: 'fillField',
      desc: '',
      args: [],
    );
  }

  /// `Should have Upper and Lower case, numbers and special characters`
  String get passValidation {
    return Intl.message(
      'Should have Upper and Lower case, numbers and special characters',
      name: 'passValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get mailValidation {
    return Intl.message(
      'Please enter a valid email',
      name: 'mailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid mobile phone`
  String get phoneValidation {
    return Intl.message(
      'Please enter a valid mobile phone',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password identical`
  String get confirmValidation {
    return Intl.message(
      'Please enter the password identical',
      name: 'confirmValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the address`
  String get AddressValidation {
    return Intl.message(
      'Please enter the address',
      name: 'AddressValidation',
      desc: '',
      args: [],
    );
  }

  /// `Should be more than 8 and less than 30`
  String get nameValidation {
    return Intl.message(
      'Should be more than 8 and less than 30',
      name: 'nameValidation',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get error_socket {
    return Intl.message(
      'No internet connection',
      name: 'error_socket',
      desc: '',
      args: [],
    );
  }

  /// `Conflict error`
  String get error_conflict {
    return Intl.message(
      'Conflict error',
      name: 'error_conflict',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_cancel {
    return Intl.message('Cancel', name: 'app_cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get app_confirm {
    return Intl.message('Confirm', name: 'app_confirm', desc: '', args: []);
  }

  /// `Logout`
  String get label_logout {
    return Intl.message('Logout', name: 'label_logout', desc: '', args: []);
  }

  /// `Change language`
  String get label_change_language {
    return Intl.message(
      'Change language',
      name: 'label_change_language',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get label_choose_language {
    return Intl.message(
      'Choose language',
      name: 'label_choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get label_app_language {
    return Intl.message(
      'Language',
      name: 'label_app_language',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get label_Login {
    return Intl.message('Login', name: 'label_Login', desc: '', args: []);
  }

  /// `Login / Create account`
  String get label_Login_register {
    return Intl.message(
      'Login / Create account',
      name: 'label_Login_register',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get label_register {
    return Intl.message('Register', name: 'label_register', desc: '', args: []);
  }

  /// `Forget password?`
  String get label_forget_pass {
    return Intl.message(
      'Forget password?',
      name: 'label_forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get label_phone {
    return Intl.message('Phone', name: 'label_phone', desc: '', args: []);
  }

  /// `Email`
  String get label_email {
    return Intl.message('Email', name: 'label_email', desc: '', args: []);
  }

  /// `Password`
  String get label_password {
    return Intl.message('Password', name: 'label_password', desc: '', args: []);
  }

  /// `Full name`
  String get label_full_name {
    return Intl.message(
      'Full name',
      name: 'label_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get label_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'label_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Loading…`
  String get loadingText {
    return Intl.message('Loading…', name: 'loadingText', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Add new item`
  String get add_new_item {
    return Intl.message(
      'Add new item',
      name: 'add_new_item',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Failure Actions`
  String get failureActions {
    return Intl.message(
      'Failure Actions',
      name: 'failureActions',
      desc: '',
      args: [],
    );
  }

  /// `Access denied`
  String get access_denied {
    return Intl.message(
      'Access denied',
      name: 'access_denied',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Pick`
  String get pick {
    return Intl.message('Pick', name: 'pick', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Files size must be less than {MB} MB, {files}`
  String size_more_than_mg_error(Object MB, Object files) {
    return Intl.message(
      'Files size must be less than $MB MB, $files',
      name: 'size_more_than_mg_error',
      desc: '',
      args: [MB, files],
    );
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Internet connected`
  String get internet_connected {
    return Intl.message(
      'Internet connected',
      name: 'internet_connected',
      desc: '',
      args: [],
    );
  }

  /// `No Results`
  String get noResults {
    return Intl.message('No Results', name: 'noResults', desc: '', args: []);
  }

  /// `Skip`
  String get lblSkip {
    return Intl.message('Skip', name: 'lblSkip', desc: '', args: []);
  }

  /// `Enter your mobile number to log in`
  String get enterMobileToLogin {
    return Intl.message(
      'Enter your mobile number to log in',
      name: 'enterMobileToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `Login as visitor`
  String get loginAsVisitor {
    return Intl.message(
      'Login as visitor',
      name: 'loginAsVisitor',
      desc: '',
      args: [],
    );
  }

  /// `Login as partner`
  String get loginAsPartner {
    return Intl.message(
      'Login as partner',
      name: 'loginAsPartner',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get lblRequired {
    return Intl.message('Required', name: 'lblRequired', desc: '', args: []);
  }

  /// `Incorrect phone number`
  String get lblIncorrectPhone {
    return Intl.message(
      'Incorrect phone number',
      name: 'lblIncorrectPhone',
      desc: '',
      args: [],
    );
  }

  /// `Login as customer`
  String get loginAsCustomer {
    return Intl.message(
      'Login as customer',
      name: 'loginAsCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get lblAreYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'lblAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get logOutSuccessDone {
    return Intl.message('Done', name: 'logOutSuccessDone', desc: '', args: []);
  }

  /// `Enter OTP`
  String get lblEnterOtp {
    return Intl.message('Enter OTP', name: 'lblEnterOtp', desc: '', args: []);
  }

  /// `Expired in`
  String get lblExpiredIn {
    return Intl.message('Expired in', name: 'lblExpiredIn', desc: '', args: []);
  }

  /// `Resend`
  String get lblResend {
    return Intl.message('Resend', name: 'lblResend', desc: '', args: []);
  }

  /// `Create account`
  String get lblCreateAccount {
    return Intl.message(
      'Create account',
      name: 'lblCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get lblUserName {
    return Intl.message('Your name', name: 'lblUserName', desc: '', args: []);
  }

  /// `Jwal`
  String get jwal {
    return Intl.message('Jwal', name: 'jwal', desc: '', args: []);
  }

  /// `Date of birth`
  String get lblDateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'lblDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get lblMale {
    return Intl.message('Male', name: 'lblMale', desc: '', args: []);
  }

  /// `Female`
  String get lblFemale {
    return Intl.message('Female', name: 'lblFemale', desc: '', args: []);
  }

  /// `Promo code (optional)`
  String get lblPromoCode {
    return Intl.message(
      'Promo code (optional)',
      name: 'lblPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the`
  String get lblIAgreeToThe {
    return Intl.message(
      'I agree to the',
      name: 'lblIAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get lblTermsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'lblTermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get lblAnd {
    return Intl.message('and', name: 'lblAnd', desc: '', args: []);
  }

  /// `Privacy policy`
  String get lblPrivacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'lblPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get lblLoading {
    return Intl.message('Loading...', name: 'lblLoading', desc: '', args: []);
  }

  /// `In Foz App Experience`
  String get fozAppExperience {
    return Intl.message(
      'In Foz App Experience',
      name: 'fozAppExperience',
      desc: '',
      args: [],
    );
  }

  /// `In the Foz application partners portal`
  String get fozAppPartner {
    return Intl.message(
      'In the Foz application partners portal',
      name: 'fozAppPartner',
      desc: '',
      args: [],
    );
  }

  /// `Log in, or create an account on Foz to be able to browse coupons and auctions..`
  String get loginTitle {
    return Intl.message(
      'Log in, or create an account on Foz to be able to browse coupons and auctions..',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register as a partner`
  String get registerPartnerLabel {
    return Intl.message(
      'Register as a partner',
      name: 'registerPartnerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit phone number`
  String get editPhoneLabel {
    return Intl.message(
      'Edit phone number',
      name: 'editPhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the information to register a new account`
  String get completeFieldsToRegister {
    return Intl.message(
      'Fill in the information to register a new account',
      name: 'completeFieldsToRegister',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `of our app`
  String get lblOurApp {
    return Intl.message('of our app', name: 'lblOurApp', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
