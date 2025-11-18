import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/http/models/result.dart';
import 'package:expense_tracker/core/models/base_response.dart';
import 'package:expense_tracker/core/models/model_to_domain/model_to_domain.dart';
import 'package:expense_tracker/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user_response_model/user_response_model.dart';
import 'package:expense_tracker/features/auth/domain/entity/enable_notification_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/register_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/user_login_entity.dart';
import 'package:expense_tracker/features/auth/domain/entity/verify_code_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class ImplAuthRepository extends AuthRepository with ModelToDomainResult {
}
