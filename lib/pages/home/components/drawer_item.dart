import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String itemTitle;
  final VoidCallback onClick;
  const DrawerItem({
    super.key,
    required this.itemTitle,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Material(
        child: InkWell(
          onTap: onClick.call,
          child: Ink(
            decoration: const BoxDecoration(
              color: Color(0xFFddcbdc),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(itemTitle),
            ),
          ),
        ),
      ),
    );
  }
}
