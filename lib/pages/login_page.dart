import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/user_login/user_login_bloc.dart';
import 'package:flutter_consume_api/models/user_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameControler;
  late TextEditingController passwordControler;

  bool isLoading = false; // state untuk indikator loading

  @override
  void initState() {
    super.initState();
    usernameControler = TextEditingController();
    passwordControler = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameControler.dispose();
    passwordControler.dispose();
  }

  void _login() {
    setState(() {
      isLoading = true; // tampilkan circular progress indicator
    });

    UserLoginBloc userLoginBloc = context.read<UserLoginBloc>();
    userLoginBloc.add(
      LoginUser(
        userLogin: UserLogin(
          // username: emiliys
          // password: emiliyspass
          username: usernameControler.text,
          password: passwordControler.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenVertical = MediaQuery.of(context).size.height;
    final screenHorizontal = MediaQuery.of(context).size.width;

    return GestureDetector(
      // ! untuk menghilangkan keyboard ketika di klik
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // ! Agar tidak bottom overflow ketika keyboard muncul
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<UserLoginBloc, UserLoginState>(
          listener: (context, state) {
            if (state is UserLoginError) {
              setState(() {
                isLoading = false; // ? hentikan loading jika error
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is UserLoginSuccess) {
              setState(() {
                isLoading = false; // ? hentikan loading jika sukses
              });
              Navigator.pushReplacementNamed(context, "/home");
            }
          },
          listenWhen: (previous, current) {
            return current is UserLoginError || current is UserLoginSuccess;
          },
          builder: (context, state) {
            if (state is UserLoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: IntrinsicHeight(
                child: Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenHorizontal * 0.05,
                  ),
                  elevation: 5,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          "Hi there!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          "assets/login.png",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          height: screenVertical * 0.3,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: usernameControler,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => _login(),
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Lupa Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        isLoading
                            ? const CircularProgressIndicator() // tampilkan loading jika isLoading true
                            : ElevatedButton(
                                onPressed: () {
                                  _login();
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
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("atau masuk dengan"),
                            SizedBox(width: 10),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/facebook.png",
                              height: screenVertical * 0.05,
                              width: screenHorizontal * 0.1,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Image.asset(
                              "assets/google.png",
                              height: screenVertical * 0.05,
                              width: screenHorizontal * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ],
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
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
