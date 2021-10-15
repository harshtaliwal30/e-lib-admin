import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AppDeviceScreenType { MOBILE, TABLET, DESKTOP }

/*
DT = DeviceType

 */

/// Helper class to manage the Dynamic padding, margin and font size value

class SizeConfig {
  //initOnStartUp
  static MediaQueryData mediaQuery = MediaQueryData();
  static AppDeviceScreenType appDeviceScreenType = AppDeviceScreenType.MOBILE;

  static bool get defaultPortrait => _defaultPortrait();

  static bool get isMobile => appDeviceScreenType == AppDeviceScreenType.MOBILE;

  static bool get isTablet => appDeviceScreenType == AppDeviceScreenType.TABLET;

  static bool get isDesktop =>
      appDeviceScreenType == AppDeviceScreenType.DESKTOP;

  static double portraitWidth = 0.0;
  static double portraitHeight = 0.0;
  static const int IMAGE_FRAME_DURATION = 400;
  static const double QUESTION_IMAGE_RATIO = 1.666666667;

  //Constant Padding Values
  static const double PADDING_ZERO = 0;
  static const double PADDING_EXTRA_SMALL = 1;
  static const double PADDING_SMALL_TEXT_BUTTON = 2;
  static const double PADDING_SMALL = 4;
  static const double PADDING_MEDIUM = 8;
  static const double PADDING_MEDIUM_LARGE = 16;
  static const double PADDING_LARGE = 32;
  static const double PADDING_EXTRA_EXTRA_LARGE = 48;

  //Constant Margin Values
  static const double MARGIN_ZERO = 0;
  static const double MARGIN_EXTRA_SMALL = 1;
  static const double MARGIN_SMALL = 4;
  static const double MARGIN_MEDIUM = 8;
  static const double MARGIN_MEDIUM_LARGE = 16;
  static const double MARGIN_LARGE = 32;
  static const double MARGIN_EXTRA_LARGE = 40;
  static const double MARGIN_EXTRA_EXTRA_LARGE = 48;

  //Constant FontFActorSize Values
  static const double FFS_EXTRA_SMALL = 2.5;
  static const double FFS_SMALL = 3;
  static const double FFS_SMALL_MEDIUM = 3.2;
  static const double FFS_SMALL_LARGE = 3.5;
  static const double FFS_MEDIUM = 4;
  static const double FFS_MEDIUM_LARGE = 4.5;
  static const double FFS_LARGE = 5;
  static const double FFS_EXTRA_LARGE = 6;

  //Constant IconSize Values
  static const double ICON_SIZE_MEDIUM = 16;
  static const double ICON_SIZE_MEDIUM_LARGE = 20;
  static const double ICON_SIZE_LARGE = 24;
  static const double ICON_SIZE_EXTRA_LARGE = 32;

  //orientation sensitive
  static Orientation get orientation => mediaQuery.orientation;

  static double get screenWidth => mediaQuery.size.width;

  static double get screenHeight => mediaQuery.size.height;

  static double get blockSizeHorizontal => screenWidth / 100;

  static double get blockSizeVertical => screenHeight / 100;

  static double get safeBlockHorizontal =>
      (screenWidth - _safeAreaHorizontal) / 100;

  static double get safeBlockVertical =>
      (screenHeight - _safeAreaVertical) / 100;

  static double get baseFontSize =>
      _getFontSize(mediaQuery, _safeAreaHorizontal, _safeAreaVertical);

  static double get kDefaultPadding =>
      isMobile ? PADDING_MEDIUM : PADDING_MEDIUM_LARGE;

  static double get kDefaultMargin =>
      isMobile ? MARGIN_MEDIUM : MARGIN_MEDIUM_LARGE;

  static double get appBarHeight => isMobile ? kToolbarHeight : 90;

  static double get bottomBarHeight => kBottomNavigationBarHeight;

  static double get bottomExamBarHeight => kBottomNavigationBarHeight - 8;

  static double get defaultRowHeight => isMobile ? 60 : 90;

  static double get iconExamHeightAndWidth => isMobile ? 30 : 60;

  static double get iconGeneralHeightAndWidth => isMobile ? 30 : 60;

  static double get _safeAreaHorizontal =>
      mediaQuery.padding.left + mediaQuery.padding.right;

  static double get _safeAreaVertical =>
      mediaQuery.padding.top + mediaQuery.padding.bottom;

  // DT   //icon, margin padding,
  static double adjustByDT(double logicalPixels) {
    if (isMobile) return logicalPixels;
    return logicalPixels * 2;
  }

  static void initOnStartUp(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    if (mediaQuery.orientation == Orientation.landscape) {
      portraitWidth = mediaQuery.size.height;
      portraitHeight = mediaQuery.size.width;
    } else {
      portraitWidth = mediaQuery.size.width;
      portraitHeight = mediaQuery.size.height;
    }

    appDeviceScreenType = _calculateDeviceScreenType(portraitWidth);
  }
}

bool _defaultPortrait() {
  return SizeConfig.isMobile;
}

AppDeviceScreenType _calculateDeviceScreenType(double portraitWidth) {
  if (portraitWidth > 900) {
    return AppDeviceScreenType.DESKTOP;
  }
  if (portraitWidth > 600) {
    return AppDeviceScreenType.TABLET;
  }
  return AppDeviceScreenType.MOBILE;
}

double _getFontSize(
    MediaQueryData mq, double safeAreaHorizontal, double safeAreaVertical) {
  // if (ml.apt(mlTopic.CP)) ml.CP('${mq.orientation}');
  if (mq.orientation == Orientation.portrait) {
    if (mq.size.width > 600.0) {
      return ((mq.size.width / 1.5) - safeAreaHorizontal) / 100;
    }
  } else {
    if (mq.size.height > 850.0) {
      return ((mq.size.height / 1.5) - safeAreaVertical) / 100;
    } else {
      return (mq.size.height - safeAreaVertical) / 100;
    }
  }
  return (mq.size.width - safeAreaHorizontal) / 100;
}
