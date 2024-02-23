import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/OnlineShoping/Provider/cart.dart';
import 'package:todo_app/OnlineShoping/Provider/model.dart';
import 'package:todo_app/OnlineShoping/Screens/landing.dart';
import 'package:todo_app/OnlineShoping/Widgets/styledButton.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Stock(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Shopping',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'AASTU Online Shopping',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'aastu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: '123',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (_passwordController.text == "123" &&
                      _usernameController.text == "aastu") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ShoppingPage()));
                  }
                }
              },
              child: styledButton(
                  'Login', width * 0.3, Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
