import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @brdz.
  ///
  /// In en, this message translates to:
  /// **'brdz'**
  String get brdz;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Brdz'**
  String get welcome;

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Fast. Simple. Secure.\nSend and Receive Money Anywhere,\n Anytime.'**
  String get welcomeText;

  /// No description provided for @withdrawLikeABoss.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Like A\nBoss'**
  String get withdrawLikeABoss;

  /// No description provided for @withdrawText.
  ///
  /// In en, this message translates to:
  /// **'Buy And Sell Your Gift Card With\nEase'**
  String get withdrawText;

  /// No description provided for @blockChain.
  ///
  /// In en, this message translates to:
  /// **'Swift Blockchain\nRevolution'**
  String get blockChain;

  /// No description provided for @blockChainText.
  ///
  /// In en, this message translates to:
  /// **'Easy Way To Exchange And Invest In Cryptocurrency Safely'**
  String get blockChainText;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select an account you wish to open'**
  String get selectAccount;

  /// No description provided for @personalAccount.
  ///
  /// In en, this message translates to:
  /// **'Personal Account'**
  String get personalAccount;

  /// No description provided for @businessAccount.
  ///
  /// In en, this message translates to:
  /// **'Business Account'**
  String get businessAccount;

  /// No description provided for @btnContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get btnContinue;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'I have an account?'**
  String get haveAccount;

  /// No description provided for @singIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get singIn;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get networkError;

  /// No description provided for @signInWithYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get signInWithYourAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailPlaceholder;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordPlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Enter your Password'**
  String get passwordPlaceHolder;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailNotValid;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsRequired;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsRequired;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed!'**
  String get loginFailed;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get loginSuccess;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @qr.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get qr;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **''**
  String get empty;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @qrHint.
  ///
  /// In en, this message translates to:
  /// **'Align to QR code'**
  String get qrHint;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @torch.
  ///
  /// In en, this message translates to:
  /// **'Torch'**
  String get torch;

  /// No description provided for @cameraFront.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get cameraFront;

  /// No description provided for @cameraBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get cameraBack;

  /// No description provided for @switchCamera.
  ///
  /// In en, this message translates to:
  /// **'Switch Camera'**
  String get switchCamera;

  /// No description provided for @cameraError.
  ///
  /// In en, this message translates to:
  /// **'Camera error: {error}'**
  String cameraError(String error);

  /// No description provided for @paymentConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Confirmation'**
  String get paymentConfirmationTitle;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @fee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get fee;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get free;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @noteOptional.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get noteOptional;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @qrNotValid.
  ///
  /// In en, this message translates to:
  /// **'QR Not Valid'**
  String get qrNotValid;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @paymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment Success'**
  String get paymentSuccess;

  /// No description provided for @merchant.
  ///
  /// In en, this message translates to:
  /// **'Merchant'**
  String get merchant;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @transactionDate.
  ///
  /// In en, this message translates to:
  /// **'Transaction Date'**
  String get transactionDate;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @timestamp.
  ///
  /// In en, this message translates to:
  /// **'Timestamp'**
  String get timestamp;

  /// No description provided for @noPaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'No Transaction Yet'**
  String get noPaymentHistory;

  /// No description provided for @pullToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh'**
  String get pullToRefresh;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletTitle;

  /// No description provided for @walletNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Wallet Not Connected'**
  String get walletNotConnected;

  /// No description provided for @walletConnectDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect your wallet to interact with blockchain'**
  String get walletConnectDescription;

  /// No description provided for @connectWallet.
  ///
  /// In en, this message translates to:
  /// **'Connect Wallet'**
  String get connectWallet;

  /// No description provided for @selectWalletProvider.
  ///
  /// In en, this message translates to:
  /// **'Select Wallet Provider'**
  String get selectWalletProvider;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @walletAddress.
  ///
  /// In en, this message translates to:
  /// **'Wallet Address'**
  String get walletAddress;

  /// No description provided for @addressCopied.
  ///
  /// In en, this message translates to:
  /// **'Address copied to clipboard'**
  String get addressCopied;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @sendTransaction.
  ///
  /// In en, this message translates to:
  /// **'Send Transaction'**
  String get sendTransaction;

  /// No description provided for @sendTransactionDesc.
  ///
  /// In en, this message translates to:
  /// **'Send ETH to another address'**
  String get sendTransactionDesc;

  /// No description provided for @signMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign Message'**
  String get signMessage;

  /// No description provided for @signMessageDesc.
  ///
  /// In en, this message translates to:
  /// **'Sign a message with your wallet'**
  String get signMessageDesc;

  /// No description provided for @refreshBalance.
  ///
  /// In en, this message translates to:
  /// **'Refresh Balance'**
  String get refreshBalance;

  /// No description provided for @refreshBalanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Update your current balance'**
  String get refreshBalanceDesc;

  /// No description provided for @recipientAddress.
  ///
  /// In en, this message translates to:
  /// **'Recipient Address'**
  String get recipientAddress;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @sign.
  ///
  /// In en, this message translates to:
  /// **'Sign'**
  String get sign;

  /// No description provided for @transactionSent.
  ///
  /// In en, this message translates to:
  /// **'Transaction sent'**
  String get transactionSent;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @logoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Log Out from your account'**
  String get logoutDesc;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @signUpDescription.
  ///
  /// In en, this message translates to:
  /// **'Sign up to get started'**
  String get signUpDescription;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordPlaceholder;

  /// No description provided for @confirmPasswordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required'**
  String get confirmPasswordIsRequired;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordNotMatch;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! Please sign in'**
  String get registerSuccess;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again'**
  String get registerFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
