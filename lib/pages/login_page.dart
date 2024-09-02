import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/user_login/user_login_bloc.dart';
import 'package:flutter_consume_api/models/user_login.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserLoginBloc userLoginBloc = context.read<UserLoginBloc>();

    TextEditingController usernameControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();

    final screenVertical = MediaQuery.of(context).size.height;
    final screenHorizontal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(widget: Text("Login Page")),
      body: BlocConsumer<UserLoginBloc, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is UserLoginSuccess) {
            Navigator.pushReplacementNamed(
              context,
              "/homepage",
            );
          }
        },
        listenWhen: (previous, current) {
          return current is UserLoginError || current is UserLoginSuccess;
        },
        builder: (context, state) {
          if (state is UserLoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: SizedBox(
              height: screenVertical * 0.5,
              width: screenHorizontal * 0.8,
              child: Card(
                elevation: 5,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.login,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: usernameControler,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordControler,
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          suffixIcon: Icon(Icons.visibility),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          userLoginBloc.add(
                            LoginUser(
                              userLogin: UserLogin(
                                username: usernameControler.text,
                                password: passwordControler.text,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Tidak punya akun?"),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Register disini",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
