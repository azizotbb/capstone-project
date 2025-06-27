
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    required this.setText,
    this.isOrderRequest = true,
  });

  final String setText;
  final bool? isOrderRequest;
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),color: Colors.white,boxShadow: [BoxShadow(blurRadius: 0.8,offset: Offset(0.2, 0.5),color: const Color.fromARGB(120, 0, 0, 0))]),
      width: context.getWidth(size: 0.8),
      height: context.getHeight(size: 0.14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          Text(setText, style: AppTextStyle.textReguler16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: isOrderRequest == true
                ? [
                    Container(alignment: Alignment.center,
                      width: context.getWidth(size: 0.2),
                      height: context.getHeight(size: 0.044),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff059820),
                      ),
                      child: Text(
                        'accept'.tr(),
                        style: AppTextStyle.textReguler16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),        Container(alignment: Alignment.center,
                      width: context.getWidth(size: 0.2),
                      height: context.getHeight(size: 0.044),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF30404),
                      ),
                      child: Text(
                        'reject'.tr(),
                        style: AppTextStyle.textReguler16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]
                : [        Container(alignment: Alignment.center,
                      width: context.getWidth(size: 0.2),
                      height: context.getHeight(size: 0.044),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Text(
                        'dissmiss'.tr(),
                        style: AppTextStyle.textReguler16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),],
          ),
        ],
      ),
    );
  }
}
