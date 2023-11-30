import 'package:flutter/material.dart';
import 'package:panara_dialogs/src/constants/colors.dart';
import 'package:panara_dialogs/src/constants/panara_dialog_type.dart';
import 'package:panara_dialogs/src/widgets/panara_button.dart';

///
/// PanaraConfirmDialogWidget, you can use it separatly if you want.
///
class PanaraConfirmDialogWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? imagePath;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onTapConfirm;
  final VoidCallback onTapCancel;
  final PanaraDialogType panaraDialogType;
  final Color? color;
  final Color? textColor;
  final Color? buttonTextColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  /// If you don't want any icon or image, you toggle it to true.
  final bool noImage;

  const PanaraConfirmDialogWidget({
    Key? key,
    this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onTapConfirm,
    required this.onTapCancel,
    required this.panaraDialogType,
    this.color,
    this.textColor = const Color(0xFF707070),
    this.buttonTextColor = Colors.white,
    this.imagePath,
    this.padding = const EdgeInsets.all(24),
    this.margin = const EdgeInsets.all(24),
    required this.noImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 340,
          ),
          margin: margin ?? const EdgeInsets.all(24),
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!noImage)
                Image.asset(
                  imagePath ?? 'assets/confirm.png',
                  package: imagePath != null ? null : 'panara_dialogs',
                  width: 40,
                  height: 40,
                  color: imagePath != null
                      ? null
                      : (panaraDialogType == PanaraDialogType.normal
                      ? PanaraColors.normal
                      : panaraDialogType == PanaraDialogType.success
                      ? PanaraColors.success
                      : panaraDialogType == PanaraDialogType.warning
                      ? PanaraColors.warning
                      : panaraDialogType == PanaraDialogType.error
                      ? PanaraColors.error
                      : color),
                ),
              if (!noImage)
                const SizedBox(
                  height: 24,
                ),
              if (title != null)
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null)
                const SizedBox(
                  height: 5,
                ),
              Text(
                message,
                style: TextStyle(
                  color: textColor,
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      onTap: onTapCancel,
                      text: cancelButtonText,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? PanaraColors.normal
                          : panaraDialogType == PanaraDialogType.success
                          ? PanaraColors.success
                          : panaraDialogType == PanaraDialogType.warning
                          ? PanaraColors.warning
                          : panaraDialogType == PanaraDialogType.error
                          ? PanaraColors.error
                          : color ?? const Color(0xFF179DFF),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      buttonTextColor: buttonTextColor ?? Colors.white,
                      onTap: onTapConfirm,
                      text: confirmButtonText,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? PanaraColors.normal
                          : panaraDialogType == PanaraDialogType.success
                          ? PanaraColors.success
                          : panaraDialogType == PanaraDialogType.warning
                          ? PanaraColors.warning
                          : panaraDialogType == PanaraDialogType.error
                          ? PanaraColors.error
                          : color ?? const Color(0xFF179DFF),
                      isOutlined: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
