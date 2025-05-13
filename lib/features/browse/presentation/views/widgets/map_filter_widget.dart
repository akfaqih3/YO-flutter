import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class MapFilterWidget extends StatelessWidget {
  final String buttonLabel;
  final IconData buttonIcon;
  final controller;
  const MapFilterWidget({
    Key? key,
    this.buttonLabel = 'تأكيد',
    this.buttonIcon = Icons.send,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() {
          return Row(
            children: [
              Expanded(
                child: Slider(
                  activeColor: AppColors.primary,
                  min: 0.5,
                  max: 50,
                  divisions: 99,
                  value: controller.radius.value,
                  label: controller.radius.value.toStringAsFixed(1) + ' kg',
                  onChanged: (value) {
                    // controller.radius.value = value;
                  },
                  onChangeEnd: (value) {
                    controller.radius.value = value;
                    controller.getStores();
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                controller.radius.value.toStringAsFixed(1) + ' km',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
