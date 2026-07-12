import 'dart:async';

import 'package:flutter/material.dart';

class AuthTimer extends StatefulWidget {
  const AuthTimer({super.key, this.seconds = 119, required this.onExpire});

  final int seconds;
  final VoidCallback onExpire;

  @override
  State<AuthTimer> createState() => AuthTimerState();
}

class AuthTimerState extends State<AuthTimer> {
  late int _remaining = widget.seconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void restart() {
    setState(() => _remaining = widget.seconds);
    _start();
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining <= 1) {
        timer.cancel();
        setState(() => _remaining = 0);
        widget.onExpire();
        return;
      }
      setState(() => _remaining--);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formatted {
    final minutes = (_remaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, size: 16, color: Colors.black54),
          const SizedBox(width: 6),
          Text(
            _formatted,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
