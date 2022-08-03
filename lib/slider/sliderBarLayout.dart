import 'package:calculator/bloc/navigation_bloc.dart';
import 'package:calculator/slider/sliderBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBarLayout extends StatefulWidget {
  const SliderBarLayout({Key? key}) : super(key: key);

  @override
  State<SliderBarLayout> createState() => _SliderBarLayoutState();
}

class _SliderBarLayoutState extends State<SliderBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc,Widget> (builder:(context, Widget widget){return widget;}),
            //StandardCalculator(),
            const SlideBar(),
          ],
        ),
      ),
    );
  }
}
