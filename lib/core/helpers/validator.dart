import 'package:expense_tracker/core/localization/localization_method.dart';
import 'package:expense_tracker/core/localization/translate.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? validateEmpty({String? message}) {
    if (message == null || message.isEmpty) {
      return tr("lblRequired");
    }
    return null;
  }

  String? validateName({String? value}) {
    if (value == null || value.isEmpty) {
      return tr("lblRequired");
    }
    if (RegExp(r'[0-9٠-٩]').hasMatch(value) || RegExp(r'[!@#$%^&*(),.?":{}|<>٪]').hasMatch(value)) {
      return tr("lblNameWithoutNumsOrChar");
    }
    if (value.length < 3) {
      return tr("minimumChar");
    }
    return null;
  }

  String? validatePassword({String? message}) {
    if (trim().isEmpty) {
      return message ?? Translate.s.fillField;
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(this)) {
      return message ?? Translate.s.passValidation;
    }
    return null;
  }

  String? validateEmail({String? message}) {
    if (trim().isEmpty) {
      return message ?? Translate.s.fillField;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this)) {
      return message ?? Translate.s.mailValidation;
    }
    return null;
  }

  String? validateEmailORNull({String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this)) {
        return message ?? Translate.s.mailValidation;
      }
    }
    return null;
  }

  String? validatePhone({String? message, bool? isPartner}) {
    if (message == null || message.isEmpty) {
      return tr("lblRequired");
    }
    if (!message.startsWith('5')) {
      return tr("lblShouldStartWith5");
    }
    if (message.length < 9) {
      return tr("lblIncorrectPhone");
    }
    return null;
  }

  String? validatePhoneOrNull({String? message}) {
    if (trim().isEmpty) {
      return null;
    } else if (!RegExp(r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)').hasMatch(this) || length < 10) {
      return message ?? tr("phoneValidation");
    }
    return null;
  }

  String? validatePasswordConfirm({required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("lblRequired");
    } else if (this != pass) {
      return message ?? Translate.s.confirmValidation;
    }
    return null;
  }
}

String? validateDropDown(dynamic model, {String? message}) {
  if (model == null) {
    return message ?? tr("lblRequired");
  }
  return null;
}
