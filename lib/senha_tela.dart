import 'package:flutter/material.dart';

class SenhaScreen extends StatefulWidget {
  const SenhaScreen({Key? key}) : super(key: key);

  @override
  State<SenhaScreen> createState() => _SenhaScreenState();
}

class _SenhaScreenState extends State<SenhaScreen> {
  bool mostrarSenha = false;
  bool carac = false;
  bool letraMaiuscula = false;

  Icon getIcon(bool checked) {
    return Icon(
      checked ? Icons.check_circle : Icons.circle_outlined,
      color: checked ? Colors.green : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    "Digite sua nova senha",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    getIcon(carac),
                    const SizedBox(width: 8,),
                    const Text("8 caracteres"),
                  ],
                ),
                Row(
                  children: [
                    getIcon(letraMaiuscula),
                    const SizedBox(width: 8,),
                    const Text("letra maiuscula"),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
      
                  ),

                  child: TextField(
                    onChanged: (value) {
                      setState((){
                        carac = value.length >= 8;
                        letraMaiuscula = value.isNotEmpty && value[0] == value[0].toUpperCase();
                      });
                    },
                 decoration: InputDecoration(
                  hintText: 'digite sua senha',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(mostrarSenha ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState((){
                        mostrarSenha = !mostrarSenha;
                      });
                    },

                  ),

                ),
                obscureText: !mostrarSenha,


                  ),
                ),
                const SizedBox(
                  height: 450,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.green,
                       borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'enviar',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      
                    ),
                  ),
                )
              ]
              
            ),
            
          )
        )
      )
    );
  }
}