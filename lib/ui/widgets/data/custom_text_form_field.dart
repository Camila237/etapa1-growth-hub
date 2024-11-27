import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';

/// * Class that represents a custom text form field.
class CustomTextFormField extends StatefulWidget {
  /// * Width of the text form field.
  final double? width;

  /// * Controller of the text form field.
  final TextEditingController controller;

  /// * Hint that will be displayed in the text form field.
  final String? hint;

  /// * Label that will be displayed in the text form field.
  final String? label;

  /// * Function that will validate the input of the text form field.
  final String? Function(String?)? validateInput;

  /// * Type of the text input.
  final TextInputType textInputType;

  /// * Action that will be executed when the text input is completed.
  final TextInputAction textInputAction;

  /// * Autofill hints that will be displayed in the text form field.
  final String autofillHints;

  /// * Maximum number of lines that the text form field can have.
  final int maxLines;

  /// * Boolean that indicates if the text form field is enabled.
  final bool enable;

  /// * Initial value of the text form field.
  final String? initialValue;

  /// * Helper text that will be displayed in the text form field.
  final String? helperText;

  /// * List of input formatters that will be applied to the text form field.
  final List<TextInputFormatter>? inputFormatters;

  /// * Focus node of the text form field.
  final FocusNode? focusNode;

  /// * Function that will be executed when the text form field is changed.
  final void Function(String)? onChanged;

  /// * Function that will be executed when the text form field is completed.
  final void Function()? complete;

  /// * Text capitalization of the text form field.
  final TextCapitalization textCapitalization;

  const CustomTextFormField({
    super.key,
    this.width,
    required this.controller,
    this.hint,
    this.label,
    this.validateInput,
    this.textCapitalization = TextCapitalization.words,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofillHints = AutofillHints.username,
    this.maxLines = 1,
    this.enable = true,
    this.initialValue,
    this.helperText,
    this.inputFormatters,
    this.focusNode,
    this.complete,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kBlack),
              key: widget.key,
              textCapitalization: widget.textCapitalization,
              initialValue: widget.initialValue,
              enabled: widget.enable,
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              maxLines: widget.maxLines,
              validator: widget.validateInput,
              autofillHints: [widget.autofillHints],
              inputFormatters: widget.inputFormatters,
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              decoration: InputDecoration(
                helperText: widget.helperText,
                labelText: widget.hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSize10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}