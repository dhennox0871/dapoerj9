import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/logodj9.png",
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "Dapoer J9",
                          style: GoogleFonts.kaushanScript(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        QTextField(
                          label: "Email",
                          hint: "Your email",
                          validator: Validator.email,
                          suffixIcon: Icons.email,
                          value: controller.email,
                          onChanged: (value) {
                            controller.email = value;
                          },
                        ),
                        QTextField(
                          label: "Password",
                          hint: "Your password",
                          obscure: true,
                          validator: Validator.required,
                          suffixIcon: Icons.password,
                          value: controller.password,
                          onChanged: (value) {
                            controller.password = value;
                          },
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () => controller.doLogin(),
                            child: const Text("Login"),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                            ),
                            onPressed: () => controller.doLoginGoogle(),
                            child: const Text("Login With Google"),
                          ),
                        ),
                      ],
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
  State<LoginView> createState() => LoginController();
}
