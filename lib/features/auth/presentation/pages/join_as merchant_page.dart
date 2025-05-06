import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/presentation/widgets/dropdown_text_field.dart';

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
  final Color? iconColor; // هنا أضفنا لون الأيقونة

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
    this.iconColor, // أضفنا هنا
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
          boxShadow: _hasFocus
              ? [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))]
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
          ),
          validator: (value) => (value?.isEmpty ?? true) ? 'هذا الحقل مطلوب' : null,
        ),
      ),
    );
  }
}

// الصفحة الرئيسية للنموذج مع استدعاء CustomTextField مع ألوان للأيقونات
class FormMarch extends StatelessWidget {
  const FormMarch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نموذج التاجر',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const JoinMerchantPage(),
    );
  }
}

class JoinMerchantPage extends StatelessWidget {
  const JoinMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('join as merchant'),
        ),
        floatingActionButton: const SizedBox.shrink(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اعرض منتجاتك وعروضك على يمن عروض لتعزيز مبيعاتك.',
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              const SizedBox(height: 20),

              CustomTextField(
                placeholder: 'الاسم بالكامل',
                prefixIcon: Icons.person,
                iconColor: Colors.deepPurple,
              ),
              CustomTextField(
                placeholder: 'رقم الجوال',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                iconColor: Colors.green,
              ),
              CustomTextField(
                placeholder: 'اسم المتجر',
                prefixIcon: Icons.business,
                iconColor: Colors.orange,
              ),
              CustomTextField(
                placeholder: 'وصف المتجر',
                prefixIcon: Icons.description,
                iconColor: Colors.blueGrey,
              ),
              DropdownTextField(
                options: ['خيار 1', 'خيار 2', 'خيار 3', 'خيار 4', 'خيار 5'],
                hint: 'اختر الفئة',
              ),
              CustomTextField(
                placeholder: 'رقم المتجر',
                prefixIcon: Icons.store,
                keyboardType: TextInputType.number,
                iconColor: Colors.brown,
              ),
              CustomTextField(
                placeholder: 'رابط موقع المتجر',
                prefixIcon: Icons.web,
                keyboardType: TextInputType.url,
                iconColor: Colors.teal,
              ),
              CustomTextField(
                placeholder: 'رابط موقع الإلكتروني',
                prefixIcon: Icons.language,
                keyboardType: TextInputType.url,
                iconColor: Colors.teal,
              ),
              CustomTextField(
                placeholder: 'رابط صفحة الفيسبوك',
                prefixIcon: Icons.facebook,
                suffixIcon: Icons.link,
                keyboardType: TextInputType.url,
                iconColor: Colors.blue,
              ),
              CustomTextField(
                placeholder: 'رابط صفحة الإنستقرام',
                prefixIcon: Icons.camera_alt,
                suffixIcon: Icons.link,
                keyboardType: TextInputType.url,
                iconColor: Colors.purple,
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    'إرسال',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
