import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final image_url =  "https://media.licdn.com/dms/image/v2/D5603AQFAzEA7AZyPqA/profile-displayphoto-scale_400_400/B56ZhKL3mYHkAg-/0/1753591284290?e=1761177600&v=beta&t=ZW5QgxjsMVPqNluDTrgtzcNqVDfDAEqNoWZNeL72dIs";
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture:CircleAvatar(
                backgroundImage: NetworkImage(image_url),
              ),
              accountName: Text("Shashank"), 
              accountEmail: Text("shashank@gmail.com"),
              )
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white,),
            title: Text("Home",textScaler: TextScaler.linear(1.2) ,style: TextStyle(color: Colors.white,),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
            title: Text("Profile",textScaler: TextScaler.linear(1.2) ,style: TextStyle(color: Colors.white,),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white,),
            title: Text("Email Me",textScaler: TextScaler.linear(1.2) ,style: TextStyle(color: Colors.white,),),
          ),
        ],
      ),
    );
  }
}