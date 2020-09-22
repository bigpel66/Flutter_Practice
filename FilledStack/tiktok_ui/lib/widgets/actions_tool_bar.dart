import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tiktok_ui/tiktok_icons.dart';

class ActionsToolBar extends StatelessWidget {
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareIconSize = 25.0;
  static const double ProfileImageSize = 50.0;
  static const double PlusIconSize = 20.0;

  LinearGradient get musicGradient => LinearGradient(
        colors: [
          Colors.grey[800],
          Colors.grey[900],
          Colors.grey[900],
          Colors.grey[800],
        ],
        stops: [0.0, 0.4, 0.6, 1.0],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );

  Widget _getProfilePicture() {
    return Positioned(
      left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        width: ProfileImageSize,
        height: ProfileImageSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ProfileImageSize / 2),
        ),
        child: CachedNetworkImage(
          imageUrl:
              'https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7',
          placeholder: (BuildContext context, String url) =>
              CircularProgressIndicator(),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0.0,
      left: (ActionWidgetSize / 2) - (PlusIconSize / 2),
      child: Container(
        width: PlusIconSize,
        height: PlusIconSize,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Icon(Icons.add, color: Colors.white, size: 20.0),
      ),
    );
  }

  Widget _getFollowAction() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Stack(
        children: <Widget>[
          _getProfilePicture(),
          _getPlusIcon(),
        ],
      ),
    );
  }

  Widget _getSocialAction({IconData icon, String title, bool isShare = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: <Widget>[
          Icon(icon, size: isShare ? 25.0 : 30.0, color: Colors.grey[300]),
          Padding(
              padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
              child: Text(
                title,
                style: TextStyle(fontSize: isShare ? 10.0 : 12.0),
              )),
        ],
      ),
    );
  }

  Widget _getMusicPlayerAction() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(11.0),
            width: ProfileImageSize,
            height: ProfileImageSize,
            decoration: BoxDecoration(
              gradient: musicGradient,
              borderRadius: BorderRadius.circular(ProfileImageSize / 2),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7',
              placeholder: (BuildContext context, String url) =>
                  CircularProgressIndicator(),
              errorWidget: (BuildContext context, String url, dynamic error) =>
                  Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _getFollowAction(),
          _getSocialAction(icon: TikTokIcons.heart, title: '3.2m'),
          _getSocialAction(icon: TikTokIcons.chat_bubble, title: '16.4k'),
          _getSocialAction(
            icon: TikTokIcons.reply,
            title: 'Share',
            isShare: true,
          ),
          _getMusicPlayerAction(),
        ],
      ),
    );
  }
}
