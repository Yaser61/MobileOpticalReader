import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final VoidCallback onPressed3;
  final VoidCallback onPressed4;

  const BottomIcons({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.onPressed3,
    required this.onPressed4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0001),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButtonWithText(
            icon: Icons.home,
            onPressed: onPressed1,
            label: 'Ana Sayfa',
            iconSize: 27,
          ),
          _buildIconButtonWithText(
            // icon: Icons.format_list_bulleted_sharp,
            icon: Icons.playlist_add_check_circle_outlined,
            onPressed: onPressed2,
            label: 'Testler',
            iconSize: 27,
          ),
          _buildIconButtonWithText(
            icon: Icons.diversity_1,
            onPressed: onPressed3,
            label: 'Öğrenciler',
            iconSize: 27,
          ),
          _buildIconButtonWithText(
            icon: Icons.rule_folder,
            onPressed: onPressed4,
            label: 'Sonuçlar',
            iconSize: 27,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButtonWithText({
    required IconData icon,
    required VoidCallback onPressed,
    required String label,
    required double iconSize,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          iconSize: iconSize,
          color: const Color(0xFFFFBE0B),
        ),
        const SizedBox(
          height: 0.1,
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
