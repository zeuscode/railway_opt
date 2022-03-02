import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NFListTile extends StatelessWidget {
  final double? height;
  final EdgeInsets? padding;
  final Widget? leading;
  final String title;
  final TextStyle? textStyle;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  final bool? showBottomDivider;
  final BoxBorder? border;

  const NFListTile(
      {Key? key,
      required this.title,
      this.height = 52,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      this.textStyle = const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14.0,
      ),
      this.onTap,
      this.leading,
      this.border,
      this.trailing,
      this.showBottomDivider = true})
      : super(key: key); // const MyListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: border != null
                ? BorderRadius.all(const Radius.circular(6.0))
                : null,
            border: border ??
                ((showBottomDivider == true)
                    ? const Border(
                        bottom: BorderSide(color: Colors.black26, width: 0.5))
                    : null)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: leading,
                  )
                : const SizedBox(),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            trailing != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: trailing,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
