import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildDatePikerField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData? prefixIcon;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle textStyle;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;
  final Color? iconColor;

  const BuildDatePikerField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.prefixIcon,
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFFBDBDBD),
    this.textStyle = const TextStyle(color: Colors.black87),
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.validator,
    this.iconColor,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      final String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            style: textStyle,
            validator: validator,
            decoration: InputDecoration(
              labelText: placeholder,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: fillColor,
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: iconColor ?? Colors.black54,
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
