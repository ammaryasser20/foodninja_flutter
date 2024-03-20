import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/main.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({
    super.key,
    required this.hintText,
    required this.wight,
    required this.hight,
    required this.fillColor,
    required this.cursorColor,
    this.controller,
    this.readOnly = false,
    this.prefix,
    this.onTab,
    this.onFieldSubmitted,
  });
  final String hintText;
  final String? prefix;
  final double wight;
  final double hight;
  final void Function()? onTab;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Color fillColor;
  final Color cursorColor;
  final TextEditingController? controller;
  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.wight,
      height: widget.hight,
      child: TextFormField(
        cursorColor: widget.cursorColor,
        onTap: widget.onTab,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(widget.hight / 2),
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: isItDark()
                  ? ColorManager.white.withOpacity(.4)
                  : ColorManager.orangeLight.withOpacity(.4)),
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: true,
          prefixIcon: widget.prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: SvgPicture.asset(
                    widget.prefix!,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: widget.fillColor.withOpacity(0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: widget.fillColor,
            ),
          ),
        ),
      ),
    );
  }
}
