import 'package:event_kampus/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[400]!, Colors.blue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Buat Akun",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Username", icon: new Icon(Icons.person)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap", icon: new Icon(Icons.badge)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "NIM", icon: new Icon(Icons.school)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "No. Hp", icon: new Icon(Icons.phone)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", icon: new Icon(Icons.lock)),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      // ini nagivasi
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    },
                    child: Text("Daftar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
