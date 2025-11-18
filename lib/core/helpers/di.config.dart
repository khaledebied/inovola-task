// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expense_tracker/core/firebase/firebase_analytics_helper.dart'
    as _i370;
import 'package:expense_tracker/core/firebase/realtime_database.dart' as _i557;
import 'package:expense_tracker/core/helpers/adaptive_picker.dart' as _i577;
import 'package:expense_tracker/core/helpers/file_service.dart' as _i204;
import 'package:expense_tracker/core/helpers/global_context.dart' as _i214;
import 'package:expense_tracker/core/helpers/global_notification.dart'
    as _i1059;
import 'package:expense_tracker/core/helpers/loading_helper.dart' as _i485;
import 'package:expense_tracker/core/helpers/local_storage/local_storage.dart'
    as _i921;
import 'package:expense_tracker/core/helpers/location_service.dart' as _i1061;
import 'package:expense_tracker/core/helpers/login_helper.dart' as _i370;
import 'package:expense_tracker/core/helpers/psermission_services.dart'
    as _i1005;
import 'package:expense_tracker/core/helpers/rate_helper.dart' as _i247;
import 'package:expense_tracker/core/helpers/sentry_helper.dart' as _i529;
import 'package:expense_tracker/core/helpers/share_services.dart' as _i325;
import 'package:expense_tracker/core/helpers/utilities.dart' as _i262;
import 'package:expense_tracker/core/http/dio_helper/actions/delete.dart'
    as _i86;
import 'package:expense_tracker/core/http/dio_helper/actions/get.dart' as _i658;
import 'package:expense_tracker/core/http/dio_helper/actions/patch.dart'
    as _i684;
import 'package:expense_tracker/core/http/dio_helper/actions/post.dart'
    as _i310;
import 'package:expense_tracker/core/http/dio_helper/actions/put.dart' as _i102;
import 'package:expense_tracker/core/http/dio_helper/utils/dio_header.dart'
    as _i1020;
import 'package:expense_tracker/core/http/dio_helper/utils/dio_options.dart'
    as _i449;
import 'package:expense_tracker/core/http/dio_helper/utils/handle_errors.dart'
    as _i80;
import 'package:expense_tracker/core/http/dio_helper/utils/handle_json_response.dart'
    as _i42;
import 'package:expense_tracker/core/http/dio_helper/utils/handle_request_body.dart'
    as _i341;
import 'package:expense_tracker/core/network/network_info.dart' as _i721;
import 'package:expense_tracker/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i896;
import 'package:expense_tracker/features/auth/data/data_sources/impl_auth_remote_data_source.dart'
    as _i943;
import 'package:expense_tracker/features/auth/data/repositories/impl_auth_repository.dart'
    as _i345;
import 'package:expense_tracker/features/auth/domain/repositories/auth_repository.dart'
    as _i664;
import 'package:expense_tracker/features/expense_tracker/data/data_sources/expense_local_data_source.dart'
    as _i200;
import 'package:expense_tracker/features/expense_tracker/data/data_sources/impl_expense_tracker_data_source.dart'
    as _i830;
import 'package:expense_tracker/features/expense_tracker/data/repositories/impl_expense_tracker_repository.dart'
    as _i1053;
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart'
    as _i978;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/add_expense.dart'
    as _i931;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_categories.dart'
    as _i620;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_currency_rate.dart'
    as _i335;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_expense_summary.dart'
    as _i25;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_expenses.dart'
    as _i217;
import 'package:expense_tracker/features/expense_tracker/domain/use_case/sync_offline_expenses.dart'
    as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i204.AppFileService>(() => _i204.AppFileService());
    gh.factory<_i1061.LocationService>(() => _i1061.LocationService());
    gh.factory<_i1005.PermissionServices>(() => _i1005.PermissionServices());
    gh.factory<_i325.ShareServices>(() => _i325.ShareServices());
    gh.factory<_i931.AddExpense>(() => _i931.AddExpense());
    gh.factory<_i620.GetCategories>(() => _i620.GetCategories());
    gh.factory<_i335.GetCurrencyRate>(() => _i335.GetCurrencyRate());
    gh.factory<_i217.GetExpenses>(() => _i217.GetExpenses());
    gh.factory<_i25.GetExpenseSummary>(() => _i25.GetExpenseSummary());
    gh.factory<_i974.SyncOfflineExpenses>(() => _i974.SyncOfflineExpenses());
    gh.singleton<_i485.LoadingHelper>(() => _i485.LoadingHelper());
    gh.lazySingleton<_i370.FirebaseAnalyticsHelper>(
        () => _i370.FirebaseAnalyticsHelper());
    gh.lazySingleton<_i557.RealTimeDatabaseService>(
        () => _i557.RealTimeDatabaseService());
    gh.lazySingleton<_i577.AdaptivePicker>(() => _i577.AdaptivePicker());
    gh.lazySingleton<_i214.GlobalContext>(() => _i214.GlobalContext());
    gh.lazySingleton<_i1059.GlobalNotification>(
        () => _i1059.GlobalNotification());
    gh.lazySingleton<_i370.LoginHelper>(() => _i370.LoginHelper());
    gh.lazySingleton<_i247.RateAppHelper>(() => _i247.RateAppHelper());
    gh.lazySingleton<_i529.SentryHelper>(() => _i529.SentryHelper());
    gh.lazySingleton<_i262.Utilities>(() => _i262.Utilities());
    gh.lazySingleton<_i86.Delete>(() => _i86.Delete());
    gh.lazySingleton<_i658.Get>(() => _i658.Get());
    gh.lazySingleton<_i684.Patch>(() => _i684.Patch());
    gh.lazySingleton<_i310.Post>(() => _i310.Post());
    gh.lazySingleton<_i102.Put>(() => _i102.Put());
    gh.lazySingleton<_i1020.DioHeader>(() => _i1020.DioHeader());
    gh.lazySingleton<_i449.DioOptions>(() => _i449.DioOptions());
    gh.lazySingleton<_i80.HandleErrors>(() => _i80.HandleErrors());
    gh.lazySingleton<_i42.HandleJsonResponse<dynamic>>(
        () => _i42.HandleJsonResponse<dynamic>());
    gh.lazySingleton<_i341.HandleRequestBody>(() => _i341.HandleRequestBody());
    gh.lazySingleton<_i721.NetworkInfoImpl>(() => _i721.NetworkInfoImpl());
    gh.lazySingleton<_i921.LocalStorage>(() => _i921.LocalStorage());
    gh.factory<_i978.ExpenseRepository>(() => _i1053.ImplExpenseRepository());
    gh.factory<_i896.AuthRemoteDataSource>(
        () => _i943.ImplAuthRemoteDataSource());
    gh.factory<_i830.ExpenseRemoteDataSource>(
        () => _i830.ImplExpenseRemoteDataSource());
    gh.factory<_i200.ExpenseLocalDataSource>(
        () => _i200.ImplExpenseLocalDataSource());
    gh.factory<_i664.AuthRepository>(() => _i345.ImplAuthRepository());
    return this;
  }
}
