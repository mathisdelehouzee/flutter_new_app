import 'package:flutter/material.dart';
import 'package:uride/login_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  int selectedIndex = 0;
  Widget _MyProfile = MyProfile();
  Widget _MyMaps = MyMaps();
  Widget _MyLogout = MyLogout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to URIDE"),
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Logout",
          )
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._MyProfile;
    } else if (this.selectedIndex == 1) {
      return this._MyMaps;
    } else {
      return this._MyLogout;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            backgroundImage: NetworkImage('assets/ac-arno-dorian.jpg'),
          )),
    );

    final username = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Jean Durant',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );

    final useremail = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'jeanneymar.durant@outlook.com',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            avatar,
            username,
            useremail,
          ],
        ),
      ),
    ));
    ;
  }
}

class MyMaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Connect to the MAP"));
  }
}

class MyLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonLogout = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Logout',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () => {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()))
          },
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[buttonLogout],
        ),
      ),
    ));
  }
}
