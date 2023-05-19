import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covid_19/pages/login_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences userdata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    userdata = await SharedPreferences.getInstance();
    setState(() {
      username = userdata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15.0),
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/faqifoto.jpg'),
            ),
            Text(
              "${widget.username}\n NIM : 123200146\n HOBI : FUTSAL\n TPM IF-B",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
            ),
            ElevatedButton(
              onPressed: () {
                userdata.setBool('status', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
