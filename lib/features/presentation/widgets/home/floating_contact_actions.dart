import 'package:flutter/material.dart';

import '../../../../base/widgets/images/image_network_widget.dart';
import 'home_assets.dart';

class FloatingContactActions extends StatefulWidget {
  const FloatingContactActions({super.key});

  @override
  State<FloatingContactActions> createState() => _FloatingContactActionsState();
}

class _FloatingContactActionsState extends State<FloatingContactActions> {
  var _isExpanded = false;

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  void _collapse() {
    if (_isExpanded) {
      setState(() => _isExpanded = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const actions = [
      _FloatingAction(HomeAssets.iconBell, 544),
      _FloatingAction(HomeAssets.iconPhone, 616),
      _FloatingAction(HomeAssets.iconMessenger, 683),
      _FloatingAction(HomeAssets.iconZalo, 750),
    ];

    return Stack(
      children: [
        if (_isExpanded)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _collapse,
            ),
          ),
        if (_isExpanded)
          for (final action in actions)
            _FloatingIcon(action: action, onTap: () {})
        else
          _FloatingIcon(
            action: const _FloatingAction(HomeAssets.iconMessenger, 683),
            onTap: _toggleExpanded,
          ),
      ],
    );
  }
}

class _FloatingIcon extends StatelessWidget {
  const _FloatingIcon({required this.action, required this.onTap});

  final _FloatingAction action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isBell = action.asset == HomeAssets.iconBell;

    return Positioned(
      right: 13,
      top: action.top,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ImageNetworkWidget(
          imageUrl: action.asset,
          width: isBell ? 50 : 48,
          height: isBell ? 53 : 48,
        ),
      ),
    );
  }
}

class _FloatingAction {
  const _FloatingAction(this.asset, this.top);

  final String asset;
  final double top;
}
