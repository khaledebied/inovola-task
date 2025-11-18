import 'package:flutter/material.dart';
import 'package:expense_tracker/core/localization/translate.dart';
import 'package:expense_tracker/core/widgets/base_form_option/base_form_option.dart';
import 'package:expense_tracker/core/widgets/base_form_option/options_requester/base_options_display_widget.dart';
import 'package:expense_tracker/core/widgets/base_form_option/options_requester/local_options_requester.dart';
import 'package:expense_tracker/core/widgets/base_form_option/options_requester/option_matchers/string_option_matcher.dart';
import 'package:expense_tracker/features/auth/domain/entity/user_domain_model.dart';

class OptionFieldExample extends StatefulWidget {
  const OptionFieldExample({super.key});

  @override
  State<OptionFieldExample> createState() => _OptionFieldExampleState();
}

class _OptionFieldExampleState extends State<OptionFieldExample> {
  List<UserDomainModel> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return BaseFormOption<UserDomainModel, String>(
      hintText: Translate.of(context).failureActions,
      bottomSheetTitle: Translate.of(context).failureActions,
      showSearch: false,
      isMultiple: false,
      showDecoration: true,
      optionsRequester: LocalOptionsRequester(
        options: _getOptions(),
        optionMatcher: StringOptionMatcher(stringGetter: (option) => option.id.toString()),
      ),
      selectedItems: selectedUsers,
      selectedOptionBuilder: (actions) {
        return BaseOptionsDisplayWidget<UserDomainModel>(
          titleGetter: (value) => value.name,
          selectedOptions: actions,
        );
      },
      valueIdGetter: (value) => value?.id.toString(),
      valueMainTitleGetter: (value) => value?.name,
      onSaveValue: (actions, iMultiple) {
        setState(() {
          selectedUsers = actions ?? [];
        });
      },
      onClearPressed: () {
        setState(() {
          selectedUsers = [];
        });
      },
    );
  }

  List<UserDomainModel> _getOptions() => [
        UserDomainModel(
            email: "",
            name: "",
            id: 1,
            phone: "",
            lang: '',
            gender: '',
            promoCode: '',
            birthDate: '',
            avatar: '',
            cityName: '',
            cityId: null,
            status: '',
            token: '',
            vip: null,
            completeRegistration: '',
            inviteFriendBonusMessage: '',
            inviteFriendBonusAmount: ''),
        UserDomainModel(
            email: "",
            name: "",
            id: 2,
            phone: "",
            lang: '',
            gender: '',
            promoCode: '',
            birthDate: '',
            avatar: '',
            cityName: '',
            cityId: null,
            status: '',
            token: '',
            vip: null,
            completeRegistration: '',
            inviteFriendBonusMessage: '',
            inviteFriendBonusAmount: ''),
      ];
}
