import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/local_storage/local_storage.dart';

part 'auth_state.dart';

class AuthData {
  final String email;
  final String password;
  final bool showPassword;
  final bool isLoading;
  final bool isLoggedIn;

  const AuthData({
    this.email = '',
    this.password = '',
    this.showPassword = false,
    this.isLoading = false,
    this.isLoggedIn = false,
  });

  AuthData copyWith({
    String? email,
    String? password,
    bool? showPassword,
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return AuthData(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class AuthCubit extends GenericBloc<AuthData> {
  AuthCubit() : super(const AuthData());

  void updateEmail(String email) {
    onUpdateData(state.data.copyWith(email: email));
  }

  void updatePassword(String password) {
    onUpdateData(state.data.copyWith(password: password));
  }

  void togglePasswordVisibility() {
    onUpdateData(state.data.copyWith(showPassword: !state.data.showPassword));
  }

  void login() async {
    onUpdateData(state.data.copyWith(isLoading: true));

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Simple demo authentication
      if (state.data.email == 'demo@example.com' && state.data.password == 'password123') {
        await getIt<LocalStorage>().setItem("isLoggedIn", "true");
        await getIt<LocalStorage>().setItem("userEmail", state.data.email);

        onUpdateData(state.data.copyWith(
          isLoading: false,
          isLoggedIn: true,
        ));
      } else {
        onUpdateData(state.data.copyWith(isLoading: false));
        onFailedResponse(error: "Invalid email or password");
      }
    } catch (e) {
      onUpdateData(state.data.copyWith(isLoading: false));
      onFailedResponse(error: "Login failed. Please try again.");
    }
  }

  void logout() async {
    await getIt<LocalStorage>().removeItem("isLoggedIn");
    await getIt<LocalStorage>().removeItem("userEmail");
    onUpdateToInitState(const AuthData());
  }
}
