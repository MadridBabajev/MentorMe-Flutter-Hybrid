import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_et.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of LocalisationStrings
/// returned by `LocalisationStrings.of(context)`.
///
/// Applications need to include `LocalisationStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LocalisationStrings.localizationsDelegates,
///   supportedLocales: LocalisationStrings.supportedLocales,
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
/// be consistent with the languages listed in the LocalisationStrings.supportedLocales
/// property.
abstract class LocalisationStrings {
  LocalisationStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LocalisationStrings? of(BuildContext context) {
    return Localizations.of<LocalisationStrings>(context, LocalisationStrings);
  }

  static const LocalizationsDelegate<LocalisationStrings> delegate = _LocalisationStringsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('et')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'MentorMe App'**
  String get appTitle;

  /// No description provided for @drawerMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get drawerMenu;

  /// No description provided for @drawerProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get drawerProfile;

  /// No description provided for @drawerInbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get drawerInbox;

  /// No description provided for @drawerSubjects.
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get drawerSubjects;

  /// No description provided for @drawerPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get drawerPaymentMethods;

  /// No description provided for @drawerBankingDetails.
  ///
  /// In en, this message translates to:
  /// **'Banking Details'**
  String get drawerBankingDetails;

  /// No description provided for @drawerAvailabilities.
  ///
  /// In en, this message translates to:
  /// **'Availabilities'**
  String get drawerAvailabilities;

  /// No description provided for @drawerTutorSearch.
  ///
  /// In en, this message translates to:
  /// **'Browse Tutors'**
  String get drawerTutorSearch;

  /// No description provided for @drawerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawerAbout;

  /// No description provided for @drawerWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get drawerWelcome;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get bottomNavSearch;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out?'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure that you want to log out of the app?'**
  String get logoutConfirmation;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @firstNameField.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstNameField;

  /// No description provided for @lastNameField.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameField;

  /// No description provided for @mobileField.
  ///
  /// In en, this message translates to:
  /// **'Mobile Phone'**
  String get mobileField;

  /// No description provided for @emailField.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailField;

  /// No description provided for @passwordField.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordField;

  /// No description provided for @confirmPasswordField.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordField;

  /// No description provided for @countryField.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryField;

  /// No description provided for @isTutorField.
  ///
  /// In en, this message translates to:
  /// **'I am a tutor'**
  String get isTutorField;

  /// No description provided for @haveNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get haveNoAccount;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAnAccount;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @homeWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to MentorMe!'**
  String get homeWelcomeTitle;

  /// No description provided for @homeWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover a new way of learning with one-on-one tutoring sessions tailored to your needs.'**
  String get homeWelcomeDescription;

  /// No description provided for @homeTutorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Find a Tutor'**
  String get homeTutorsTitle;

  /// No description provided for @homeTutorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Search for tutors by subject, ratings, and price.'**
  String get homeTutorsDescription;

  /// No description provided for @homeReservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Reserve a Lesson'**
  String get homeReservationTitle;

  /// No description provided for @homeReservationDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose a subject, select a time slot, and confirm payment.'**
  String get homeReservationDescription;

  /// No description provided for @homeReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Review Your Experience'**
  String get homeReviewTitle;

  /// No description provided for @homeReviewDescription.
  ///
  /// In en, this message translates to:
  /// **'Leave feedback for your tutor to help others decide.'**
  String get homeReviewDescription;

  /// No description provided for @homeGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started!'**
  String get homeGetStarted;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileNoDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get profileNoDataAvailable;

  /// No description provided for @profileBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get profileBalance;

  /// No description provided for @profileClasses.
  ///
  /// In en, this message translates to:
  /// **'Classes'**
  String get profileClasses;

  /// No description provided for @profileSubjects.
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get profileSubjects;

  /// No description provided for @profileNoSubjectsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No subjects available.'**
  String get profileNoSubjectsAvailable;

  /// No description provided for @profileAvailabilities.
  ///
  /// In en, this message translates to:
  /// **'Availabilities'**
  String get profileAvailabilities;

  /// No description provided for @profileNoAvailabilities.
  ///
  /// In en, this message translates to:
  /// **'No availabilities set.'**
  String get profileNoAvailabilities;

  /// No description provided for @lessonListTitle.
  ///
  /// In en, this message translates to:
  /// **'My lessons'**
  String get lessonListTitle;

  /// No description provided for @lessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get lessons;

  /// No description provided for @lessonListNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'No lessons available'**
  String get lessonListNotAvailable;

  /// No description provided for @lessonListNoneFound.
  ///
  /// In en, this message translates to:
  /// **'No lessons found'**
  String get lessonListNoneFound;

  /// No description provided for @lessonStatePending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get lessonStatePending;

  /// No description provided for @lessonStateUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get lessonStateUpcoming;

  /// No description provided for @lessonStateFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get lessonStateFinished;

  /// No description provided for @lessonStateCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get lessonStateCanceled;

  /// No description provided for @lessonTutor.
  ///
  /// In en, this message translates to:
  /// **'Tutor:'**
  String get lessonTutor;

  /// No description provided for @lessonStudent.
  ///
  /// In en, this message translates to:
  /// **'Student:'**
  String get lessonStudent;

  /// No description provided for @lessonStart.
  ///
  /// In en, this message translates to:
  /// **'Start:'**
  String get lessonStart;

  /// No description provided for @lessonEnd.
  ///
  /// In en, this message translates to:
  /// **'End:'**
  String get lessonEnd;

  /// No description provided for @lessonPrice.
  ///
  /// In en, this message translates to:
  /// **'Price:'**
  String get lessonPrice;

  /// No description provided for @lessonDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Lesson Details'**
  String get lessonDetailsTitle;

  /// No description provided for @lessonNoDataError.
  ///
  /// In en, this message translates to:
  /// **'No lesson data.'**
  String get lessonNoDataError;

  /// No description provided for @lessonPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method:'**
  String get lessonPaymentMethod;

  /// No description provided for @lessonState.
  ///
  /// In en, this message translates to:
  /// **'State:'**
  String get lessonState;

  /// No description provided for @lessonSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get lessonSubject;

  /// No description provided for @lessonTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get lessonTags;

  /// No description provided for @lessonNoTags.
  ///
  /// In en, this message translates to:
  /// **'No tags yet.'**
  String get lessonNoTags;

  /// No description provided for @lessonAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get lessonAccept;

  /// No description provided for @lessonDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get lessonDecline;

  /// No description provided for @lessonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get lessonCancel;

  /// No description provided for @lessonAddTag.
  ///
  /// In en, this message translates to:
  /// **'+ Tag'**
  String get lessonAddTag;

  /// No description provided for @lessonReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get lessonReview;

  /// No description provided for @lessonErrorFetchingData.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get lessonErrorFetchingData;

  /// No description provided for @reservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Reservation'**
  String get reservationTitle;

  /// No description provided for @reservationNoOptions.
  ///
  /// In en, this message translates to:
  /// **'No reservation options available.'**
  String get reservationNoOptions;

  /// No description provided for @reservationSelectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get reservationSelectPaymentMethod;

  /// No description provided for @reservationSelectSubject.
  ///
  /// In en, this message translates to:
  /// **'Select Subject'**
  String get reservationSelectSubject;

  /// No description provided for @reservationSelectTimeslot.
  ///
  /// In en, this message translates to:
  /// **'Select Timeslot'**
  String get reservationSelectTimeslot;

  /// No description provided for @reservationNoTimeslotsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No upcoming timeslots available.'**
  String get reservationNoTimeslotsAvailable;

  /// No description provided for @reservationChoosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose a payment method'**
  String get reservationChoosePaymentMethod;

  /// No description provided for @reservationChooseSubject.
  ///
  /// In en, this message translates to:
  /// **'Choose a subject'**
  String get reservationChooseSubject;

  /// No description provided for @reservationReserveLesson.
  ///
  /// In en, this message translates to:
  /// **'Reserve Lesson'**
  String get reservationReserveLesson;

  /// No description provided for @reservationError.
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get reservationError;

  /// No description provided for @reservationErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get reservationErrorUnknown;

  /// No description provided for @subjectsListTitle.
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get subjectsListTitle;

  /// No description provided for @subjectListNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'No subjects available'**
  String get subjectListNotAvailable;

  /// No description provided for @subjectListNoneFound.
  ///
  /// In en, this message translates to:
  /// **'No subjects found'**
  String get subjectListNoneFound;

  /// No description provided for @subjectDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get subjectDetailsTitle;

  /// No description provided for @subjectDetailsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'No details available'**
  String get subjectDetailsUnavailable;

  /// No description provided for @subjectTaughtBy.
  ///
  /// In en, this message translates to:
  /// **'Taught by'**
  String get subjectTaughtBy;

  /// No description provided for @subjectLearnedBy.
  ///
  /// In en, this message translates to:
  /// **'Learned by'**
  String get subjectLearnedBy;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsDarkTheme;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @tutorSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Tutor Search'**
  String get tutorSearchTitle;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @searchMinRate.
  ///
  /// In en, this message translates to:
  /// **'Min Rate'**
  String get searchMinRate;

  /// No description provided for @searchMaxRate.
  ///
  /// In en, this message translates to:
  /// **'Max Rate'**
  String get searchMaxRate;

  /// No description provided for @searchButton.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchButton;

  /// No description provided for @errorFetchingTutors.
  ///
  /// In en, this message translates to:
  /// **'Error fetching the tutors...'**
  String get errorFetchingTutors;

  /// No description provided for @noTutorsFound.
  ///
  /// In en, this message translates to:
  /// **'No tutors found.'**
  String get noTutorsFound;

  /// No description provided for @classesTutoredLabel.
  ///
  /// In en, this message translates to:
  /// **'Classes tutored:'**
  String get classesTutoredLabel;

  /// No description provided for @errorLabel.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get errorLabel;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;
}

class _LocalisationStringsDelegate extends LocalizationsDelegate<LocalisationStrings> {
  const _LocalisationStringsDelegate();

  @override
  Future<LocalisationStrings> load(Locale locale) {
    return SynchronousFuture<LocalisationStrings>(lookupLocalisationStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'et'].contains(locale.languageCode);

  @override
  bool shouldReload(_LocalisationStringsDelegate old) => false;
}

LocalisationStrings lookupLocalisationStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LocalisationStringsEn();
    case 'et': return LocalisationStringsEt();
  }

  throw FlutterError(
    'LocalisationStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
