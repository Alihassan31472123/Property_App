import 'package:apni_property_app/features/presentation/components/base_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/home_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/my_purchase.dart';
import 'package:apni_property_app/features/presentation/screens/home/nav_drawer.dart';
import 'package:apni_property_app/features/presentation/screens/notification_screen.dart';
import 'package:apni_property_app/features/presentation/screens/profile/profilescreen.dart';
import 'package:apni_property_app/features/presentation/screens/profile/wallet_screen.dart';
import 'package:flutter/material.dart';

class MyNavigationBarSection extends StatefulWidget {
  MyNavigationBarSection({Key? key}) : super(key: key);

  @override
  _MyNavigationBarSectionState createState() => _MyNavigationBarSectionState();
}

class _MyNavigationBarSectionState extends State<MyNavigationBarSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _selectedIndex = 0;
  bool _enabled = true;
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _widgetOptions = [
    HomePage(),
    AddClientProfileForm(),
    BalanceDetailsScreen(),
    Mypurchase()
  ];

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Use ..repeat() to loop the animation
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller); // This will move the line from left to right
    super.initState();
    // _selectedIndex = widget.selectedIndex;
    // pageController = PageController(initialPage: widget.selectedIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      key: _scaffoldKey,
      screenTitle: Text(_selectedIndex == 0? "Dashboard": _selectedIndex == 1? "Profile": _selectedIndex == 2? "My Wallet":"Assets"),

      appBarActions: [Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationSection()),
              );
            },
            child: Icon(Icons.notifications)),
      )],
      navigationDrawer: const NavDrawer(),

      screenBody: PageView(
        controller: pageController,
        onPageChanged: (item) {
          setState(() {
            _selectedIndex = item;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: SafeArea(
        child: Wrap(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //
            //     gradient: LinearGradient(
            //       colors: [Colors.blue.shade300, Colors.blue.shade500],
            //       begin: Alignment.centerLeft,
            //       end: Alignment.centerRight,
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: DottedBorder(
            //       borderType: BorderType.RRect,
            //       radius: Radius.circular(6),
            //       dashPattern: [5, 5],
            //       color: Colors.grey,
            //       strokeWidth: 1.5,
            //       child: Container(
            //
            //         decoration: BoxDecoration(
            //             color: Color(0xff08738c),
            //             borderRadius: BorderRadius.circular(6)
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Image.asset('assets/icons/ic_launcher.png', width: 55, height: 55,),
            //               SizedBox(
            //                 width: 16,
            //               ),
            //               Text("Baby Tracker", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            //               Spacer(),
            //               CustomButton(
            //                 width: MediaQuery.of(context).size.width * 0.37,
            //                 // margin:
            //                 // const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
            //                 height: 46.0,
            //                 onPressed: () {
            //
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                   backgroundColor: Color(0xff10b5c5),
            //                   elevation: 0.0,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(7),
            //                   ),
            //                 ),
            //                 child: Text(
            //                   'Download Now',
            //                   style: TextStyle(fontSize: 15.0, color: whiteColor, fontStyle: FontStyle.italic),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 60,
            //   width: double.maxFinite,
            //   child: bannerad(),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                          Icons.home_filled,
                          size: 24),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                          Icons.person,
                          size: 24),
                      label: "Profile",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                          Icons.wallet,
                          size: 24),
                      label: "Wallet",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                          Icons.price_check,
                          size: 24),
                      label: "Assets",
                    ),
                  ],
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  iconSize: 22,
                  selectedFontSize: 12,
                  onTap: _onItemTapped),
            ),
          ],
        ),
      ),
    );
  }
}
