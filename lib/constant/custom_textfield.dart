import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.context,
    this.labelText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.fillColor,
    this.labelStyle,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.autovalidateMode,
    this.focusNode,
    this.inputTextStyle,
    this.obscureText = false,
    this.onEditingComplete,
    this.maxLines,
    this.maxLength,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.focusedBorderSideColor,
    this.autoFocus = false,
    this.inputFormatters,
    this.focusedErrorBorder,
    this.errorBorder,
    this.focusBorder,
    this.prefixText,
    this.prefixTextStyle,
    this.isEnabled = true,
    this.cursorHeight,
    this.cursorColor,
    this.borderRadiusValue,
    this.borderRadius,
    this.hintStyle,
    this.hintText,
    this.showCursor,
    this.contentPadding,
    this.border,
    this.enabledBorder,
    this.autofillHints,
    this.textCapitalization,
  }) : super(key: key);

  final BuildContext context;
  final String? labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final TextStyle? inputTextStyle;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final int? maxLength;
  final Function(String?)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Color? focusedBorderSideColor;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusBorder;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final bool isEnabled;
  final double? cursorHeight;
  final Color? cursorColor;
  final double? borderRadiusValue;
  final double? borderRadius;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? showCursor;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final Iterable<String>? autofillHints;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      showCursor: showCursor,
      enabled: isEnabled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      style: inputTextStyle ?? Theme.of(context).textTheme.bodyText2,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: validator,
      cursorColor: cursorColor ?? Colors.grey,
      cursorHeight: cursorHeight ?? 22,
      cursorRadius: const Radius.circular(10),
      controller: controller,
      autofocus: autoFocus,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: borderColor ?? const Color(0xffC5C5C5),
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? const Color(0xff201D1D),
        filled: true,
        errorBorder: errorBorder,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xffC5C5C5),
              ),
            ),
        focusedBorder: focusBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: BorderSide(
                color: focusedBorderSideColor ?? Colors.green
              ),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: const BorderSide(
                color:Color(0xffC5C5C5),
              ),
            ),
        hintText: hintText,
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
        labelText: labelText,
        prefixText: prefixText,
        prefixStyle: prefixTextStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 30,
                ),
        labelStyle: labelStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
      ),
    );
  }
}
