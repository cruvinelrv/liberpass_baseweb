import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../auth_manager/login/presentation/cubits/auth_cubit/auth_cubit.dart';
import '../../../../../../auth_manager/shared/session/session_manager.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late String pageName;
  late final AuthCubit _authCubit;
  late final SessionManager _sessionManager;

  @override
  void initState() {
    super.initState();
    pageName = 'Liberpass 0.1.1';
    _authCubit = Modular.get<AuthCubit>();
    _sessionManager = Modular.get<SessionManager>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;

    final leading = isDesktop
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    enabled: true,
                    title: const Text('Estoque'),
                    onTap: () {
                      Modular.to.navigate('/central-base/scm/');
                    },
                  ),
                  ListTile(
                    enabled: true,
                    title: const Text('Pessoas'),
                    onTap: () {
                      Modular.to.navigate('/central-base/crm/');
                      _updatePageName('Pessoas');
                    },
                  ),
                  Visibility(
                    visible: true,
                    child: ListTile(
                      enabled: true,
                      title: const Text('Pedido'),
                      onTap: () {
                        Modular.to.navigate('/central-base/order/');
                        _updatePageName('Pedido');
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Pedido'),
                    onTap: () {
                      Modular.to.navigate('/central-base/geremetrika/');
                      _updatePageName('Pedido');
                    },
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    title: const Text('Upload Itens'),
                    onTap: () {
                      Modular.to.navigate('/upload-itens/');
                      _updatePageName('Upload Itens');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Sair'),
                    onTap: () {
                      Modular.to.popUntil((p0) => true);
                      Modular.to.navigate('/auth-manager/');
                    },
                  ),
                ],
              ),
            ),
          )
        : null;

    final drawer = isSmallScreen
        ? Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Produtos'),
                  onTap: () {
                    Modular.to.navigate('/central-base/scm/');
                    _updatePageName('Produtos');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Geremetrika'),
                  onTap: () {
                    Modular.to.navigate('/central-base/geremetrika');
                    _updatePageName('Geremetrika');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Pessoas'),
                  onTap: () {
                    Modular.to.navigate('/central-base/crm/');
                    _updatePageName('Pessoas');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Pedido'),
                  onTap: () {
                    Modular.to.navigate('/central-base/order/');
                    _updatePageName('Pedido');
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: const Text('Upload Itens'),
                  onTap: () {
                    Modular.to.navigate('/upload-itens/');
                    _updatePageName('Upload Itens');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Sair'),
                  onTap: () {
                    Modular.to.navigate('/');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(pageName),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<AuthCubit, bool>(
              bloc: _authCubit,
              builder: (context, state) {
                if (state) {
                  return StreamBuilder<int>(
                    stream: _sessionManager.sessionStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final sessionDuration = snapshot.data!;
                        return Text('Tempo de sessão: $sessionDuration segundos');
                      } else {
                        return const Text('Nenhuma sessão ativa');
                      }
                    },
                  );
                } else {
                  return const Text('Nenhuma sessão ativa');
                }
              },
            ),
          ],
        ),
      ),
      drawer: drawer,
      body: Row(
        children: [
          if (isDesktop) leading ?? Container(),
          Container(
            width: 2,
            color: Colors.black45,
          ),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }

  void _updatePageName(String name) {
    setState(() {
      pageName = name;
    });
  }
}
