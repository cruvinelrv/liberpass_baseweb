import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/escape_manager/presentation/ui/pages/under_construction_page/under_construction_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late String pageName;

  @override
  void initState() {
    super.initState();
    pageName = 'Liberpass 0.1.1';
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
                      Modular.to.navigate('/central-base/wms/');
                      //MaterialPageRoute(builder: (context) => const UnderConstructionPage());
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
                  ListTile(
                    title: const Text('Pedido'),
                    onTap: () {
                      Modular.to.navigate('/central-base/order/');
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
                    title: const Text('Sair'),
                    onTap: () {
                      Modular.to.navigate('/login');
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
                  title: const Text('Page 1'),
                  onTap: () {
                    Modular.to.navigate('/internal_page');
                    _updatePageName('Page 1');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Page 2'),
                  onTap: () {
                    Modular.to.navigate('/geremetrika');
                    _updatePageName('Page 2');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Page 3'),
                  onTap: () {
                    Modular.to.navigate('/page3');
                    _updatePageName('Page 3');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
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
