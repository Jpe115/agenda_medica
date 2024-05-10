import 'package:agenda/config/menu/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuitem = appMenuItems[value];
        context.push(menuitem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 25, 16, 10),
          child: const Text("Categorías"),
        ),

        ...appMenuItems
          .sublist(0, 1)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            )
          ),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 2.5, 28, 2.5),
          child: Divider(),
        ),
        
        ...appMenuItems
          .sublist(1, 2)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            )
          ),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 2.5, 28, 2.5),
          child: Divider(),
        ),

        ...appMenuItems
          .sublist(2, 3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            )
          ),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 2.5, 28, 2.5),
          child: Divider(),
        ),

        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            )
          ),
      ],
    );
  }
}