import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/helpers/app_snack_bar_service.dart';
import 'package:expense_tracker/core/helpers/global_state.dart';
import 'package:expense_tracker/core/helpers/storage/storage.dart';
import 'package:expense_tracker/core/routes/router_imports.gr.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user/user_model.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user_response_model/user_response_model.dart';
import 'package:expense_tracker/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:expense_tracker/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginHelper {
  Future<bool> manipulateLoginData(BuildContext context, UserResponseModel? data) async {
    if (data != null) {
      UserModel? user = data.data;
      num? availableBalance = user?.user?.availableBalance;
      num newAvailableBalance = num.tryParse(availableBalance?.toStringAsFixed(2)??'0') ?? 0;
      user?.user?.availableBalance = newAvailableBalance;
      GlobalState.instance.set("token", user?.token);
      Storage.setToken(user?.token ?? '');
      await Storage.saveUserData(user!);
      // setCurrentUserData(user, data.data?.user?.status != LoginStatusEnum.incomplete.status, context);
      if (data.msg?.isNotEmpty ?? false) AppSnackBar.showTopSnackBar(message: data.msg ?? '', context: context);
      return true;
    } else {
      if (data?.msg?.isNotEmpty ?? false) AppSnackBar.showTopSnackBar(message: data?.msg ?? '', context: context);
      return false;
    }
  }

  void setCurrentUserData(UserModel model, bool isRegistered, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
  }
}
