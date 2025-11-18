import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/global_context.dart';
import 'package:expense_tracker/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseAnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // String getUserEmail(BuildContext context) => context.read<UserCubit>().state.model?.user?.email ?? "";

  String getUserPhone(BuildContext context) => context.read<UserCubit>().state.model?.user?.phone ?? "";

  String getUserName(BuildContext context) => "${context.read<UserCubit>().state.model?.user?.name}";

  String getTimeZone() => DateTime.now().timeZoneName;

  void handleAnalyticsAuthEvent(
    String eventName,
  ) async {
    var context = getIt<GlobalContext>().context();
    var eventParams = {
      // 'Email': getUserEmail(context),
      'Phone': getUserPhone(context),
      'Name': getUserName(context),
      'Timezone': getTimeZone(),
    };
    eventParams.removeWhere((key, value) => value == '');
    await Future.wait([
      analytics.logEvent(name: eventName, parameters: eventParams),
    ]);
  }

  void handleAnalyticsEvent(String eventName) async {
    var context = getIt<GlobalContext>().context();
    var eventParams = {
      'Phone': getUserPhone(context),
      'Name': getUserName(context),
      'Timezone': getTimeZone(),
    };
    eventParams.removeWhere((key, value) => value == '');
    await Future.wait([
      analytics.logEvent(name: eventName, parameters: eventParams),
    ]);
  }

  //Auth
  Future<void> login() async => handleAnalyticsAuthEvent(
        'login',
      );

  Future<void> verifyOtp() async => handleAnalyticsAuthEvent(
        'verifyOtp',
      );
  Future<void> enableNotification() async => handleAnalyticsAuthEvent(
        'enableNotification',
      );
  Future<void> resendOtp() async => handleAnalyticsAuthEvent(
        'resendOtp',
      );

  Future<void> register() async => handleAnalyticsAuthEvent('register');

  Future<void> completeRegister() async => handleAnalyticsAuthEvent('completeRegister');

  // Dashboard

  Future<void> mainDashboard() async => handleAnalyticsEvent('main_dashboard');

  Future<void> whatsUp() async => handleAnalyticsEvent('whats_up');

  Future<void> consolidatedPosition() async => handleAnalyticsEvent('consolidated_position');

  Future<void> cashDistributions() async => handleAnalyticsEvent('cash_distributions');

  Future<void> payableCashDistributions() async => handleAnalyticsEvent('payable_cash_distributions');

  Future<void> topHoldings() async => handleAnalyticsEvent('top_holdings');

  Future<void> requests() async => handleAnalyticsEvent('requests');

  Future<void> transactions() async => handleAnalyticsEvent('transactions');

  Future<void> portfolioDistributions() async => handleAnalyticsEvent('portfolio_distributions');

  Future<void> mutualFundByPortfolio() async => handleAnalyticsEvent('mutual_fund_by_portfolio');

  // Mutual Funds
  Future<void> mutualFundListing() async => handleAnalyticsEvent('mutual_funds_listing');

  Future<void> mutualFundDetails() async => handleAnalyticsEvent('mutual_fund_details');

  // Accounts
  Future<void> accounts() async => handleAnalyticsEvent('accounts');

  Future<void> accountActions() async => handleAnalyticsEvent('account_actions');

  Future<void> accountClosure() async => handleAnalyticsEvent('account_closure');

  Future<void> accountRequests() async => handleAnalyticsEvent('account_requests');

  Future<void> accountEKYC() async => handleAnalyticsEvent('account_ekyc');

  Future<void> accountDocuments() async => handleAnalyticsEvent('account_documents');

  Future<void> accountBanks() async => handleAnalyticsEvent('account_banks');

  Future<void> accountContacts() async => handleAnalyticsEvent('account_contacts');

  Future<void> accountTransactions() async => handleAnalyticsEvent('account_transactions');

  Future<void> filterPortfolio() async => handleAnalyticsEvent('filter_portfolio');

  Future<void> portfolioActions() async => handleAnalyticsEvent('portfolio_actions');

  // Transactions
  Future<void> createPortfolio() async => handleAnalyticsEvent('create_portfolio');

  Future<void> invest() async => handleAnalyticsEvent('invest_action');

  Future<void> deposit() async => handleAnalyticsEvent('deposit_action');

  Future<void> withdrawal() async => handleAnalyticsEvent('withdrawal_action');

  Future<void> redemption() async => handleAnalyticsEvent('redemption_action');

  Future<void> withdrawalRedemption() async => handleAnalyticsEvent('withdrawal_redemption_action');

  Future<void> knet() async => handleAnalyticsEvent('knet_action');

  Future<void> wireTransfer() async => handleAnalyticsEvent('wire_transfer_action');

  Future<void> checkOut() async => handleAnalyticsEvent('knet_check_out');

  Future<void> wireTransferSuccess() async => handleAnalyticsEvent('wire_transfer_success');

  Future<void> reports() async => handleAnalyticsEvent('reports_action');

  Future<void> requestDetails() async => handleAnalyticsEvent('request_details');

  // KYC
  Future<void> addNewKyc() async => handleAnalyticsEvent('add_new_kyc');

  Future<void> addExistKyc() async => handleAnalyticsEvent('add_exist_kyc');

  Future<void> scanCivilID() async => handleAnalyticsEvent('scan_civil_id');

  Future<void> scanPassport() async => handleAnalyticsEvent('scan_passport');

  Future<void> feedBack() async => handleAnalyticsEvent('feedback');

  // Settings
  Future<void> fxRate() async => handleAnalyticsEvent('fx_rate');

  Future<void> updateProfile() async => handleAnalyticsEvent('update_profile');

  Future<void> updatePassword() async => handleAnalyticsEvent('update_password');
}
