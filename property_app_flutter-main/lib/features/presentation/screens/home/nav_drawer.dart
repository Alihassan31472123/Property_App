import 'package:apni_property_app/configs/res/resource/src/images.dart';
import 'package:apni_property_app/features/presentation/screens/add_balance_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/property_ownership.dart';
import 'package:apni_property_app/features/presentation/screens/profile/wallet_screen.dart';
import 'package:apni_property_app/helper/dialogs/logout_dialog.dart';
import 'package:apni_property_app/helper/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile/profilescreen.dart';
import 'my_purchase.dart';
import 'my_sales_list.dart';
import 'withdraw_screen.dart';

class NavDrawer extends ConsumerWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Image.asset(AppImages.appLogoUpdate, width: 280, height: 280,),
          ),
          // ListTile(
          //   leading: const Icon(Icons.wallet),
          //   title: const Text('Wallet'),
          //   onTap: () => {
          //     Navigator.of(context).pop(),
          //     context.showSnackBar(message: "Coming Soon")
          //   },
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddClientProfileForm(isEnable: true,)),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
            ),
          ),

          ExpansionTile(
            leading: Icon(Icons.wallet),
            title: Text("Wallet Menu"),
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  BalanceDetailsScreen(isEnableWallet: true,)),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.wallet),
                  title: Text('View Wallet'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddBalanceScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('Deposit'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Withdraw()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('Withdraw Balance'),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Mypurchase(isEnablePurchase: true)),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.price_check),
              title: Text('Assets'),
            ),
          ),

 // InkWell(
 //            onTap: () {
 //              Navigator.push(
 //                context,
 //                MaterialPageRoute(builder: (context) =>  property()),
 //              );
 //            },
 //            child: const ListTile(
 //              leading: Icon(Icons.business),
 //              title: Text('Property Ownership'),
 //            ),
 //          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SalePage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.real_estate_agent),
              title: Text('My Sales List'),
            ),
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop(), context.showSnackBar(message: "Coming Soon")},
          // ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop(), context.showSnackBar(message: "Coming Soon")},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              Navigator.of(context).pop(),
              showDialog(context: context, builder: (_) => const LogoutDialog()),
            },
          ),
        ],
      ),
    );
  }
}
