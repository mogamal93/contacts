import 'dart:io';
import 'package:contact/model/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../theme/AppColors.dart';

class Fieldofadd extends StatefulWidget {
  const Fieldofadd({super.key});

  @override
  State<Fieldofadd> createState() => _FieldofaddState();
}

class _FieldofaddState extends State<Fieldofadd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? profileImagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        profileImagePath = picked.path;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isKeyboardOpen)
                Lottie.asset(
                  'assets/lottie/empty_list.json',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),

              Row(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gold),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: profileImagePath == null
                            ? Lottie.asset(
                          'assets/lottie/image_picker.json',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        )
                            : Image.file(
                          File(profileImagePath!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(nameController.text.isEmpty
                            ? 'User Name'
                            : nameController.text),
                        const Divider(color: AppColors.gold, thickness: 3),
                        Text(emailController.text.isEmpty
                            ? 'example@email.com'
                            : emailController.text),
                        const Divider(color: AppColors.gold, thickness: 3),
                        Text(phoneController.text.isEmpty
                            ? '+200000000000'
                            : phoneController.text),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: nameController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(hintText: "Enter User Name"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(hintText: "Enter User Email"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(hintText: "Enter User Phone"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final newContact = ContacDetails(
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                    profileImagePath ?? '',
                  );
                  Navigator.pop(context, newContact);
                },
                child: const Text("Enter User"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}