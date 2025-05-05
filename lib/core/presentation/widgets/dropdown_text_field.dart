import 'package:flutter/material.dart';
import 'package:yemen_offers/core/presentation/widgets/custom_text_field.dart';

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
      builder: (_) => GestureDetector(
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
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(widget.options[index], textAlign: TextAlign.right),
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
          placeholder: widget.hint + ' *', // نجمة للتأكيد على الاختيار
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          controller: _controller,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}



///////////////////////////////////////////
/////////////////////////////////////////


// class ImagePickerField extends StatefulWidget {
//   final String label;
//   final IconData icon;
//   final Color iconColor;
//
//   const ImagePickerField({
//     super.key,
//     required this.label,
//     required this.icon,
//     this.iconColor = Colors.blueGrey,
//   });
//
//   @override
//   State<ImagePickerField> createState() => _ImagePickerFieldState();
// }
//
// class _ImagePickerFieldState extends State<ImagePickerField> {
//   File? _image;
//
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _showPickerDialog() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext ctx) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('اختيار من المعرض'),
//                 onTap: () {
//                   _pickImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('التقاط بالكاميرا'),
//                 onTap: () {
//                   _pickImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: GestureDetector(
//         onTap: _showPickerDialog,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(50),
//             border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
//             boxShadow: [
//               if (_image != null) BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
//             ],
//           ),
//           child: Row(
//             children: [
//               Icon(widget.icon, color: widget.iconColor),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   _image != null ? 'تم اختيار صورة' : widget.label,
//                   style: const TextStyle(color: Colors.black87, fontSize: 16),
//                 ),
//               ),
//               if (_image != null)
//                 const Icon(Icons.check_circle, color: Colors.green),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
