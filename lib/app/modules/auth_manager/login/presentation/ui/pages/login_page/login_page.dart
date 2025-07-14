import 'package:flutter/material.dart';
import 'package:lpass_web_dependencies/web_dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/login/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/shared/utils/auth_manager_strings.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _appVersion = '...';

  @override
  void initState() {
    super.initState();
    _authCubit = Modular.get<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadVersion();
    });
  }

  Future<void> _loadVersion() async {
    try {
      final versionString = await rootBundle.loadString('assets/version.txt');
      print('Versão lida: $versionString');
      setState(() {
        _appVersion = 'v${versionString.trim()}';
      });
    } catch (e) {
      print('Erro ao ler versão: $e');
      setState(() {
        _appVersion = 'v?';
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _corporationController = TextEditingController();
  late final AuthCubit _authCubit;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _corporationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AuthManagerStrings.loginAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: SizedBox(
                width: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AuthManagerStrings.liberpassTitle,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _appVersion,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: AuthManagerStrings.emailLabel,
                        fillColor: Colors.white,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: AuthManagerStrings.passwordLabel,
                        fillColor: Colors.white,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey[700],
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            String email = _usernameController.text.trim();
                            String password = _passwordController.text;
                            try {
                              final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              if (userCredential.user != null) {
                                _authCubit.startSession();
                                _usernameController.clear();
                                _passwordController.clear();
                                Navigator.pushNamed(context, '/central-base');
                              } else {
                                debugPrint('Usuário não encontrado');
                                _usernameController.clear();
                                _passwordController.clear();
                                Navigator.pushNamed(context, '/escape-manager');
                              }
                            } catch (e) {
                              debugPrint('Erro ao autenticar: $e');
                              _usernameController.clear();
                              _passwordController.clear();
                              Navigator.pushNamed(context, '/escape-manager');
                            }
                          },
                          child: Text(AuthManagerStrings.entrarButton)),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton.icon(
                      icon: const Icon(Icons.person_add, color: Colors.green),
                      label: const Text('Criar Conta', style: TextStyle(fontSize: 16, color: Colors.green)),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/onboarding');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
