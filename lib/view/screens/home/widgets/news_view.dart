import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_localization/view/base/custom_label.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLabel(
            title: 'news_title'.tr,
            maxLines: 2,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomLabel(
            title: 'news_sub_title'.tr,
            maxLines: 2,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomLabel(
            title: 'para_one'.tr,
            fontSize: 14,
            maxLines: null,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
