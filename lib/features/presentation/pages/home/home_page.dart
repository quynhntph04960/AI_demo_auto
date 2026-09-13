import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../widgets/booking/booking_form_dialog.dart';
import '../../widgets/booking/booking_success_dialog.dart';
import '../../widgets/home/floating_contact_actions.dart';
import '../../widgets/home/home_bottom_nav.dart';
import '../../widgets/home/home_category_grid.dart';
import '../../widgets/home/home_header.dart';
import '../../widgets/home/service_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.showFloatingActions = false});

  final bool showFloatingActions;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _showBookingForm = false;
  var _showBookingSuccess = false;

  void _openBookingForm() {
    setState(() {
      _showBookingForm = true;
      _showBookingSuccess = false;
    });
  }

  void _closeBookingForm() {
    setState(() => _showBookingForm = false);
  }

  void _submitBooking() {
    setState(() {
      _showBookingForm = false;
      _showBookingSuccess = true;
    });
  }

  void _closeBookingSuccess() {
    setState(() => _showBookingSuccess = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeCategoryGrid(onBookingTap: _openBookingForm),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: AppColors.backgroundGray,
                      ),
                      const ServiceGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: HomeBottomNav(),
          ),
          if (widget.showFloatingActions) const FloatingContactActions(),
          if (_showBookingForm)
            BookingFormDialog(
              onSubmit: _submitBooking,
              onDismiss: _closeBookingForm,
            ),
          if (_showBookingSuccess)
            BookingSuccessDialog(onClose: _closeBookingSuccess),
        ],
      ),
    );
  }
}
