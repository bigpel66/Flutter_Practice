import 'package:flutter/widgets.dart';

class TikTokIcons {
  // named private constructor
  // prevent instantiate from outside
  // if there are no named or default constructor, this class cannot be instantiated
  TikTokIcons._();

  static const _kFontFamily = 'TikTokIcons';

  static const IconData chat_bubble = IconData(
    0xe808,
    fontFamily: _kFontFamily,
  );

  static const IconData create = IconData(
    0xe809,
    fontFamily: _kFontFamily,
  );

  static const IconData heart = IconData(
    0xe80a,
    fontFamily: _kFontFamily,
  );

  static const IconData home = IconData(
    0xe80b,
    fontFamily: _kFontFamily,
  );

  static const IconData messages = IconData(
    0xe80c,
    fontFamily: _kFontFamily,
  );

  static const IconData profile = IconData(
    0xe80d,
    fontFamily: _kFontFamily,
  );

  static const IconData reply = IconData(
    0xe80e,
    fontFamily: _kFontFamily,
  );

  static const IconData search = IconData(
    0xe80f,
    fontFamily: _kFontFamily,
  );
}
