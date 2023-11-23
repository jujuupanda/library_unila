import 'package:go_router/go_router.dart';
import 'package:library_unila/src/pages/barcode_ktm/barcode_ktm.dart';
import 'package:library_unila/src/pages/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/bottom_navigation/opac/opac.dart';
import 'package:library_unila/src/pages/bottom_navigation/profile/profile.dart';
import 'package:library_unila/src/pages/change_password/change_password.dart';
import 'package:library_unila/src/pages/detail_book/detail_book.dart';
import 'package:library_unila/src/pages/detail_status/detail_status.dart';
import 'package:library_unila/src/pages/edit/edit.dart';
import 'package:library_unila/src/pages/help/help.dart';
import 'package:library_unila/src/pages/history/history.dart';
import 'package:library_unila/src/pages/setting/setting.dart';
import 'package:library_unila/src/pages/sign_in/sign_in.dart';
import 'package:library_unila/src/pages/status/status.dart';
import '../../data/models/book_model.dart';
import '../../data/models/history_model.dart';
import '../../data/models/user_model.dart';
import '../../pages/bottom_navigation/home/home.dart';
import '../../pages/circulation_account/circulation_account.dart';
import '../../pages/detail_history/detail_history.dart';
import '../../pages/detail_status_overdue/detail_status_overdue.dart';
import '../../pages/splash/splash.dart';
import '../../pages/status_overdue/status_overdue.dart';
export 'package:go_router/go_router.dart';

part 'route_name.dart';

class AppRouter {
  //Navigation Keys
  static final _rootNavigatorKeys = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome = GlobalKey<NavigatorState>();
  static final _rootNavigatorOpac = GlobalKey<NavigatorState>();
  static final _rootNavigatorProfile = GlobalKey<NavigatorState>();

  //App Route Config
  static GoRouter route = GoRouter(
    navigatorKey: _rootNavigatorKeys,
    routes: <RouteBase>[
      //Init Route or Splash
      GoRoute(
        path: "/",
        name: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      //Main Navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BotNavHome(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          //Branch Home
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                  path: '/home',
                  name: Routes.home,
                  builder: (context, state) {
                    return HomePage(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'barcodeKTM',
                      name: Routes.barcodeKTM,
                      builder: (context, state) {
                        return BarcodeKTM(
                            key: state.pageKey,
                            userModel: state.extra as UserModel);
                      },
                    ),
                    GoRoute(
                        path: 'status',
                        name: Routes.status,
                        builder: (context, state) {
                          return StatusPage(
                            npm: state.extra as String,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'detailStatus',
                            name: Routes.detailStatus,
                            builder: (context, state) {
                              return DetailStatusPage(
                                status: state.extra as HistoryModel,
                              );
                            },
                          )
                        ]),
                    GoRoute(
                        path: 'statusOverdue',
                        name: Routes.statusOverdue,
                        builder: (context, state) {
                          return StatusOverduePage(
                            npm: state.extra as String,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'detailStatusOverdue',
                            name: Routes.detailStatusOverdue,
                            builder: (context, state) {
                              return DetailStatusOverduePage(
                                status: state.extra as HistoryModel,
                              );
                            },
                          )
                        ]),
                    GoRoute(
                        path: 'history',
                        name: Routes.history,
                        builder: (context, state) {
                          return HistoryPage(
                            npm: state.extra as String,
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'detailHistory',
                            name: Routes.detailHistory,
                            builder: (context, state) {
                              return DetailHistoryPage(
                                history: state.extra as HistoryModel,
                              );
                            },
                          )
                        ]),
                    GoRoute(
                      path: 'circulationAccount',
                      name: Routes.circulationAccount,
                      builder: (context, state) {
                        return CirculationAccountPage(
                          npm: state.extra as String,
                        );
                      },
                    ),
                    GoRoute(
                      path: 'help',
                      name: Routes.help,
                      builder: (context, state) {
                        return HelpPage(key: state.pageKey);
                      },
                    ),
                  ]),
            ],
          ),

          //Branch Opac
          StatefulShellBranch(
            navigatorKey: _rootNavigatorOpac,
            routes: [
              GoRoute(
                  path: '/opac',
                  name: Routes.opac,
                  builder: (context, state) {
                    return OpacPage(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'detailBook',
                      name: Routes.detailBook,
                      builder: (context, state) {
                        return DetailBookPage(
                          bookModel: state.extra as BookModel,
                        );
                      },
                    )
                  ]),
            ],
          ),

          //Branch Profile
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfile,
            routes: [
              GoRoute(
                path: '/profile',
                name: Routes.profile,
                builder: (context, state) {
                  return ProfilePage(
                    key: state.pageKey,
                  );
                },
              ),
            ],
          ),
        ],
      ),

      /// Add Navigation Outside Form Main Route Below
      /// for consume, use context.push(context.namedLocation('somePlace'))
      /// for remove the navbar use rootNavigator as parentNavigator (GoRoutes fields)

      GoRoute(
        path: '/changePassword',
        name: Routes.changePassword,
        parentNavigatorKey: _rootNavigatorKeys,
        builder: (context, state) {
          return ChangePasswordPage(
            userModel: state.extra as UserModel,
          );
        },
      ),
      GoRoute(
        path: '/setting',
        name: Routes.setting,
        parentNavigatorKey: _rootNavigatorKeys,
        builder: (context, state) {
          return SettingPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/signIn',
        name: Routes.signIn,
        parentNavigatorKey: _rootNavigatorKeys,
        builder: (context, state) {
          return SignInPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/edit',
        name: Routes.edit,
        parentNavigatorKey: _rootNavigatorKeys,
        builder: (context, state) {
          return EditProfilePage(
            userModel: state.extra as UserModel,
          );
        },
      ),
    ],
  );
}
