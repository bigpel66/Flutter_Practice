import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser userInfo;

  HomePage({this.userInfo});

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        'Instagram Simple',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('사진과 동영상을 보려면 팔로우 하세요.'),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 8.0),
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                userInfo.photoUrl,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            userInfo.email,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(userInfo.displayName),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text('Facebook 친구'),
                          const SizedBox(height: 8.0),
                          RaisedButton(
                            child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () => {},
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
