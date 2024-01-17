import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:point_of_sale/constants/constants.dart';
import 'package:point_of_sale/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:point_of_sale/features/online_orders/presentation/pages/online_orders.dart';

BuildContext? testContext;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int myCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() => const [
        DashboardPage(),
        OnlineOrdersPage(),
        Text(
          'Search',
          // style: optionStyle,
        ),
      ];

  List<BottomNavigationBarItem> _navBarsItems() => const [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.pieChart),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.mousePointer),
          label: "Online Order",
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.cog),
          label: "Settings",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[myCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myCurrentIndex,
        selectedItemColor: Color(black.value),
        onTap: (value) {
          setState(() {
            myCurrentIndex = value;
          });
        },
        items: _navBarsItems(),
      ),
    );
  }
}
