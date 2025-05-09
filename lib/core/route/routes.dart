
import 'package:betwise_app/helper/extension/base_extension.dart';
import 'package:betwise_app/presentation/screens/auth/forgot/forgot_pass.dart';
import 'package:betwise_app/presentation/screens/auth/otp/verify_otp_screen.dart';
import 'package:betwise_app/presentation/screens/auth/password/set_new_password.dart';
import 'package:betwise_app/presentation/screens/auth/sign_in/sign_in.dart';
import 'package:betwise_app/presentation/screens/auth/sign_up/sign_up.dart';
import 'package:betwise_app/presentation/screens/nav/navigation_page.dart';
import 'package:betwise_app/presentation/screens/notify/notify_screen.dart';
import 'package:betwise_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:betwise_app/presentation/screens/other/change_password_screen.dart';
import 'package:betwise_app/presentation/screens/other/help_faq_screen.dart';
import 'package:betwise_app/presentation/screens/other/privacy_policy.dart';
import 'package:betwise_app/presentation/screens/other/settings_screen.dart';
import 'package:betwise_app/presentation/screens/other/terms_of_condition.dart';
import 'package:betwise_app/presentation/screens/profile/edit/edit_profile_screen.dart';
import 'package:betwise_app/presentation/screens/splash/splash_screen.dart';
import 'package:betwise_app/presentation/screens/subscription/subscription_screen.dart';
import 'package:betwise_app/presentation/screens/subscription/subscription_status/subcription_status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.splashScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      ///======================= Initial Route =======================
      GoRoute(
        name: RoutePath.splashScreen,
        path: RoutePath.splashScreen.addBasePath,
        pageBuilder: (context, state) => _buildPageWithAnimation(child: SplashScreen(), state: state),
      ),
      GoRoute(
        name: RoutePath.onboardingScreen,
        path: RoutePath.onboardingScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: OnboardingScreen(),
              state: state,
            ),
      ),

      ///======================= Auth Route =======================
      GoRoute(
        name: RoutePath.signInScreen,
        path: RoutePath.signInScreen.addBasePath,
        pageBuilder:
            (context, state) =>
                _buildPageWithAnimation(child: SignInScreen(), state: state),
      ),
      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder:
            (context, state) =>
                _buildPageWithAnimation(child: SignUpScreen(), state: state),
      ),
      GoRoute(
        name: RoutePath.forgotPassScreen,
        path: RoutePath.forgotPassScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: ForgotPassScreen(),
              state: state,
            ),
      ),
      GoRoute(
        name: RoutePath.verifyOtpScreen,
        path: RoutePath.verifyOtpScreen.addBasePath,
        pageBuilder: (context, state){
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return _buildPageWithAnimation(
            child: VerifyOtpScreen(email: extra["email"] as String? ?? "", isSignUp: extra["isSignUp"] as bool? ?? false,),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.setNewPassword,
        path: RoutePath.setNewPassword.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: SetNewPassword(email: state.extra as String),
              state: state,
            ),
      ),

      ///======================= Navigation Route =======================
      GoRoute(
        name: RoutePath.navigationPage,
        path: RoutePath.navigationPage.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: NavigationPage(
                index: state.extra != null && (state.extra is int) ? state.extra as int : 0,
              ),
              state: state,
            ),
      ),

      GoRoute(
        name: RoutePath.editProfileScreen,
        path: RoutePath.editProfileScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: const EditProfileScreen(),
              state: state,
            ),
      ),
      GoRoute(
        name: RoutePath.notifyScreen,
        path: RoutePath.notifyScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: const NotifyScreen(),
              state: state,
            ),
      ),

      ///======================= Other Route =======================
      GoRoute(
        name: RoutePath.settingsScreen,
        path: RoutePath.settingsScreen.addBasePath,
        pageBuilder:
            (context, state) =>
                _buildPageWithAnimation(child: SettingsScreen(), state: state),
      ),
      GoRoute(
        name: RoutePath.changePasswordScreen,
        path: RoutePath.changePasswordScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: ChangePasswordScreen(),
              state: state,
            ),
      ),
      GoRoute(
        name: RoutePath.privacyPolicy,
        path: RoutePath.privacyPolicy.addBasePath,
        pageBuilder:
            (context, state) =>
                _buildPageWithAnimation(child: PrivacyPolicy(), state: state),
      ),
      GoRoute(
        name: RoutePath.termsOfCondition,
        path: RoutePath.termsOfCondition.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: TermsOfCondition(),
              state: state,
            ),
      ),
      GoRoute(
        name: RoutePath.helpFaqScreen,
        path: RoutePath.helpFaqScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: HelpFaqScreen(),
              state: state,
            ),
      ),

      ///======================= Subscription =======================

      GoRoute(
        name: RoutePath.subscriptionScreen,
        path: RoutePath.subscriptionScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: SubscriptionScreen(),
              state: state,
            ),
      ),

      GoRoute(
        name: RoutePath.subscriptionStatusScreen,
        path: RoutePath.subscriptionStatusScreen.addBasePath,
        pageBuilder:
            (context, state) => _buildPageWithAnimation(
              child: SubscriptionStatusScreen(),
              state: state,
            ),
      ),

    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
