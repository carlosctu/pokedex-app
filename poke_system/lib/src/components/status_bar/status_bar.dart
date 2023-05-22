import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  final double progressValue;
  final Color statusColor;

  const StatusBar({
    Key? key,
    required this.progressValue,
    required this.statusColor,
  }) : super(key: key);

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: widget.statusColor.withOpacity(0.2),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: widget.progressValue,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: widget.statusColor,
          ),
        ),
      ],
    );
  }
}
