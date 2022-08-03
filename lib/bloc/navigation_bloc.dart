import 'package:calculator/ui/setting.dart';
import 'package:flutter/material.dart';
import '../ui/standardCalculator.dart';
import 'package:bloc/bloc.dart';


enum NavigationEvents{
  standardCalculatorPageClickEvent,
  settingPageClickEvent,
}

class NavigationBloc extends Bloc<NavigationEvents,Widget>{
  NavigationBloc():super(const StandardCalculator());

  void goPage(NavigationEvents events){
    if(events ==NavigationEvents.standardCalculatorPageClickEvent){
      emit(const StandardCalculator());
    }if(events ==NavigationEvents.settingPageClickEvent){
      emit(const Setting());
    }
  }
}