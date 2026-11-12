import 'dart:io';
import 'package:contact/model/contact_details.dart';
import 'package:contact/theme/AppColors.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final ContacDetails contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              contact.profileImage.isEmpty
                  ? Image.asset(
                "assets/images/logo.png",
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              )
                  : Image.file(
                File(contact.profileImage),
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    contact.name,
                    style: const TextStyle(color: AppColors.gold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Icons.email, size: 16),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        contact.email,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        contact.phone,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete, size: 16),
                      SizedBox(width: 5),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}