import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfechotranasmartvillage/features/authentication/domain/model/auth_user.dart';
import 'package:pfechotranasmartvillage/features/authentication/presentation/widgets/subwidgets/saveWidgetButton.dart';
import 'package:pfechotranasmartvillage/features/authentication/presentation/widgets/subwidgets/textFieldWidget.dart';

import '../../../../../core/dependencies_injection.dart';
import 'bloc/login_bloc.dart';
class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    initDependencies() ;
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF2B6353),
      ),*/
      body: MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(
            //getIt<CreateUseCase>()
          ),
        ),
      ], child: Login()),
    );
  }
}


class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F7774),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
      body: Form(
        key: _formKey,
        child: Stack(children: [
          //Container(
           // color: const Color(0xFF1F7774),
            //  ),
          Column(
            children: [
              Expanded(flex: 0, child: Container()),
              Expanded(
                  flex: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0))),
                  )),
            ],
          ),
          Container(
            //color: const Color(0xFF2B6353),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Image(image: AssetImage('assets/login_image.png')),
                    SizedBox(height: 30,),

                    Text('Connexion',style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F7774)
                    ),),
                    const SizedBox(
                      height: 15,
                    ),

                    TextFieldWidget(


                        /*validator: (value) {
                          debugPrint('I bring the value $value');
                          if (value == null || value.isEmpty) {
                            return 'Champ email est vide';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Entrer un email valide';
                          }
                          return null;
                        },*/
                        borderInput:  OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        controller: usernameController,
                        isTextObscure: false,
                        placeholder: "Nom d'utilisateur",
                        iconPrefix: Icon(Icons.email_outlined),
                        colorInputField: Color(0xFFD9D9D9)),

                    TextFieldWidget(
                        validator: (value) {
                          debugPrint('I bring the value $value');
                          if (value == null ||
                              value.isEmpty ) {
                            return 'Entrer un mot de passe valide ';
                          }
                          return null;
                        },
                        //borderRadius: BorderRadius.circular(10.0),
                        borderInput:  OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        controller: passwordController,
                        isTextObscure: true,
                        placeholder: 'Mot de passe',
                        iconPrefix: Icon(Icons.lock_outline),
                        colorInputField: Color(0xFFD9D9D9)),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/verifyEmail');
                      },
                      child: const Text(
                        'Mot de passe oublié',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SaveWidgetButon(
                        buttonContent: 'Connexion',
                      onTap: () {
                        if ((_formKey.currentState!).validate()) {
                         // Navigator.pushNamed(context, '/profileinfo');

                          BlocProvider.of<LoginBloc>(context).add(
                              SubmitUserEvent(AuthUser(
                                // id : 3,
                                username: usernameController.text,
                                password : passwordController.text
                              )));
                        } else {
                          debugPrint("Les champs ne sont pas valides");
                        }
                      },

                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginErrorState) {
                            return Text(state.errormessage,
                                style: const TextStyle(color: Colors.red));
                          } else if (state is LoginSuccessState) {

                            return Text(state.successMessage,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 77, 86, 78)));
                          } else {
                            return Container();
                          }
                        }),
              const SizedBox(
                height: 15,),
                    Container(
                      //padding : EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0) ,
                      //margin: EdgeInsets.symmetric(horizontal: 90.0,vertical: 0.0),
                      decoration: BoxDecoration(),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Créer un compte? ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              'Enregistrer',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xFFFEBE50)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
