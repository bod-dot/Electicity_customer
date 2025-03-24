import 'package:flutter/material.dart';

import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import 'my_text_out.dart';

class Mydropdown extends StatefulWidget {
  final TextEditingController fromdate;
  final TextEditingController todate;
  final Function(String) onValueChanged;
  final Function() onResultAllDataChanged;

  const Mydropdown({
    super.key,
    required this.fromdate,
    required this.todate,
    required this.onValueChanged,
    required this.onResultAllDataChanged,
  });

  @override
  State<Mydropdown> createState() => _MydropdownState();
}

class _MydropdownState extends State<Mydropdown> {
  Screensize screen = Screensize();
  List<String> lItem = ['القراءات', 'المدفوعات', 'الكل'];
  String selectedValue = 'القراءات';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       const MytextLable(
          value: "عرض التقارير حسب",
          color: kColorPrimer,
        ),
        const SizedBox(width: 15),

        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:const BorderSide(color: kColorPrimer, width: 2),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            value: selectedValue,
            icon:const Icon(Icons.arrow_drop_down, color: kColorPrimer),
            style: TextStyle(
              fontSize: screen.sizeScreen(context, 0.018, 0.03),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            items: lItem.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  if (selectedValue != newValue) {
                    widget.fromdate.text = "";
                    widget.todate.text = "";
                    widget.onResultAllDataChanged();
                    selectedValue = newValue;
                    widget.onValueChanged(selectedValue);
                  }
                });
              }
            },
          ),
        ),
      ],
    );
  }
}


