import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/data/responce/status.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/menu_view_model/notification_view_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationViewModel notificationViewModel = NotificationViewModel();

  @override
  void initState() {
    notificationViewModel.notificationApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 23, 20, 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColor().appIconcolor,
                        size: 28,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ChangeNotifierProvider<NotificationViewModel>(
                create: (BuildContext context) => notificationViewModel,
                child: Consumer<NotificationViewModel>(
                    builder: (context, value, _) {
                  switch (value.notificationData.status) {
                    case Status.LOADING:
                      return Column(
                        children: const [
                          SizedBox(
                            height: 100,
                          ),
                          Text('Processing...'),
                        ],
                      );
                    case Status.ERROR:
                      return Text(value.notificationData.message.toString());

                    default:
                      return value.notificationData.data!.notifications!.isEmpty
                          ? Center(child: noDataFound())
                          : Expanded(
                              child: ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                itemCount: value.notificationData.data!
                                    .notifications!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      ///
                                      var notificationdata = value
                                          .notificationData
                                          .data!
                                          .notifications![index]
                                          .notifyFrom!;

                                      debugPrint(
                                          '${value.notificationData.data!.notifications![index].notifyFrom!.id}');
                                      debugPrint('on tab Notification');
                                      if (notificationdata.id == 1) {
                                        debugPrint('${notificationdata.id}');
                                        final bottomNavProvider =
                                            Provider.of<BottomNavProvider>(
                                                context,
                                                listen: false);
                                        bottomNavProvider.setindex(0);
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RoutesName.bottomnav,
                                          (route) => false,
                                        );
                                      }
                                      //   final scrollprovider =
                                      //       Provider.of<Scrollprovider>(context,
                                      //           listen: false);
                                      //   scrollprovider.setID(
                                      //     passid: value
                                      //         .notificationData
                                      //         .data!
                                      //         .notifications![index]
                                      //         .notifyFrom!
                                      //         .id,
                                      //   );
                                      // }
                                      /// Commented Part
                                      ///
                                      else {
                                        // Navigator.pushNamed(
                                        //   context,
                                        //   RoutesName.morepics,
                                        //   arguments: {
                                        //     'userId': notificationdata.id,
                                        //   },
                                        // );
                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.morepics,
                                          arguments: {
                                            'userId': notificationdata.id,
                                            'userName': notificationdata.name,
                                            'userProfile':
                                                notificationdata.profileImage ??
                                                    'null',
                                            'chatButton': true,
                                          },
                                        );
                                      }
                                      // final bottomNavProvider =
                                      //     Provider.of<BottomNavProvider>(
                                      //         context,
                                      //         listen: false);
                                      // bottomNavProvider.setindex(0);
                                      // Navigator.pushNamedAndRemoveUntil(
                                      //   context,
                                      //   RoutesName.bottomnav,
                                      //   (route) => false,
                                      //   // arguments: {
                                      //   //   'boolScroll': true,
                                      //   // },
                                      // );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColor().whitecolor,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Image.asset(
                                          //   allnotificationImg,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(80),
                                            ),
                                            child: FadeInImage(
                                              placeholder: const AssetImage(
                                                logo,
                                              ),
                                              image: NetworkImage(value
                                                  .notificationData
                                                  .data!
                                                  .notifications![index]
                                                  .notifyFrom!
                                                  .profileImage
                                                  .toString()),
                                              fit: BoxFit.cover,
                                              imageErrorBuilder:
                                                  (context, object, trace) {
                                                return Image.asset(
                                                  logo,
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          const SizedBox(
                                            // color: Colors.green,
                                            width: 10,
                                            height: 50,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              // height: 50,
                                              // color: Colors.amber,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value
                                                            .notificationData
                                                            .data!
                                                            .notifications![
                                                                index]
                                                            .notifyFrom!
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor()
                                                              .textcolor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${value.notificationData.data!.notifications![index].receivedAt}',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor()
                                                              .textcolor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      '${value.notificationData.data!.notifications![index].data!.text}',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 10,
                                ),
                              ),
                            );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
