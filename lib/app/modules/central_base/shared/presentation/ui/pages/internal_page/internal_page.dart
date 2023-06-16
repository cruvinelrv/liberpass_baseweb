import 'package:flutter/material.dart';

class InternalPage extends StatefulWidget {
  final String title;
  final Color color;

  const InternalPage({super.key, required this.title, required this.color});

  @override
  State<InternalPage> createState() => _InternalPageState();
}

class _InternalPageState extends State<InternalPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _selectDrawerOption(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      _tabController.animateTo(index);
      Navigator.pop(context); // Fecha o drawer após a seleção
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        title: const Text('Outlet Menu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Opção 1'),
            Tab(text: 'Opção 2'),
            Tab(text: 'Opção 3'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () => _selectDrawerOption(0),
              selected: _selectedDrawerIndex == 0,
            ),
            ListTile(
              title: const Text('Menu Opção 1'),
              onTap: () => _selectDrawerOption(1),
              selected: _selectedDrawerIndex == 1,
            ),
            ListTile(
              title: const Text('Menu Opção 2'),
              onTap: () => _selectDrawerOption(2),
              selected: _selectedDrawerIndex == 2,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Conteúdo da Opção 1
          Center(child: Text('Conteúdo da Opção 1')),
          // Conteúdo da Opção 2
          Center(child: Text('Conteúdo da Opção 2')),
          // Conteúdo da Opção 3
          Center(child: Text('Conteúdo da Opção 3')),
        ],
      ),
    );
  }
}
