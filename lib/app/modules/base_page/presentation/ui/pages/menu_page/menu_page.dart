import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberpass_baseweb/app/modules/base_page/presentation/ui/pages/cubits/menu_cubit/states/states.dart';

import '../cubits/menu_cubit/menu_cubit.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late MenuCubit _menuCubit;

  @override
  void initState() {
    _menuCubit = Modular.get<MenuCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Menu Example'),
      ),
      body: BlocBuilder<MenuCubit, MenuStates>(
        bloc: _menuCubit,
        builder: (context, state) {
          return Row(
            children: [
              if (state is MenuOpenState) ...[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Item 1'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Item 2'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Item 3'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'Content',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'Content',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = _menuCubit.state;
          if (state is MenuOpenState) {
            _menuCubit.closeMenu();
          } else {
            _menuCubit.openMenu();
          }
        },
        child: const Icon(Icons.menu),
      ),
    );
  }
}
