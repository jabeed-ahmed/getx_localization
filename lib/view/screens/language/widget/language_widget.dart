import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization/controller/localization_controller.dart';
import 'package:getx_localization/data/model/response/language_model.dart';
import 'package:getx_localization/util/app_constants.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget(
      {Key? key,
      required this.languageModel,
      required this.localizationController,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
          ],
        ),
        child: Stack(children: [
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                alignment: Alignment.center,
                child:
                    Image.asset(languageModel.imageUrl, width: 36, height: 36),
              ),
              const SizedBox(height: 16),
              Text(languageModel.languageName),
            ]),
          ),
          localizationController.selectedIndex == index
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(Icons.check_circle,
                      color: Theme.of(context).primaryColor, size: 25),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }
}
