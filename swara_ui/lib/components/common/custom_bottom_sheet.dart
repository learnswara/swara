import 'package:flutter/material.dart';
import 'custom_bottom_sheet.css.dart';
import 'custom_snackbar.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<BottomSheetOption<T>> options,
    double borderRadius = CustomBottomSheetCSS.borderRadius,
    Color backgroundColor = CustomBottomSheetCSS.backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: CustomBottomSheetCSS.sheetBorderRadius,
      ),
      builder: (context) {
        return Container(
          padding: CustomBottomSheetCSS.contentPadding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: CustomBottomSheetCSS.sheetBorderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with close button
              Padding(
                padding: CustomBottomSheetCSS.headerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: CustomBottomSheetCSS.titleStyle,
                      semanticsLabel: '$title Header',
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: CustomBottomSheetCSS.iconColor),
                    ),
                  ],
                ),
              ),
              CustomBottomSheetCSS.verticalSpacing,
              
              // Options
              ...options.map((option) => InkWell(
                onTap: () {
                  try {
                    Navigator.pop(context, option.value);
                  } catch (e) {
                    CustomSnackbar.show(
                      context: context,
                      message: 'Error selecting option.',
                    );
                  }
                },
                child: Padding(
                  padding: CustomBottomSheetCSS.optionPadding,
                  child: Row(
                    children: [
                      Icon(
                        option.icon, 
                        size: CustomBottomSheetCSS.iconSize, 
                        color: CustomBottomSheetCSS.iconColor
                      ),
                      SizedBox(width: CustomBottomSheetCSS.iconTextSpacing),
                      Text(
                        option.label,
                        style: CustomBottomSheetCSS.optionLabelStyle,
                        semanticsLabel: '${option.label} Option',
                      ),
                    ],
                  ),
                ),
              )),
              
              CustomBottomSheetCSS.verticalSpacing,
              
              // Bottom indicator
              Center(
                child: Container(
                  height: CustomBottomSheetCSS.indicatorHeight,
                  width: CustomBottomSheetCSS.indicatorWidth,
                  decoration: CustomBottomSheetCSS.indicatorDecoration,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetOption<T> {
  final String label;
  final IconData icon;
  final T value;

  BottomSheetOption({
    required this.label,
    required this.icon,
    required this.value,
  });
} 