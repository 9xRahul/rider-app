import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/screens/bloc/login_bloc.dart';
import 'package:taxi_app/screens/bloc/login_state.dart';
import 'package:taxi_app/screens/homeScreen.dart';

class LOginScreen extends StatefulWidget {
  const LOginScreen({super.key});

  @override
  State<LOginScreen> createState() => _LOginScreenState();
}

class _LOginScreenState extends State<LOginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state is AuthSuccessState
            ? HomeScreen()
            : Scaffold(
                body: SingleChildScrollView(
                  child: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessState) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.token)));
                      }

                      if (state is AuthFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.yellow, Colors.black],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            SizedBox(height: 500),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                      LoginApiCallEvent(
                                        username: "mor_2314",
                                        password: "83r5^_",
                                      ),
                                    );
                                  },

                                  child: BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      return state is AuthLoadingState
                                          ? CircularProgressIndicator()
                                          : CircleAvatar(
                                              foregroundColor: Colors.white,
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
