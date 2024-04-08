import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/page1');

    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) => {
        ChildRoute('/', child: (context) => const AppPage(), children: [
          ChildRoute('/page1',
              child: (context) =>
                  const InternalPage(title: 'page 1', color: Colors.red)),
          ChildRoute('/page2',
              child: (context) =>
                  const InternalPage(title: 'page 2', color: Colors.amber)),
          ChildRoute('/page3',
              child: (context,) =>
                  const InternalPage(title: 'page 3', color: Colors.green)),
        ]),
  };
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;

    final leading = isDesktop
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Page 1'),
                  onTap: () => Modular.to.navigate('/page1'),
                ),
                ListTile(
                  title: const Text('Page 2'),
                  onTap: () => Modular.to.navigate('/page2'),
                ),
                ListTile(
                  title: const Text('Page 3'),
                  onTap: () => Modular.to.navigate('/page3'),
                ),
              ],
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
                    Modular.to.navigate('/page1');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Page 2'),
                  onTap: () {
                    Modular.to.navigate('/page2');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Page 3'),
                  onTap: () {
                    Modular.to.navigate('/page3');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: drawer,
      body: Row(
        children: [
          if (isDesktop) leading ?? Container(),
          Container(width: 2, color: Colors.black45),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}

class InternalPage extends StatelessWidget {
  final String title;
  final Color color;

  const InternalPage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(child: Text(title)),
    );
  }
}
