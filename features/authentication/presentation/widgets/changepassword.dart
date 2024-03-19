import 'package:flutter/material.dart';
import 'package:pfechotranasmartvillage/features/authentication/presentation/widgets/subwidgets/saveWidgetButton.dart';
import 'package:pfechotranasmartvillage/features/authentication/presentation/widgets/subwidgets/textFieldWidget.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});
  @override
  State<ChangePasswordWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<ChangePasswordWidget> {
  final passwordSetController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: const Text('Chotrana'),
          backgroundColor: const Color(0xFF2B6353),
          foregroundColor: const Color(0xFFFFFFFF),
        ),
        body: Center(
          child: Stack(children: [
            //Container(
                //color: const Color(0xFF2B6353),
                //),
            Column(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 9,
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

                      const Image(image: AssetImage('login_image.png')),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Créer votre compte',style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F7774)
                      ),),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                          validator: (value) {
                            debugPrint('I bring the value $value');
                            if (value == null || value.isEmpty || value.length < 8) {
                              return 'Mot de passe  est non valide';
                            }
                            return null;
                          },
                          borderInput:  OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          keyboardtype : TextInputType.number,

                          controller: passwordSetController,
                          isTextObscure: false,
                          placeholder: "Nouveau Mot de passe",
                          iconPrefix: const Icon(Icons.person),
                          colorInputField: const Color(0xFFD9D9D9)),

                      TextFieldWidget(
                          validator: (value) {
                            debugPrint('I bring the value $value');
                            if (value == null || value.isEmpty || value.length < 8) {
                              return 'Mot de passe  est non valide';
                            }
                            return null;
                          },
                          borderInput:  OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          keyboardtype : TextInputType.number,

                          controller: passwordConfirmController ,
                          isTextObscure: false,
                          placeholder: "Confirmer Mot de passe",
                          iconPrefix: const Icon(Icons.person),
                          colorInputField: const Color(0xFFD9D9D9)),
                      const SizedBox(
                        height: 10,
                      ),
                      SaveWidgetButon(buttonContent: 'Apply', onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
