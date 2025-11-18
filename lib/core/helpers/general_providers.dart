import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/bloc/auction_cubit/auction_cubit.dart';
import 'package:expense_tracker/core/bloc/device_cubit/device_cubit.dart';
import 'package:expense_tracker/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:expense_tracker/features/auth/presentation/manager/user_cubit/user_cubit.dart';

class GeneralProviders {
  GeneralProviders._();

  static GeneralProviders instance = GeneralProviders._();

  List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<DeviceCubit>(
          create: (BuildContext context) => DeviceCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<AuctionCubit>(
          create: (BuildContext context) => AuctionCubit(),
        ),
      ];
}
