import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({super.key, this.foregroundColor = AppColors.white});

  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29.5, 15, 14, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '19:27',
              style: TextStyle(
                color: foregroundColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(Icons.signal_cellular_4_bar, color: foregroundColor, size: 17),
            const SizedBox(width: 4),
            Icon(Icons.wifi, color: foregroundColor, size: 17),
            const SizedBox(width: 4),
            Icon(Icons.battery_full, color: foregroundColor, size: 20),
          ],
        ),
      ),
    );
  }
}
