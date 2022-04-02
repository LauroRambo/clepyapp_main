import 'package:clepy_ui/clepy_ui.dart';
import 'package:clepy_ui/components/app-bar/clepy_appBar.dart';
import 'package:clepy_ui/components/app-bar/navigator_tile.dart';
import 'package:domain/domain.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClepyDrawer extends StatefulWidget {
  final bool logoAppBar;
  final Widget body;
  final Widget? navigator;
  ClepyDrawer(
      {Key? key, required this.body, this.logoAppBar = false, this.navigator})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _ClepyDrawerState createState() => _ClepyDrawerState(
      logoAppBar: logoAppBar, body: body, navigator: navigator);
}

class _ClepyDrawerState extends State<ClepyDrawer>
    with SingleTickerProviderStateMixin {
  final bool logoAppBar;
  final Widget body;
  final Widget? navigator;
  _ClepyDrawerState(
      {Key? key, required this.body, this.logoAppBar = false, this.navigator});

  late FancyDrawerController _controller;
  ClepyUser? userData = null;
  Future _retrieverData() async {
    userData = await LoginService().retrieverUser();
    print(userData);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _retrieverData();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {}); // Must call setState
      }); // This chunk of code is important
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyDrawerWrapper(
        backgroundColor: ClepyColors.brandPrimary, // Drawer background
        controller: _controller, // Drawer controller
        drawerItems: [
          CircleAvatar(
            child: Container(
              color: Colors.black26,
            ),
          ),
          userData == null
              ? Container()
              : Text(
                  userData!.name,
                  style: TextStyle(
                      color: ClepyColors.ice, fontWeight: FontWeight.bold),
                ),
          NavigatorTile(
            route: userData == null ? 'login' : 'profile',
            context: context,
            icon: Icons.person_outline,
            text: userData == null ? 'Entrar' : 'Seu Perfil ',
          ),
          NavigatorTile(
            route: 'profile',
            context: context,
            icon: Icons.chat_bubble_outline,
            text: 'Mensagens',
          ),
          NavigatorTile(
            route: 'notification',
            context: context,
            icon: Icons.notifications_none_sharp,
            text: 'Notificações',
          ),
          NavigatorTile(
            route: 'calendar',
            context: context,
            icon: Icons.calendar_today_outlined,
            text: 'Calendário ',
          ),
          NavigatorTile(
            route: 'config',
            context: context,
            icon: Icons.settings,
            text: 'Configurações',
          ),
          NavigatorTile(
            route: 'exit',
            context: context,
            icon: Icons.exit_to_app,
            text: 'Sair',
          ),
          const Text(
            "1.0.0",
            style: TextStyle(color: Colors.black26),
          )
        ], // Drawer items
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: logoAppBar ? ClepyAppBarLogo : ClepyAppBar,
            backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.list_bullet_indent,
                color: ClepyColors.brandPrimary,
              ),
              onPressed: () {
                if (_controller.state == DrawerState.closed) {
                  _controller.toggle();
                } else {
                  _controller.toggle();
                }
              },
            ),
          ),
          body: body,
        ),
      ),
    );
  }
}
