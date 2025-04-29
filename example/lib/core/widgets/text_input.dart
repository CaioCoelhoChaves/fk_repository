import 'package:example/core/validators/validators.dart';
import 'package:fk_booster/fk_booster.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    required this.onChanged,
    this.initialValue,
    this.label,
    this.suffixIcon,
    this.obscureText = false,
    this.required = false,
    this.focusNode,
    this.onHoverChanged,
    this.validators,
    this.maxWidth,
    super.key,
  });

  final String? label;
  final String? initialValue;
  final void Function(String) onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool required;
  final FocusNode? focusNode;
  final void Function(bool)? onHoverChanged;
  final List<FormFieldValidator<String>>? validators;
  final double? maxWidth;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late final FocusNode focusNode;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    _initHasFocusListener();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.required ? '${widget.label} *' : widget.label!,
              style: const TextStyle(fontSize: 18),
            ),
            const Gap.x(5),
          ],
          MouseRegion(
            onEnter:
                widget.onHoverChanged != null
                    ? (e) => widget.onHoverChanged!(true)
                    : null,
            onExit:
                widget.onHoverChanged != null
                    ? (e) => widget.onHoverChanged!(false)
                    : null,
            child: TextFormField(
              initialValue: widget.initialValue,
              focusNode: focusNode,
              onFieldSubmitted: widget.onChanged,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: hasFocus ? 'Type here' : '',
              ),
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              validator: _validator(context),
            ),
          ),
        ],
      ),
    );
  }

  String? Function(String?)? _validator(BuildContext context) {
    if (!widget.required && widget.validators == null) return null;
    return (String? value) {
      return _validate([Validators.required], value);
    };
  }

  String? _validate(
    List<FormFieldValidator<String>> validators,
    String? value,
  ) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  }

  void _initHasFocusListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.addListener(() {
        setState(() {
          hasFocus = focusNode.hasFocus;
        });
      });
    });
  }
}
