import 'package:flutter/material.dart';

////////////////////////////////////////
// import 'package:flutter/material.dart';
//هذا الودجيت الرئيسي والاساسي للtextfeild

// تحسين CustomTextField مع إضافة خاصية لون الأيقونة
class CustomTextField extends StatefulWidget {
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
  final String? Function(String?)? validator;

  const CustomTextField({
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
    this.validator, // أضفنا هنا
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() => _hasFocus = _focusNode.hasFocus);
    });
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
          boxShadow:
              _hasFocus
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
          decoration: InputDecoration(
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon:
                widget.prefixIcon != null
                    ? Icon(
                      widget.prefixIcon,
                      color: widget.iconColor ?? Colors.black54,
                    )
                    : null,
            suffixIcon:
                widget.suffixIcon != null
                    ? Icon(
                      widget.suffixIcon,
                      color: widget.iconColor ?? Colors.black54,
                    )
                    : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
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
              borderSide: BorderSide(
                color: widget.focusedBorderColor,
                width: 1,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
