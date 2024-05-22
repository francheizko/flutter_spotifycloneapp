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
      backgroundColor: ldarkgray,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                widget.selectedindex == 0
                    ? SvgPicture.asset(
                        'assets/images/home-selected.svg',
                        width: 25,
                      )
                    : SvgPicture.asset(
                        'assets/images/home-unseleced.svg',
                        width: 25,
                      ),
              ],
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: widget.selectedindex == 1
                ? SvgPicture.asset(
                    'assets/images/search-selected.svg',
                    width: 25,
                  )
                : SvgPicture.asset(
                    'assets/images/search-unselected.svg',
                    width: 25,
                  ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: widget.selectedindex == 2
                ? SvgPicture.asset(
                    'assets/images/library-selected.svg',
                    width: 25,
                  )
                : SvgPicture.asset(
                    'assets/images/library-unselected.svg',
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
