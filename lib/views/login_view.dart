import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_colors.dart';
import 'package:flutter_ecommerce_app/constants/page_padding.dart';
import 'package:flutter_ecommerce_app/service/auth_service.dart';
import 'package:flutter_ecommerce_app/widgets/W_Textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PagePadding.pagePadding,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Login to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: GlobalColors.lightGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: W_Textfield(
                          controller: _emailController,
                          hintText: "email",
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: W_Textfield(
                          controller: _passwordController,
                          obscureText: true,
                          hintText: "password",
                        )),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    style: const ButtonStyle(
                      alignment: Alignment.topRight,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  AuthService().signIn(
                      email: _emailController.text,
                      password: _passwordController.text);
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              )
            ]),
      ),
    );
  }
}
