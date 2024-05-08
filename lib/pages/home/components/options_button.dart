import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onClick;
  const OptionsButton({
    super.key,
    required this.buttonTitle,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick.call,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFddcbdc),
          border: Border.all(
            width: 2,
            color: Colors.black,
            strokeAlign: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(buttonTitle),
      ),
    );
  }
}
