// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///author: lty
////Time: 2023/01/14
////Description:
class PWEditField extends StatefulWidget {
  ///所有密码框输入完成后监听 Listen after all password boxes are entered
  ///
  final ValueChanged<String>? onInputDone;

  final ValueChanged<String>? onChanged;

  ///密码框数量 Number of password boxes
  ///
  final int? textFieldCount;

  ///密码框宽度 Password box width
  ///
  final double textFieldWidth;

  ///密码框高度 Password box height
  ///
  final double textFieldHeight;

  ///密码框之间的间距 Space between password boxes
  ///
  final double textFieldSpace;

  ///以下是TextField 原有属性 Following are the original TextField properties
  ///
  final bool autoFocus;
  final bool obscureText;
  final bool isDoneClean;
  final TextStyle textStyle;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  BoxDecoration? focusDecoration;
  BoxDecoration? unFocusDecoration;
  TextEditingController? controller;

  /// 只能输入数字 Only numbers can be entered
  /// inputFormatters = [WhitelistingTextInputFormatter(RegExp("[0-9]")),]
  PWEditField({
    @required this.textFieldCount,
    this.textFieldWidth = 30,
    this.textFieldHeight = 30,
    this.textFieldSpace = 3,
    this.autoFocus = false,
    this.obscureText = true,
    this.isDoneClean = false,
    this.textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.focusDecoration,
    this.unFocusDecoration,
    this.onInputDone,
    this.onChanged,
    this.controller,
    Key? key,
  }) : super(
          key: key,
        ) {
    controller ??= TextEditingController();
    focusDecoration ??= const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.color_a679e0,
    );
    unFocusDecoration ??= const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.color_485162,
    );
  }

  @override
  State<StatefulWidget> createState() {
    return PWEditFieldState();
  }
}

class PWEditFieldState extends State<PWEditField> {
  final FocusNode _focusNode = FocusNode();
  int _currentIndex = -1;

  @override
  void initState() {
    super.initState();
    // _currentIndex = widget.autoFocus ? 0 : -1;
    _focusNode.addListener(() {
      // if (!_focusNode.hasFocus) {
      //   _currentIndex = -1;
      //   setState(() {});
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = widget.textFieldCount! * widget.textFieldWidth + widget.textFieldCount! * widget.textFieldSpace * 2;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            getTextField(),
            SizedBox(
              width: w,
              height: widget.textFieldHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getChildren(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> list = [];
    for (int i = 0; i < widget.textFieldCount!; i++) {
      list.add(getChild(i));
    }
    return list;
  }

  Widget getChild(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.textFieldSpace),
      child: Container(
        decoration: _currentIndex > index ? widget.focusDecoration : widget.unFocusDecoration,
        width: widget.textFieldWidth,
        height: widget.textFieldHeight,
        child: Center(
          child: getTextWidget(index),
        ),
      ),
    );
  }

  Widget getTextWidget(int index) {
    String data = "";
    String? text = widget.controller?.text;
    if (text != null && text.length > index) {
      data = widget.obscureText ? "" : text.substring(index, index + 1);
    }
    return Text(
      data,
      maxLines: 1,
      style: widget.textStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget getTextField() {
    return SizedBox(
      width: 0,
      height: 0,
      child: TextField(
        enableInteractiveSelection: false,
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        controller: widget.controller,
        maxLength: widget.textFieldCount,
        maxLines: 1,
        obscureText: widget.obscureText,
        style: widget.textStyle,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
          contentPadding: EdgeInsets.only(
            top: 0,
            bottom: 0,
            left: 2,
          ),
        ),
        textAlign: TextAlign.center,
        onChanged: (String text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
          _currentIndex = text.length;
          setState(() {});
          // if (widget.onInputDone != null && text.length == widget.textFieldCount) {
          //   widget.onInputDone!(widget.controller!.text);
          //   _focusNode.unfocus();
          //   if (widget.isDoneClean) {
          //     widget.controller!.text = "";
          //   }
          // }
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
