import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/views/components/labels.dart';

class EditProfileDropdown extends StatefulWidget {
  const EditProfileDropdown({super.key});

  @override
  State<EditProfileDropdown> createState() => _DropDownItemState();
}

var dropdownvalue;
var items = [
  'My feed 1 ',
  'My feed 2 ',
  'My feed 3',
];

class _DropDownItemState extends State<EditProfileDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AllColors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton(
        isExpanded: true,
        dropdownColor: AllColors.white,
        underline: SizedBox(),
        hint: Label(text: 'MY FEEDS'),
        value: dropdownvalue,
        items: items.map(
          (item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          },
        ).toList(),
        icon: const Icon(Icons.arrow_forward_ios_outlined),
        iconSize: 15,
        onChanged: (newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}
