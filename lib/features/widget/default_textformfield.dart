import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/main.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';

class DefaultTextFormFiled extends StatefulWidget {
  const DefaultTextFormFiled({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.isItForPassword = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputType,
    this.maxLength,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final String? prefix;
  final bool isItForPassword;
  final Function(String v)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final int? maxLength;
  final Function(String)? onChanged;
  @override
  State<DefaultTextFormFiled> createState() => _DefaultTextFormFiledState();
}

class _DefaultTextFormFiledState extends State<DefaultTextFormFiled> {
  bool visible = false;

  _changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      textDirection: TextDirection.ltr,
      obscureText: widget.isItForPassword ? !visible : false,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: isItDark() ? ColorManager.liteGray : ColorManager.white,
        filled: true,
        suffixIcon: widget.isItForPassword
            ? visible
                ? IconButton(
                    onPressed: _changeVisibility,
                    icon: const Icon(Icons.visibility))
                : IconButton(
                    onPressed: _changeVisibility,
                    icon: const Icon(Icons.visibility_off))
            : null,
        prefixIcon: widget.prefix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: SvgPicture.asset(
                  widget.prefix!,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: isItDark()
                ? ColorManager.white.withOpacity(.5)
                : ColorManager.liteGray.withOpacity(.5),
            fontFamily: FontFamilies.bentonSansRegular),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isItDark() ? ColorManager.liteGray : ColorManager.lowWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorManager.primaryColor),
        ),
      ),
    );
  }
}
