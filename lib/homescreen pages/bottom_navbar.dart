import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedindex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedindex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundc,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: lwhite,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'AvenirNext',
        fontSize: 13,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: widget.selectedindex == 0
                ? Image.asset(
                    'assets/images/home-selected.png',
                    width: 25,
                  )
                : Image.asset(
                    'assets/images/home-unselected.png',
                    width: 25,
                  ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: widget.selectedindex == 1
                ? Image.asset(
                    'assets/images/search-selected.png',
                    width: 25,
                  )
                : Image.asset(
                    'assets/images/search-unselected.png',
                    width: 25,
                  ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: widget.selectedindex == 2
                ? Image.asset(
                    'assets/images/library-selected.png',
                    width: 25,
                  )
                : Image.asset(
                    'assets/images/library-unselected.png',
                    width: 25,
                  ),
          ),
          label: 'Library',
        ),
      ],
      currentIndex: widget.selectedindex,
      onTap: widget.onItemTapped,
    );
  }
}
