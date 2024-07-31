// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../Controllers/text_field_controller.dart';

// class ValidatedTextField extends StatefulWidget {
//   final String labelText;
//   final String hintText;
//   final String? errorText;
//   final TextInputType? keyboardType;
//   final int? maxLength;
//   final bool isRequired;
//   final bool isEmailField;
//   final bool isPhoneField;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onSubmit;

//   const ValidatedTextField({
//     super.key,
//     required this.labelText,
//     required this.hintText,
//     this.errorText,
//     this.keyboardType,
//     this.maxLength,
//     this.isRequired = false,
//     this.isEmailField = false,
//     this.isPhoneField = false,
//     this.onChanged,
//     this.onSubmit,
//   });

//   @override
//   _ValidatedTextFieldState createState() => _ValidatedTextFieldState();
// }

// class _ValidatedTextFieldState extends State<ValidatedTextField> {
//   final _textFieldController = TextEditingController();
//   final _controller = Get.put(TextFieldController());

//   @override
//   void initState() {
//     super.initState();
//     _textFieldController.addListener(() {
//       _controller.text = _textFieldController.text;
//     });
//   }

//   @override
//   void dispose() {
//     _textFieldController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             controller: _textFieldController,
//             onChanged: (value) {
//               _controller.text = value;
//               _controller.validateAndSubmit();
//               if (widget.onChanged != null) {
//                 widget.onChanged!(value);
//               }
//             },
//             onTap: () {
//               _controller.validateAndSubmit();
//             },
//             onSubmitted: (_) {
//               _controller.validateAndSubmit();
//               if (widget.onSubmit != null) {
//                 widget.onSubmit!();
//               }
//             },
//             keyboardType: widget.keyboardType,
//             maxLength: widget.maxLength,
//             decoration: InputDecoration(
//               labelText: widget.labelText,
//               hintText: widget.hintText,
//               errorText: _controller.isError ? widget.errorText : null,
//               suffixIcon: _controller.text.isNotEmpty
//                   ? IconButton(
//                       icon: const Icon(Icons.clear),
//                       onPressed: () {
//                         _textFieldController.clear();
//                         _controller.clearText();
//                       },
//                     )
//                   : (_controller.isError
//                       ? const Icon(Icons.error, color: Colors.red)
//                       : null),
//             ),
//           ),
//           if (_controller.isError)
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 _controller.errorText ?? '',
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
