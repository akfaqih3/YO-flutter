import 'package:flutter/material.dart';

class DescrbsionTextField extends StatefulWidget {
  final String placeholder;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle textStyle;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color? iconColor;
  // الإضافات الجديدة:
  final int? maxLength;
  final int maxLines;

  const DescrbsionTextField({
    Key? key,
    required this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFFBDBDBD),
    this.textStyle = const TextStyle(color: Colors.black87),
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.iconColor,
    this.maxLength,           // هنا يمرر الحد الأقصى للحروف
    this.maxLines = 1,        // هنا عدد الأسطر (الافتراضي 1)
  }) : super(key: key);

  @override
  _DescrbsionTextFieldState createState() => _DescrbsionTextFieldState();
}

class _DescrbsionTextFieldState extends State<DescrbsionTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() => setState(() => _hasFocus = _focusNode.hasFocus));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: _hasFocus
              ? [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
              : [],
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          style: widget.textStyle,
          maxLength: widget.maxLength,     // تطبيق الحد الأقصى
          maxLines: widget.maxLines,       // عدد الأسطر
          decoration: InputDecoration(
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: widget.iconColor ?? Colors.black54)
                : null,
            suffixIcon: widget.suffixIcon != null
                ? Icon(widget.suffixIcon, color: widget.iconColor ?? Colors.black54)
                : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: widget.borderColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: widget.borderColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: widget.focusedBorderColor, width: 1),
            ),
            counterText: widget.maxLength != null ? null : '', // إظهار العداد فقط عند وجود maxLength
          ),
          validator: (value) {
            if ((value?.isEmpty ?? true)) {
              return 'هذا الحقل مطلوب';
            }
            if (widget.maxLength != null && value!.length > widget.maxLength!) {
              return 'الحد الأقصى هو ${widget.maxLength} حرفًا';
            }
            return null;
          },
        ),
      ),
    );
  }
}


