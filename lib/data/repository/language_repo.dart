import 'package:flutter/material.dart';
import 'package:getx_localization/data/model/response/language_model.dart';
import 'package:getx_localization/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({required BuildContext context}) {
    return AppConstants.languages;
  }
}
