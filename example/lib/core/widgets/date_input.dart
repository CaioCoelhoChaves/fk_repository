import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    required this.onChanged,
    this.initialDate,
    this.label,
    this.required = false,
    this.focusNode,
    this.maxWidth,
    super.key,
  });

  final String? label;
  final DateTime? initialDate;
  final void Function(DateTime) onChanged;
  final bool required;
  final FocusNode? focusNode;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Text(
              required ? '$label *' : label!,
              style: const TextStyle(fontSize: 18),
            ),
            const Gap.x(5),
          ],
          MouseRegion(
            child: InputDatePickerFormField(
              fieldLabelText: '',
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDate: initialDate,
              focusNode: focusNode,
              onDateSaved: onChanged,
              onDateSubmitted: onChanged,
              acceptEmptyDate: !required,
            ),
          ),
        ],
      ),
    );
  }

}
