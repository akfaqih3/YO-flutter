// تكست فيلد خاااااص بالروابط العتواصل الاجتماعي
import 'package:flutter/material.dart';

enum SocialPlatform { facebook, instagram, snapchat }

class SocialUrlTextField extends StatefulWidget {
  final String placeholder;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle textStyle;
  final TextEditingController? controller;
  final Color? iconColor;
  final AutovalidateMode autovalidateMode;

  // إضافة وسيط لتحديد المنصة
  final SocialPlatform platform;

  const SocialUrlTextField({
    Key? key,
    required this.platform,
    this.placeholder = '',
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFFBDBDBD),
    this.textStyle = const TextStyle(color: Colors.black87),
    this.controller,
    this.iconColor,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  _SocialUrlTextFieldState createState() => _SocialUrlTextFieldState();
}

class _SocialUrlTextFieldState extends State<SocialUrlTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode =
        FocusNode()..addListener(() {
          setState(() => _hasFocus = _focusNode.hasFocus);
        });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    late RegExp pattern;
    switch (widget.platform) {
      case SocialPlatform.facebook:
        pattern = RegExp(r'^(https?:\/\/)?(www\.)?facebook\.com\/.+');
        break;
      case SocialPlatform.instagram:
        pattern = RegExp(r'^(https?:\/\/)?(www\.)?instagram\.com\/.+');
        break;
      case SocialPlatform.snapchat:
        pattern = RegExp(r'^(https?:\/\/)?(www\.)?snapchat\.com\/.+');
        break;
    }
    if (!pattern.hasMatch(value)) {
      return 'يرجى إدخال الرابط بشكل صحيح لـ \ ${widget.platform.name}';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // إذا لم يحدد المستخدم placeholder نضع افتراضي بناءً على المنصة
    final placeholder =
        widget.placeholder.isNotEmpty
            ? widget.placeholder
            : 'رابط ' + widget.platform.name;

    // اختيار أيقونة افتراضية حسب المنصة إن لم يُمرر prefixIcon
    final defaultIcon =
        {
          SocialPlatform.facebook: Icons.facebook,
          SocialPlatform.instagram: Icons.camera_alt,
          SocialPlatform.snapchat: Icons.snapchat_sharp,
        }[widget.platform]!;

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
          keyboardType: TextInputType.url,
          autovalidateMode: widget.autovalidateMode,
          style: widget.textStyle,
          decoration: InputDecoration(
            labelText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon: Icon(
              widget.prefixIcon ?? defaultIcon,
              color: widget.iconColor ?? Colors.black54,
            ),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
          ),
          validator: _validateUrl,
        ),
      ),
    );
  }
}
