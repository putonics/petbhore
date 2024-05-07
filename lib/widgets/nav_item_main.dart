import 'package:flutter/material.dart';

class NavItemMain extends StatelessWidget {
  const NavItemMain({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    final isActive = ModalRoute.of(context)!.settings.name == routeName;
    return SizedBox(
      height: 80,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () => isActive
              ? null
              : Navigator.of(context).pushReplacementNamed(routeName),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.redAccent,
                  Colors.orangeAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 10,
                        color: isActive ? Colors.white : Colors.white24,
                      ),
                    ),
                  ),
                  Text(
                    "পেটভরে",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "FN Mahin Sayeedi Unicode",
                      color: isActive ? Colors.black : Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 8,
                        color: isActive ? Colors.white : Colors.white24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
