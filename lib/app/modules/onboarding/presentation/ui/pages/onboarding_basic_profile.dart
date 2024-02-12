import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:liberpass_baseweb/app/modules/shared/extensions/extensions.dart';

class OnboardingBasicProfile extends StatefulWidget {
  const OnboardingBasicProfile({Key? key}) : super(key: key);

  @override
  State<OnboardingBasicProfile> createState() => _OnboardingBasicProfileState();
}

class _OnboardingBasicProfileState extends State<OnboardingBasicProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
 MaskedTextController controller = MaskedTextController(mask: '(00) 00000-0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro do usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de CPF, se necessário
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de email, se necessário
                  return null;
                },
              ),
              TextFormField(
                controller: controller,
                maxLength: 15,
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                 
                decoration: const InputDecoration(labelText: 'Telefone', hintText: '(00) 00000-0000'),
                
                onEditingComplete: () {
                  //_phoneController.text = MaskedTextController(mask: '(00) 00000-0000').text;
                },
                onChanged: (value) {
                  debugPrint('Valor do campo: $value');
                  debugPrint('Tamanho do campo: ${value.length}');
                  //switch (value.length) {
                    if (value.length == 14){
                      debugPrint('14 digitos');
                      controller = MaskedTextController(mask: '(00) 00000-0000');
                      
                      controller.updateMask('(00) 0000-0000');
                      // _phoneController.text = MaskedTextController(mask: '(00) 00000-0000').text;
                    }

                    if (value.length == 13){
                      debugPrint('13 digitos');
                      var teste = MaskedTextController(mask: '(00) 0000-0000', text: 'uyiyy').text;
                      controller.updateText(teste);
                      // _phoneController.text = MaskedTextController(mask: '(00) 00000-0000').text;
                    }
                    //_phoneController.text = MaskedTextController(mask: '(00) 00000-0000').text;
                    // case 14:
                    //   _updateMask(value.substring(0, 14));
                    //   _updateMask("($value");
                    //   break;
                    // case 13:
                    //   _updateMask(value.substring(0, 13));
                    //   break;
                   
                    // default:
                    //   break;
                  
                  // if (value.length == 1) {
                  //     _updateMask("($value");
                  // } 
                  // else if (value.length == 3) {
                  //     _updateMask("$value)");
                  // }
                  // else if (value.length > 13) {
                  //     _updateMask(value.substring(0, 13));
                  // }
                  // else if (value.length > 14) {
                  //     _updateMask(value.substring(0, 14));
                  // }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  
                  
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: false,
                focusNode: _phoneFocus,
                
                inputFormatters: [PhoneMaskFormatter()],
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de senha, se necessário
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Faça algo com os dados do formulário
                    // Por exemplo, navegue para a próxima tela ou envie para a API
                    // Você pode acessar os valores usando _nameController.text, _lastNameController.text, etc.
                  }
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _updateMask(String newMask) {
    _phoneController.value = TextEditingValue(
      text: newMask,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newMask.length),
      ),
    );
  }
}

class PhoneMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length == 1) {
      return TextEditingValue(
        text: '($text',
        selection: const TextSelection.collapsed(offset: 3),
      );
    } else if (text.length > 1 && text[0] != '(') {
      // Adiciona a abertura de parênteses se não existir
      return TextEditingValue(
        text: '($text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length == 3 && text[2] != ')') {
      // Adiciona o fechamento de parênteses após o DDD
      return TextEditingValue(
        text: '$text)',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length == 9 && text[8] != '-') {
      // Adiciona o traço após os primeiros 5 dígitos do número
      return TextEditingValue(
        text: '$text-',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length > 15) {
      // Limita o comprimento total a 15 caracteres
      return TextEditingValue(
        text: text.substring(0, 14),
        selection: const TextSelection.collapsed(offset: 14),
      );
    }
    return newValue;
  }
}
