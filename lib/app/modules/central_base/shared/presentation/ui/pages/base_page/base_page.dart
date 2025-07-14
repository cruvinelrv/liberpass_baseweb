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
  String? userName;
  String? userEmail;
  late final AuthCubit _authCubit;
  late final SessionManager _sessionManager;

  @override
  void initState() {
    super.initState();
    pageName = 'Liberpass 0.1.1';
    _authCubit = Modular.get<AuthCubit>();
    _sessionManager = Modular.get<SessionManager>();
    // Simulação: obtenha nome/email do usuário logado
    // Substitua por dados reais do seu AuthCubit/SessionManager
    userName = 'Usuário';
    userEmail = 'usuario@email.com';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;

    final Widget? sideMenu = isDesktop
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Cabeçalho/avatar
                  CircleAvatar(
                    radius: 32,
                    child: Icon(Icons.person, size: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(userName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(userEmail ?? '', style: const TextStyle(fontSize: 12)),
                  const Divider(thickness: 2),
                  ListTile(
                    title: const Text('Dashboard'),
                    leading: const Tooltip(message: 'Ir para Dashboard', child: Icon(Icons.dashboard)),
                    onTap: () {
                      Modular.to.navigate('/central-base/dashboard/');
                      _updatePageName('Dashboard');
                    },
                  ),
                  // Menus antigos ocultos temporariamente
                  /*
                  if (!ocultarMenusAntigos) ...[
                    ListTile(
                      title: const Text('Estoque'),
                      leading: const Tooltip(message: 'Ir para Estoque', child: Icon(Icons.inventory)),
                      onTap: () {
                        Modular.to.navigate('/central-base/scm/');
                        _updatePageName('Estoque');
                      },
                    ),
                    ListTile(
                      title: const Text('Pessoas'),
                      leading: const Tooltip(message: 'Ir para Pessoas', child: Icon(Icons.people)),
                      onTap: () {
                        Modular.to.navigate('/central-base/crm/');
                        _updatePageName('Pessoas');
                      },
                    ),
                    ListTile(
                      title: const Text('Pedido'),
                      leading: const Tooltip(message: 'Ir para Pedido', child: Icon(Icons.shopping_cart)),
                      onTap: () {
                        Modular.to.navigate('/central-base/order/');
                        _updatePageName('Pedido');
                      },
                    ),
                    ListTile(
                      title: const Text('Geremetrika'),
                      leading: const Tooltip(message: 'Ir para Geremetrika', child: Icon(Icons.analytics)),
                      onTap: () {
                        Modular.to.navigate('/central-base/geremetrika/');
                        _updatePageName('Geremetrika');
                      },
                    ),
                  ],
                  */
                  const Expanded(child: SizedBox()),
                  const Divider(thickness: 2),
                  ListTile(
                    title: const Text('Sair'),
                    leading: const Tooltip(message: 'Sair do sistema', child: Icon(Icons.logout)),
                    onTap: () {
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
                // Cabeçalho/avatar
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 32,
                  child: Icon(Icons.person, size: 32),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(userEmail ?? '', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                ListTile(
                  title: const Text('Dashboard'),
                  leading: const Tooltip(message: 'Ir para Dashboard', child: Icon(Icons.dashboard)),
                  onTap: () {
                    Modular.to.navigate('/dashboard/');
                    _updatePageName('Dashboard');
                    Navigator.pop(context);
                  },
                ),
                // Menus antigos ocultos temporariamente
                /*
                if (!ocultarMenusAntigos) ...[
                  ListTile(
                    title: const Text('Estoque'),
                    leading: const Tooltip(message: 'Ir para Estoque', child: Icon(Icons.inventory)),
                    onTap: () {
                      Modular.to.navigate('/central-base/scm/');
                      _updatePageName('Estoque');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Pessoas'),
                    leading: const Tooltip(message: 'Ir para Pessoas', child: Icon(Icons.people)),
                    onTap: () {
                      Modular.to.navigate('/central-base/crm/');
                      _updatePageName('Pessoas');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Pedido'),
                    leading: const Tooltip(message: 'Ir para Pedido', child: Icon(Icons.shopping_cart)),
                    onTap: () {
                      Modular.to.navigate('/central-base/order/');
                      _updatePageName('Pedido');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Geremetrika'),
                    leading: const Tooltip(message: 'Ir para Geremetrika', child: Icon(Icons.analytics)),
                    onTap: () {
                      Modular.to.navigate('/central-base/geremetrika/');
                      _updatePageName('Geremetrika');
                      Navigator.pop(context);
                    },
                  ),
                ],
                */
                const Expanded(child: SizedBox()),
                const Divider(thickness: 2),
                ListTile(
                  title: const Text('Sair'),
                  leading: const Tooltip(message: 'Sair do sistema', child: Icon(Icons.logout)),
                  onTap: () {
                    Modular.to.navigate('/auth-manager/');
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
            const SizedBox(width: 10),
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
          if (isDesktop) sideMenu ?? Container(),
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
