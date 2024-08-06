
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../configs/shared_prefrence_keys.dart';
import '../../../helper/dialogs/loading_dialog.dart';
import '../../../utils/constants.dart';
import '../../core/providers/providers.dart';
import '../../core/providers/state_providers.dart';
import '../../core/repositery/notification_by_client_id_repository.dart';
import '../components/base_screen.dart';

class NotificationSection extends ConsumerWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<SaleState>(saleStateProvider, (previous, next) async {
    //   if (previous!.response.status != next.response.status) {
    //     if (next.response.status == Status.SUCCESS) {
    //       context.showSnackBar(message: next.response.data!.message ?? 'Data found');
    //     } else if (next.response.status == Status.ERROR) {
    //       context.showSnackBar(message: next.response.message ?? 'Something went wrong');
    //     }
    //   }
    // });

    return isLoadingDataNotifcation? Center(child: CircularProgressIndicator(),): ScreenBase(
      screenTitle: const Text("Notifications"),
      appBarActions: [Padding(
        padding: const EdgeInsets.only(top: 4,left: 16, right: 16),
        child: Align(
            alignment: Alignment.center,
            child: Text("Unread: ${AppConstants.getCountUnread}",style: TextStyle(fontSize: 14),)),
      )],

      screenBody: Consumer(builder: (context, ref, _) {
        var state1 = ref.watch(myNoficationByCClientID);
        ref.watch(myNoficationByCClientID);

        if (state1.isLoading == ConnectionState.waiting) {
          Future(() => LoadingDialog.showLoadingIndicator(context));
          return const SizedBox();
        } else if (state1.hasValue) {
          LoadingDialog.hideDialog(context);
          if (AppConstants.getNoficationByClientID.isNotEmpty) {
            return ListView.builder(
              itemCount: AppConstants.getNoficationByClientID.length,
              itemBuilder: (context, index) {

                final item = AppConstants.getNoficationByClientID[index];
                ref.read(myNoficationByNotID(item['notificationID']));

                return  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:  GestureDetector(
                      onTap: () async{
                       if(item['isRead'] == false){
                         final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
                         final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

                         await NotificationClientID().GetyNotificationByNID(token, item['notificationID'], userID);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const NotificationSection()),
                         );
                       }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: item['isRead'] == true ? Colors.transparent: Colors.grey.shade200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${item['title']}", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("${item['body']}", maxLines: 2, style: TextStyle(color: Colors.black, fontSize: 15, overflow: TextOverflow.ellipsis),),
                              ],
                            ),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: item['isRead'] == true ? Colors.green: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );

              },
            );
          } else {
            return const Center(child: Text('Data not found'));
          }
        } else if (state1.hasError) {
          return const Text('Error loading data');
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
