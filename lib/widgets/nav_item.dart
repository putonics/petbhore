import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.routeName,
  });

  final IconData icon;
  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final isActive = ModalRoute.of(context)!.settings.name == routeName;
    return SizedBox(
      height: 50,
      width: 70,
      child: GestureDetector(
        onTap: () => isActive ? null : Navigator.pushNamed(context, routeName),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive
                  ? Colors.orange.shade900
                  : const Color.fromARGB(255, 143, 139, 140),
              size: 30.0,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
