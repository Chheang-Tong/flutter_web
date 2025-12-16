import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/core/res/responsive.dart';

class OrderActionButton extends StatefulWidget {
  final String label;
  final int index;
  final int selectedValue;
  final ValueChanged<int> onChanged;
  const OrderActionButton({
    super.key,
    required this.label,
    required this.index,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<OrderActionButton> createState() => _OrderActionButtonState();
}

class _OrderActionButtonState extends State<OrderActionButton> {
  @override
  Widget build(BuildContext context) {
    double textWidth = calculateTextWidth(
      widget.label,
      GoogleFonts.inter(fontSize: 16),
    );
    return InkWell(
      onTap: () => widget.onChanged(widget.index),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 30 : 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: Responsive.isDesktop(context) ? 16 : 14,
                fontWeight: FontWeight.w500,
                color: widget.selectedValue == widget.index
                    ? primaryColor
                    : Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            if (widget.selectedValue == widget.index)
              Container(
                width: textWidth + 2,
                height: 2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ========================================================
double calculateTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);

  return textPainter.size.width;
}

// ========================================================
double calculateTextWidths(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
  )..layout();

  return textPainter.size.width;
}
