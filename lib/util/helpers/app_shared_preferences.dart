
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static SharedPreferences? _preferences;

  // static const _accessToken = "_accessToken";
  // static const _refreshToken = "_refreshToken";
  static const _isDevelopment = '_isDevelopment';
  static const _cancelBoardingPass = '_cancelBoardingPass';
  static const _language = '_language';
  static const _languageName = '_languageName';
  static const _isEthiopianCalenderEnabled = '_isEthiopianCalenderEnabled';
  static const _deviceId = '_deviceId';
  static const _notificationStatus = '_notificationStatus';
  static const _analyticsStatus = '_analyticsStatus';
  static const _isNewAppVersion = '_isNewAppVersion';

  static const _topDestinationAirportCode = '_topDestinationAirportCode';
  static const _cheapestFareAirportCode = '_cheapestFareAirportCode';
  static const _cheapestFareNumberOfNight = '_cheapestFareNumberOfNight';
  static const _cheapestFareTripType = '_cheapestFareTripType';
  static const _endPoint = '_endPoint';
  static const _microServiceUrl = '_microServiceUrl';
  static const _shebaMilesApiUrl = '_shebaMilesApiUrl';
  static const _defaultAirport = '_defaultAirport';
  static const _isDefaultAirportSetByUser = '_isDefaultAirportSetByUser';
  static const _isAppVersionMessageRead = '_isAppVersionMessageRead';

  static const _completedProfilePercentage = '_completedProfilePercentage';
  static const _statusMilesForTheNextTier = '_statusMilesForTheNextTier';
  static const _qualifyingSegmentForTheNextTier =
      '_qualifyingSegmentForTheNextTier';
  static const _nextTierLevel = '_nextTierLevel';
  static const _milesExpirationDate = '_milesExpirationDate';
  static const _currentQalfiyingSegment = '_currentQalfiyingSegment';
  static const _milesAmountToExpiry = '_milesAmountToExpiry';
  static const _awardMiles = '_awardMiles';
  static const _statusMiles = '_statusMiles';
  static const _curStatusMiles = '_curStatusMiles';
  static const _currentTierLevel = '_currentTierLevel';
  static const _highestLevel = '_highestLevel';
  static const _flyerID = '_flyerID';
  static const _userName = '_userName';
  static const _shebaMilesAccessToken = '_shebaMilesAccessToken';
  static const _shebaMilesAccessExpireDate = '_shebaMilesAccessExpireDate';
  static const _loginType = '_loginType';
  static const _firstName = '_firstName';
  static const _middleName = '_middleName';
  static const _lastName = '_lastName';
  static const _title = '_title';
  static const _gender = '_gender';
  static const _birthDate = '_birthDate';
  static const _emailAddress = '_emailAddress';
  static const _phoneNumber = '_phoneNumber';
  static const _phoneCountryCode = '_phoneCountryCode';
  static const _enrollmentDate = '_enrollmentDate';
  static const _consent_checked = '_consent_checked';
  static const _consent_Email_Marketing = '_consent_Email_Marketing';
  static const _consent_ETHoliday = '_consent_ETHoliday';
  static const _consent_Newsletter = '_consent_Newsletter';
  static const _consent_SMS = '_consent_SMS';
  static const _stayLoggedIn = '_stayLoggedIn';
  static const _firstPage = '_firstPage';
  static const _upcomingLastRefreshedAt = '_upcomingLastRefreshedAt';
  static const _shebaMilesTripsLastRefreshedAt = '_shebaMilesTripsLastRefreshedAt';
  static const _pastLastRefreshedAt = '_pastLastRefreshedAt';
  static const _riskifiedSessionID = '_riskifiedSessionID';
  static const _memberCity = '_memberCity';
  static const _memberCountry = '_memberCountry';
  static const _memberCountryCode = '_memberCountryCode';
  static const _memberProvince = '_memberProvince';
  static const _memberAddressLine1 = '_memberAddressLine1';
  static const _memberZip = '_memberZip';
  static const _feedbackSent = '_feedbackSent';
  static const _newFeatureMileCalculator = '_newFeatureMileCalculator';
  static const _newFeatureBaggageStatus = '_newFeatureBaggageStatus';
  static const _newFeatureStartLounge = '_newFeatureStartLounge';
  static const _newFeatureStopOverAtAddis = '_newFeatureStopOverAtAddis';
  static const _newFeatureSaveToCaledar = '_newFeatureSaveToCaledar';

  static const _flightAvailabilityTutorial = '_flightAvailabilityTutorial';
  static const _seatMapTutorial = '_seatMapTutorial';
  static const _homePageModalScrollTutorial = '_homePageModalScrollTutorial';
  static const _myTripMenuTutorial = '_myTripMenuTutorial';
  static const _myTripFlightSegmentsScrollTutorial =
      '_myTripFlightSegmentsScrollTutorial';
  static const _checkInSummaryTutorial = '_checkInSummaryTutorial';
  static const _privacyPolicyAccepted = '_privacyPolicyAccepted';
  static const _newBaggageStatus = '_newBaggageStatus';
  static const _flightNotificationConsent = '_flightNotificationConsent';
  static const _shebaMilesNotificationConsent = '_shebaMilesNotificationConsent';
  static const _promotionalNotificationConsent = '_promotionalNotificationConsent';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

//access token
//   static Future setAccessToken(String value) async =>
//       await _preferences?.setString(_accessToken, value);
//
//   static getAccessToken() => _preferences?.getString(_accessToken);
//
//   //refresh token
//   static Future setRefreshToken(String value) async =>
//       await _preferences?.setString(_refreshToken, value);
//
//   static getRefreshToken() => _preferences?.getString(_refreshToken);

  //is development
  static Future setFlightNotificationConsent(bool value) async =>
      await _preferences?.setBool(_flightNotificationConsent, value);

  static getFlightNotificationConsent() =>
      _preferences?.getBool(_flightNotificationConsent);

  static Future setPromotionalNotificationConsent(bool value) async =>
      await _preferences?.setBool(_promotionalNotificationConsent, value);

  static getPromotionalNotificationConsent() =>
      _preferences?.getBool(_promotionalNotificationConsent);

  static Future setShebaMilesNotificationConsent(bool value) async =>
      await _preferences?.setBool(_shebaMilesNotificationConsent, value);

  static getShebaMilesNotificationConsent() =>
      _preferences?.getBool(_shebaMilesNotificationConsent);




  static Future setIsPrivacyPolicyAccepted(bool value) async =>
      await _preferences?.setBool(_privacyPolicyAccepted, value);

  static getIsPrivacyPolicyAccepted() =>
      _preferences?.getBool(_privacyPolicyAccepted);

  static Future setFeatureMileCalculator(bool value) async =>
      await _preferences?.setBool(_newFeatureMileCalculator, value);

  static getFeatureMileCalculator() =>
      _preferences?.getBool(_newFeatureMileCalculator);

  static Future setFeatureStopOverAtAddis(bool value) async =>
      await _preferences?.setBool(_newFeatureStopOverAtAddis, value);

  static getFeatureStopOverAtAddis() =>
      _preferences?.getBool(_newFeatureStopOverAtAddis);

  static Future setFeatureSaveToCalendar(bool value) async =>
      await _preferences?.setBool(_newFeatureSaveToCaledar, value);

  static getFeatureSaveToCalendar() =>
      _preferences?.getBool(_newFeatureSaveToCaledar);

  static Future setFeatureBaggageStatus(bool value) async =>
      await _preferences?.setBool(_newFeatureBaggageStatus, value);

  static getFeatureBaggageStatus() =>
      _preferences?.getBool(_newFeatureBaggageStatus);

  static Future setNewBaggageStatus(bool value) async =>
      await _preferences?.setBool(_newBaggageStatus, value);

  static getNewBaggageStatus() =>
      _preferences?.getBool(_newBaggageStatus);

  static Future setFeatureStartLounge(bool value) async =>
      await _preferences?.setBool(_newFeatureStartLounge, value);

  static getFeatureStartLounge() =>
      _preferences?.getBool(_newFeatureStartLounge);

  static Future setHomePageModalScrollTutorial(bool value) async =>
      await _preferences?.setBool(_homePageModalScrollTutorial, value);

  static getHomePageModalScrollTutorial() =>
      _preferences?.getBool(_homePageModalScrollTutorial);

  static Future setFlightAvailabilityTutorial(bool value) async =>
      await _preferences?.setBool(_flightAvailabilityTutorial, value);

  static getFlightAvailabilityTutorial() =>
      _preferences?.getBool(_flightAvailabilityTutorial);

  static Future setSeatMapTutorial(bool value) async =>
      await _preferences?.setBool(_seatMapTutorial, value);

  static getSeatMapTutorial() => _preferences?.getBool(_seatMapTutorial);

  static Future setMyTripFlightSegmentsScrollTutorial(bool value) async =>
      await _preferences?.setBool(_myTripFlightSegmentsScrollTutorial, value);

  static getMyTripFlightSegmentsScrollTutorial() =>
      _preferences?.getBool(_myTripFlightSegmentsScrollTutorial);

  static Future setMyTripMenuTutorial(bool value) async =>
      await _preferences?.setBool(_myTripMenuTutorial, value);

  static getMyTripMenuTutorial() => _preferences?.getBool(_myTripMenuTutorial);

  static Future setCheckInSummaryTutorial(bool value) async =>
      await _preferences?.setBool(_checkInSummaryTutorial, value);

  static getCheckInSummaryTutorial() =>
      _preferences?.getBool(_checkInSummaryTutorial);

  static Future setIsDevelopment(bool value) async =>
      await _preferences?.setBool(_isDevelopment, value);

  static getIsDevelopment() => _preferences?.getBool(_isDevelopment);

  static Future setCancelBoardingPass(bool value) async =>
      await _preferences?.setBool(_cancelBoardingPass, value);

  static getCancelBoardingPass() => _preferences?.getBool(_cancelBoardingPass);
  //is endPoint
  static Future setEndPoint(String value) async =>
      await _preferences?.setString(_endPoint, value);

  static getEndPoint() => _preferences?.getString(_endPoint);

  static Future setFeedbackSent(bool value) async =>
      await _preferences?.setBool(_feedbackSent, value);

  static getFeedbackSent() => _preferences?.getBool(_feedbackSent);

  //language
  static Future setLanguage(String value) async =>
      await _preferences?.setString(_language, value);

  static Future setLanguageName(String value) async =>
      await _preferences?.setString(_languageName, value);

  static getLanguage() => _preferences?.getString(_language);

  static getLanguageName() => _preferences?.getString(_languageName);

  static Future setIsEthiopianCalenderEnabled(bool value) async =>
      await _preferences?.setBool(_isEthiopianCalenderEnabled, value);

  static getIsEthiopianCalenderEnabled() =>
      _preferences?.getBool(_isEthiopianCalenderEnabled) ?? false;

  //device Id
  static Future setDeviceId(String value) async =>
      await _preferences?.setString(_deviceId, value);

  static getDeviceId() => _preferences?.getString(_deviceId);

  //Notification
  static Future setNotificationStatus(bool value) async =>
      await _preferences?.setBool(_notificationStatus, value);

  static getNotificationStatus() => _preferences?.getBool(_notificationStatus);
  //Analytics
  static Future setAnalyticsStatus(bool value) async =>
      await _preferences?.setBool(_analyticsStatus, value);

  static getAnalyticsStatus() => _preferences?.getBool(_analyticsStatus);
  //Top destination
  static Future setTopDestinationAirportCode(String value) async =>
      await _preferences?.setString(_topDestinationAirportCode, value);

  static getTopDestinationAirportCode() =>
      _preferences?.getString(_topDestinationAirportCode);

  //Cheapest fare
  static Future setCheapestFareAirportCode(String value) async =>
      await _preferences?.setString(_cheapestFareAirportCode, value);

  static getCheapestFareAirportCode() =>
      _preferences?.getString(_cheapestFareAirportCode);

  static Future setCheapestFareNumberOfNight(int value) async =>
      await _preferences?.setInt(_cheapestFareNumberOfNight, value);

  static getCheapestFareNumberOfNight() =>
      _preferences?.getInt(_cheapestFareNumberOfNight);

  static Future setCheapestFareTripType(int value) async =>
      await _preferences?.setInt(_cheapestFareTripType, value);

  static getCheapestFareTripType() =>
      _preferences?.getInt(_cheapestFareTripType);

  static getMicroServiceUrl() => _preferences?.getString(_microServiceUrl);

  static setMicroServiceUrl(String value) =>
      _preferences?.setString(_microServiceUrl, value);

  static getShebaMilesApiUrl() => _preferences?.getString(_shebaMilesApiUrl);

  static setShebaMilesApiUrl(String value) =>
      _preferences?.setString(_shebaMilesApiUrl, value);

  static getDefaultAirport() => _preferences?.getString(_defaultAirport);

  static setDefaultAirport(String value) =>
      _preferences?.setString(_defaultAirport, value);

  static getIsDefaultAirportSetByUser() =>
      _preferences?.getBool(_isDefaultAirportSetByUser);

  static setIsDefaultAirportSetByUser(bool value) =>
      _preferences?.setBool(_isDefaultAirportSetByUser, value);

  static getIsAppVersionMessageRead() =>
      _preferences?.getBool(_isAppVersionMessageRead);

  static setIsAppVersionMessageRead(bool value) =>
      _preferences?.setBool(_isAppVersionMessageRead, value);

  static getFlyerID() => _preferences?.getString(_flyerID);

  static setFlyerID(String value) => _preferences?.setString(_flyerID, value);

  static Future setShebaMilesAccessToken(String value) async =>
      await _preferences?.setString(_shebaMilesAccessToken, value);
  static getShebaMilesAccessToken() =>
      _preferences?.getString(_shebaMilesAccessToken);

  static Future setShebaMilesAccessExpireDate(String value) async =>
      await _preferences?.setString(_shebaMilesAccessExpireDate, value);
  static getShebaMilesAccessExpireDate() =>
      _preferences?.getString(_shebaMilesAccessExpireDate);

  static Future setLoginType(String value) async =>
      await _preferences?.setString(_loginType, value);
  static getLoginType() => _preferences?.getString(_loginType);

  static Future setFirstName(String value) async =>
      await _preferences?.setString(_firstName, value);
  static getFirstName() => _preferences?.getString(_firstName);

  static Future setMiddleName(String value) async =>
      await _preferences?.setString(_middleName, value);
  static getMiddleName() => _preferences?.getString(_middleName);

  static Future setLastName(String value) async =>
      await _preferences?.setString(_lastName, value);
  static getLastName() => _preferences?.getString(_lastName);

  static Future setTitle(String value) async =>
      await _preferences?.setString(_title, value);
  static getTitle() => _preferences?.getString(_title);

  static Future setGender(String value) async =>
      await _preferences?.setString(_gender, value);
  static getGender() => _preferences?.getString(_gender);

  static Future setBirthDate(String value) async =>
      await _preferences?.setString(_birthDate, value);
  static getBirthDate() => _preferences?.getString(_birthDate);

  static Future setEmailAddress(String value) async =>
      await _preferences?.setString(_emailAddress, value);
  static getEmailAddress() => _preferences?.getString(_emailAddress);

  static Future setPhoneNumber(String value) async =>
      await _preferences?.setString(_phoneNumber, value);
  static getPhoneNumber() => _preferences?.getString(_phoneNumber);

  static Future setPhoneCountryCode(String value) async =>
      await _preferences?.setString(_phoneCountryCode, value);
  static getPhoneCountryCode() => _preferences?.getString(_phoneCountryCode);

  static Future setEnrollmentDate(String value) async =>
      await _preferences?.setString(_enrollmentDate, value);
  static getEnrollmentDate() => _preferences?.getString(_enrollmentDate);

  static Future setConsent_checked(bool value) async =>
      await _preferences?.setBool(_consent_checked, value);
  static getConsent_checked() => _preferences?.getBool(_consent_checked);

  static Future setConsent_Email_Marketing(bool value) async =>
      await _preferences?.setBool(_consent_Email_Marketing, value);
  static getConsent_Email_Marketing() =>
      _preferences?.getBool(_consent_Email_Marketing);

  static Future setConsent_ETHoliday(bool value) async =>
      await _preferences?.setBool(_consent_ETHoliday, value);
  static getConsent_ETHoliday() => _preferences?.getBool(_consent_ETHoliday);

  static Future setConsent_Newsletter(bool value) async =>
      await _preferences?.setBool(_consent_Newsletter, value);
  static getConsent_Newsletter() => _preferences?.getBool(_consent_Newsletter);

  static Future setConsent_SMS(bool value) async =>
      await _preferences?.setBool(_consent_SMS, value);
  static getConsent_SMS() => _preferences?.getBool(_consent_SMS);

  static Future setAwardMiles(int value) async =>
      await _preferences?.setInt(_awardMiles, value);
  static getAwardMiles() => _preferences?.getInt(_awardMiles);

  static Future setStatusMiles(int value) async =>
      await _preferences?.setInt(_statusMiles, value);
  static getStatusMiles() => _preferences?.getInt(_statusMiles);

  static Future setCurStatusMiles(int value) async =>
      await _preferences?.setInt(_curStatusMiles, value);
  static getCurStatusMiles() => _preferences?.getInt(_curStatusMiles);

  static Future setCurrentTierLevel(String value) async =>
      await _preferences?.setString(_currentTierLevel, value);
  static getCurrentTierLevel() => _preferences?.getString(_currentTierLevel);

  static Future setHighestLevel(bool value) async =>
      await _preferences?.setBool(_highestLevel, value);
  static getHighestLevel() => _preferences?.getBool(_highestLevel);

  static Future setStayLoggedIn(bool value) async =>
      await _preferences?.setBool(_stayLoggedIn, value);
  static getStayLoggedIn() => _preferences?.getBool(_stayLoggedIn);

  static Future setUserName(String value) async =>
      await _preferences?.setString(_userName, value);
  static getUserName() => _preferences?.getString(_userName);

  static Future setCompletedProfilePercentage(double value) async =>
      await _preferences?.setDouble(_completedProfilePercentage, value);
  static getCompletedProfilePercentage() =>
      _preferences?.getDouble(_completedProfilePercentage);

  static Future setStatusMilesForTheNextTier(int value) async =>
      await _preferences?.setInt(_statusMilesForTheNextTier, value);
  static getStatusMilesForTheNextTier() =>
      _preferences?.getInt(_statusMilesForTheNextTier);

  static Future setQualifyingSegmentForTheNextTier(int value) async =>
      await _preferences?.setInt(_qualifyingSegmentForTheNextTier, value);
  static getQualifyingSegmentForTheNextTier() =>
      _preferences?.getInt(_qualifyingSegmentForTheNextTier);

  static Future setNextTierLevel(String value) async =>
      await _preferences?.setString(_nextTierLevel, value);
  static getNextTierLevel() => _preferences?.getString(_nextTierLevel);

  static Future setMilesExpirationDate(String value) async =>
      await _preferences?.setString(_milesExpirationDate, value);
  static getMilesExpirationDate() =>
      _preferences?.getString(_milesExpirationDate);

  static Future setCurrentQalfiyingSegment(int value) async =>
      await _preferences?.setInt(_currentQalfiyingSegment, value);
  static getCurrentQalfiyingSegment() =>
      _preferences?.getInt(_currentQalfiyingSegment);

  static Future setMilesAmountToExpiry(int value) async =>
      await _preferences?.setInt(_milesAmountToExpiry, value);
  static getMilesAmountToExpiry() => _preferences?.getInt(_milesAmountToExpiry);
  //language
  static Future setFirsPage(bool value) async =>
      await _preferences?.setBool(_firstPage, value);
  static getFirsPage() => _preferences?.getBool(_firstPage);

  static Future setUpcomingLastRefreshedAt(String value) async =>
      await _preferences?.setString(_upcomingLastRefreshedAt, value);
  static getUpcomingLastRefreshedAt() =>
      _preferences?.getString(_upcomingLastRefreshedAt);

  static Future setShebaMilesTripsLastRefreshedAt(String value) async =>
      await _preferences?.setString(_shebaMilesTripsLastRefreshedAt, value);
  static getShebaMilesTripsLastRefreshedAt() =>
      _preferences?.getString(_shebaMilesTripsLastRefreshedAt);


  static Future setPastLastRefreshedAt(String value) async =>
      await _preferences?.setString(_pastLastRefreshedAt, value);
  static getPastLastRefreshedAt() =>
      _preferences?.getString(_pastLastRefreshedAt);

  static Future setRiskifiedSessionID(String value) async =>
      await _preferences?.setString(_riskifiedSessionID, value);
  static getRiskifiedSessionID() =>
      _preferences?.getString(_riskifiedSessionID);

  static Future setMemberCity(String value) async =>
      await _preferences?.setString(_memberCity, value);
  static getMemberCity() => _preferences?.getString(_memberCity);

  static Future setMemberCountry(String value) async =>
      await _preferences?.setString(_memberCountry, value);
  static getMemberCountry() => _preferences?.getString(_memberCountry);

  static Future setMemberCountryCode(String value) async =>
      await _preferences?.setString(_memberCountryCode, value);
  static getMemberCountryCode() => _preferences?.getString(_memberCountryCode);

  static Future setMemberProvince(String value) async =>
      await _preferences?.setString(_memberProvince, value);
  static getMemberProvince() => _preferences?.getString(_memberProvince);

  static Future setMemberAddressLine1(String value) async =>
      await _preferences?.setString(_memberAddressLine1, value);
  static getMemberAddressLine1() =>
      _preferences?.getString(_memberAddressLine1);

  static Future setMemberZip(String value) async =>
      await _preferences?.setString(_memberZip, value);
  static getMemberZip() => _preferences?.getString(_memberZip);

  static Future setNewAppVersion(String value) async =>
      await _preferences?.setString(_isNewAppVersion, value);
  static getNewAppVersion() => _preferences?.getString(_isNewAppVersion);
}
