import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:getx_localization/controller/localization_controller.dart';
import 'package:getx_localization/data/model/response/language_model.dart';
import 'package:getx_localization/data/repository/language_repo.dart';
import 'package:getx_localization/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Repository
  Get.lazyPut(() => LanguageRepo());

  // Controller
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = {};
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
