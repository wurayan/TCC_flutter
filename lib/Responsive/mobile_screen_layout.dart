import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partiu_app/Utils/Colors.dart';
import 'package:partiu_app/Utils/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:partiu_app/models/user.dart' as model;
import '../providers/user_provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  void navigationTapped(int page ){
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        children: homeScreenItens,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _page==0 ? primaryColor : secondaryColor,), 
            label: "",
            backgroundColor: primaryColor),
            BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _page==1 ? primaryColor : secondaryColor,), 
            label: "",
            backgroundColor: primaryColor),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: _page==2 ? primaryColor : secondaryColor,), 
            label: "",
            backgroundColor: primaryColor),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: _page==3 ? primaryColor : secondaryColor,), 
            label: "",
            backgroundColor: primaryColor),
            BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _page==4 ? primaryColor : secondaryColor,), 
            label: "",
            backgroundColor: primaryColor)
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
