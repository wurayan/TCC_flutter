import 'package:flutter/material.dart';
import 'package:partiu_app/Screens/add_evento_screen.dart';
import 'package:partiu_app/Screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItens = [
  FeedScreen(),
  Text("search"),
  AddEventoScreen(),
  Text("notification"),
  Text("profile")
];