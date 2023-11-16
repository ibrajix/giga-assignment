import 'package:flutterassignment/address/address_screen.dart';
import 'package:flutterassignment/home/home_screen.dart';
import 'package:flutterassignment/navigation/tranistion_animation.dart';
import 'package:go_router/go_router.dart';

import '../constants/destinations.dart';

class Navigation {
  final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            path: Destination.home,
            builder: (context, state) =>  const HomeScreen(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const HomeScreen(),
            ),
            //If user has saved address, redirect to done screen
            /*redirect: (context, state) {
              var hasSeenIntro = LocalPreference.hasSeenIntroScreen();
              if(hasSeenIntro == true){
                return Destination.loginRegister;
              }
              else{
                return Destination.welcome;
              }
            }*/
        ),
        GoRoute(
            path: Destination.addAddress,
            builder: (context, state) => const AddressScreen(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AddressScreen(),
            ),
            /*redirect: (context, state) {
              var isLoggedIn = LocalPreference.isLoggedIn();
              if(isLoggedIn == true){
                return Destination.bottomNav;
              }
              else{
                return Destination.loginRegister;
              }
            }*/
        ),
      ],
  );
}