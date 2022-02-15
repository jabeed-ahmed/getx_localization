import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization/controller/localization_controller.dart';
import 'package:getx_localization/helper/route_helper.dart';
import 'package:getx_localization/util/app_constants.dart';
import 'package:getx_localization/util/dimensions.dart';
import 'package:getx_localization/util/styles.dart';
import 'package:getx_localization/view/base/custom_button.dart';
import 'package:getx_localization/view/base/custom_snackbar.dart';

import 'widget/language_widget.dart';

class ChooseLanguageScreen extends StatelessWidget {
  final bool fromMenu;
  const ChooseLanguageScreen({Key? key, this.fromMenu = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('language'.tr)),
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return Column(children: [
            Expanded(
                child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: Text('select_language'.tr,
                                  style: robotoMedium),
                            ),
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 1),
                              ),
                              itemCount:
                                  localizationController.languages.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => LanguageWidget(
                                languageModel:
                                    localizationController.languages[index],
                                localizationController: localizationController,
                                index: index,
                              ),
                            ),
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_LARGE),
                          ]),
                    ),
                  ),
                ),
              ),
            )),
            CustomButton(
              buttonText: 'save'.tr,
              margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              buttonAction: () {
                if (localizationController.languages.isNotEmpty &&
                    localizationController.selectedIndex != -1) {
                  localizationController.setLanguage(Locale(
                    AppConstants.languages[localizationController.selectedIndex]
                        .languageCode,
                    AppConstants.languages[localizationController.selectedIndex]
                        .countryCode,
                  ));
                  if (fromMenu) {
                    Navigator.pop(context);
                  } else {
                    Get.offNamed(RouteHelper.home);
                  }
                } else {
                  showCustomSnackBar('select_a_language'.tr);
                }
              },
            ),
          ]);
        }),
      ),
    );
  }
}
