import 'package:flutter/material.dart';
import 'package:ui/widgets/Home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset("images/login.png"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Hello",
              style: TextStyle(
                  fontFamily: AutofillHints.countryCode,
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.greenAccent,
                    hintText: "User Name",
                    icon: Icon(Icons.person_2_rounded),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Color.fromARGB(255, 241, 137, 10),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.greenAccent,
                    hintText: "Password",
                    icon: Icon(Icons.security),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Color.fromARGB(255, 241, 137, 10),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ));
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
