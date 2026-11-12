import 'package:contact/model/contact_details.dart';
import 'package:contact/widgets/FieldOfAdd.dart';
import 'package:contact/widgets/contact_card.dart';
import 'package:contact/widgets/smallBtn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/AppColors.dart';

class AnimationWidget extends StatelessWidget {
  final List<ContacDetails> contactsList;
  final void Function(ContacDetails) onContactAdded;
  final void Function(int) onContactDeleted;

  const AnimationWidget({
    super.key,
    required this.contactsList,
    required this.onContactAdded,
    required this.onContactDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contactsList.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/empty_list.json',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              "There is No Contacts Added Here",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: contactsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          return ContactCard(
            contact: contactsList[index],
            onDelete: () => onContactDeleted(index),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         if(!contactsList.isEmpty)
          Smallbtn(
            colorBack: AppColors.red,
            colorIcon: AppColors.white,
            icon: Icons.delete,
            onPressed: () {
              if (contactsList.isNotEmpty) {
                onContactDeleted(contactsList.length - 1);
              }
            },
          ),
          const SizedBox(height: 10),
          Smallbtn(
            colorBack: AppColors.gold,
            colorIcon: AppColors.darkBlue,
            icon: Icons.add,
            onPressed: () async {
              final result = await showModalBottomSheet<ContacDetails>(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.darkBlue,
                builder: (context) => const Fieldofadd(),
              );
              if (result != null) {
                onContactAdded(result);
              }
            },
          ),
        ],
      ),
    );
  }
}