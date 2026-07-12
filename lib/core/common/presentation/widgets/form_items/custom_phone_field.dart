import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemen_offers/core/common/presentation/widgets/form_items/custom_text_field.dart';

/// تكست فيلد خاااااااص بالرقم الجوال

class CustomPhoneField extends StatefulWidget {
  final String placeholder;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle textStyle;
  final Color? iconColor;
  final TextEditingController? controller;

  const CustomPhoneField({
    Key? key,
    this.placeholder = 'رقم الهاتف',
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFFBDBDBD),
    this.textStyle = const TextStyle(color: Colors.black87),
    this.iconColor,
    this.controller,
  }) : super(key: key);

  @override
  _CustomPhoneFieldState createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  String? _errorText;

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

  String? _validate(String value) {
    if (value.isEmpty) return 'هذا الحقل مطلوب';
    if (value.length != 9) return 'يجب أن يتكون رقم الهاتف من 9 أرقام';
    if (!RegExp(r'^(77|78|73|70|71|01)\d{7}$').hasMatch(value))
      return 'يُسمح بالأرقام فقط';
    return null;
  }

  void _onChanged(String value) {
    setState(() => _errorText = _validate(value));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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
          keyboardType: TextInputType.number,
          style: widget.textStyle,
          maxLength: 9,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9),
          ],
          decoration: InputDecoration(
            counterText: '',
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon: Icon(
              Icons.phone,
              color: widget.iconColor ?? widget.textStyle.color,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            errorText: _errorText,
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
          onChanged: _onChanged,
          onEditingComplete: () {
            setState(
              () => _errorText = _validate(widget.controller?.text ?? ''),
            );
          },
        ),
      ),
    );
  }
}
