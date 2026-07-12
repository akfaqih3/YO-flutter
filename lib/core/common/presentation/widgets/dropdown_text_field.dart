import 'package:flutter/material.dart';
import 'package:yemen_offers/core/common/presentation/widgets/custom_text_field.dart';

/////////////////////////////////////////////////
// DropdownTextField using CustomTextField styling
class DropdownTextField extends StatefulWidget {
  final List<String> options;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  const DropdownTextField({
    Key? key,
    required this.options,
    this.hint = 'اختر من القائمة',
    this.prefixIcon,
    this.suffixIcon = Icons.arrow_drop_down,
    this.controller,
  }) : super(key: key);

  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  void _showOptions() {
    showModalBottomSheet(
      context: context,
      isDismissible: false, // منع الإغلاق بدون اختيار
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder:
          (_) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // مؤشر السحب
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // عنوان القائمة
                  const Text(
                    'اختر خيارًا',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.options.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              widget.options[index],
                              textAlign: TextAlign.right,
                            ),
                            onTap: () {
                              _controller.text = widget.options[index];
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOptions,
      child: AbsorbPointer(
        child: CustomTextField(
          placeholder: widget.hint, // نجمة للتأكيد على الاختيار
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          controller: _controller,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
