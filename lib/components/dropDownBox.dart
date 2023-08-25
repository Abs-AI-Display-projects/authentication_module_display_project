import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Item {
  const Item(this.keyWord, this.name, this.icon);
  final String name;
  final Icon icon;
  final String keyWord;
}

class DropdownBox extends StatefulWidget {
  String? titleImageUrl;
  final String title;
  String _nameController = "";
  String _keywordController = "";
  final List<Item> options;
  double height;

  DropdownBox({
    Key? key,
    this.titleImageUrl,
    required this.title,
    required this.options,
    this.height = 60,
  }) : super(key: key);

  @override
  _DropdownBoxState createState() => _DropdownBoxState();

  void setNameController(String selection) {
    _nameController = selection;
  }

  void setKeywordController(String keyword){
    _keywordController = keyword;
  }

  String controllerNameGetter() => _nameController;
  String controllerKeyWordGetter() => _keywordController;
}

class _DropdownBoxState extends State<DropdownBox> {
  Item? selection;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        height: widget.height.h,
        decoration: ShapeDecoration(
          color: lightGreyButtons,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(30).w),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20).r,
          child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
            Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(widget.titleImageUrl.toString()),
                      fit: BoxFit.fitWidth,
                    ))),
            DropdownButton<Item>(
              underline:const SizedBox.shrink(),
              alignment: AlignmentDirectional.centerEnd,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 25.w,
              itemHeight: 55.h,
              iconEnabledColor: purplePrimaryColor,
              hint: Text(
                widget.title,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: darkGreen,
                    fontWeight: subFontWeight),
              ),
              value: selection,
              onChanged: (Item? value) {
                setState(() {
                  selection = value;
                  widget.setNameController((value?.name)!);
                  widget.setKeywordController((value?.keyWord)!);
                });
              },
              items: widget.options.map((Item option) {
                return DropdownMenuItem<Item>(
                  value: option,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      option.icon,
                      Padding(
                        padding: const EdgeInsets.only(right: 20).r,
                        child: Text(
                          option.name,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: darkGreen,
                              fontSize: subFontSize.sp,
                              fontWeight: subFontWeight),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
        ));
  }
}
