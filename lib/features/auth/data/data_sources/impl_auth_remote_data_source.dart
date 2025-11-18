import 'package:expense_tracker/core/http/generic_http/api_names.dart';
import 'package:expense_tracker/core/http/generic_http/generic_http.dart';
import 'package:expense_tracker/core/http/models/http_request_model.dart';
import 'package:expense_tracker/core/http/models/result.dart';
import 'package:expense_tracker/core/models/base_response.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user_response_model/user_response_model.dart';
import 'package:expense_tracker/features/auth/domain/entity/enable_notification_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/register_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/user_login_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/verify_code_entity.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class ImplAuthRemoteDataSource extends AuthRemoteDataSource {


}
