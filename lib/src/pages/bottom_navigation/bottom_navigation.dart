import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/constants/constant.dart';

class BotNavHome extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  BotNavHome({Key? key, required this.navigationShell}) : super(key: key);

  @override
  State<BotNavHome> createState() => _BotNavHomeState();
}

class _BotNavHomeState extends State<BotNavHome> {
  int _currentIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assets/images/exit.png',
                      ),
                    ),
                  ),
                  const Text(
                    'Apakah kamu yakin ingin keluar?',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 13),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: colorPrimary)),
                      child: const Center(
                        child: Text(
                          'Tidak',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: colorPrimary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary),
                      child: const Center(
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        )) ??
        false;
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: textHome,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.book_rounded),
      label: textOpac,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: textProfile,
    ),
  ];

  Widget loading() {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Connection Issue",
            style: poppinsBig,
          ),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget noConnection() {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Connection Issue",
            style: poppinsBig,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageNoConn, width: 120),
            const SizedBox(height: 10),
            Text(
              "No Connection Internet",
              style: poppinsBig,
            ),
          ],
        ),
      ),
    );
  }

  Widget vpnConnection() {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Connection Issue",
            style: poppinsBig,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageWarnConn, width: 120),
            const SizedBox(height: 10),
            Text(
              "VPN Connection Not Allowed",
              style: poppinsBig,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData) {
            ConnectivityResult? result = snapshot.data;
            if (result == ConnectivityResult.mobile ||
                result == ConnectivityResult.wifi) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: widget.navigationShell,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: colorPrimary,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  iconSize: 26,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    _goToBranch(_currentIndex);
                  },
                  items: _bottomNavigationBarItem,
                ),
              );
            } else if (result == ConnectivityResult.vpn) {
              return vpnConnection();
            } else {
              return noConnection();
            }
          } else {
            return loading();
          }
        },
      ),
    );
  }
}
