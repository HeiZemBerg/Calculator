import 'package:calculator/bloc/navigation_bloc.dart';
import 'package:calculator/slider/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlideBar extends StatefulWidget {
  const SlideBar({Key? key}) : super(key: key);

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar>
    with SingleTickerProviderStateMixin {
  bool isSlideBarOpen = false;

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 700));

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedPositioned(
        duration: const Duration(milliseconds: 850),
        left: isSlideBarOpen ? 140 : screenWidth - 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth - 150,
              height: screenHeight,
              color: const Color(0xff1B2430),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Calculator',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 40,
                      color: Colors.white,
                      indent: 20,
                    ),
                    myMenuItem(
                      title: 'Standard',
                      icon: Icons.calculate,
                      onTap: () {
                        BlocProvider.of<NavigationBloc>(context).goPage(
                            NavigationEvents.standardCalculatorPageClickEvent);
                        setState(() {
                          isSlideBarOpen=!isSlideBarOpen;
                        });
                      },
                    ),
                    myMenuItem(
                      title: 'Setting',
                      icon: Icons.settings,
                      onTap: () {
                        BlocProvider.of<NavigationBloc>(context)
                            .goPage(NavigationEvents.settingPageClickEvent);
                        setState(() {
                          isSlideBarOpen=!isSlideBarOpen;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSlideBarOpen = !isSlideBarOpen;
                });
              },
              child: ClipPath(
                clipper: CustomMenuClipper(),
                child: Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 110,
                  color: const Color(0xff395B64),
                  child: AnimatedIcon(
                    color: Colors.white,
                    icon: !isSlideBarOpen
                        ? AnimatedIcons.menu_close
                        : AnimatedIcons.close_menu,
                    progress: _animationController.view,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(width, -0.5);
    path.quadraticBezierTo(width, 9, width - 10, 18);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 18);
    path.quadraticBezierTo(width, height - 9, width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
