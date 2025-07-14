import 'package:flutter/material.dart';
import 'package:lpass_web_dependencies/web_dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? _userData;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      // Substitua pelo método correto para obter o UID do usuário logado
      final uid = await _getCurrentUserUid();
      final doc = await FirebaseFirestore.instance.collection('pessoas').doc(uid).get();
      if (doc.exists) {
        setState(() {
          _userData = doc.data();
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Dados não encontrados.';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erro ao buscar dados: $e';
        _loading = false;
      });
    }
  }

  Future<String?> _getCurrentUserUid() async {
    // Exemplo usando FirebaseAuth
    try {
      final user = await FirebaseAuth.instance.authStateChanges().first;
      return user?.uid;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text(_error!));
    }
    final data = _userData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Metas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bem-vindo, ${data?['nome'] ?? "Usuário"}!', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text('Meta selecionada:', style: Theme.of(context).textTheme.titleMedium),
                Text(data?['objetivo'] ?? 'Nenhuma meta definida',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                Text('Cidade de origem: ${data?['cidadeOrigem'] ?? "-"}'),
                Text('Cidade de destino: ${data?['cidadeDestino'] ?? "-"}'),
                const SizedBox(height: 24),
                if (data?['objetivo'] != null) _buildGoalWidget(data!['objetivo']),
                const SizedBox(height: 32),
                Text('Acompanhe seu progresso e defina novas metas para alcançar seus objetivos!',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalWidget(String objetivo) {
    double progresso = 0.0;
    String descricao = '';
    switch (objetivo) {
      case 'Gestão financeira pessoal':
        progresso = 0.3;
        descricao = 'Sua meta é melhorar sua gestão financeira pessoal.';
        break;
      case 'Gestão financeira do meu negócio':
        progresso = 0.5;
        descricao = 'Sua meta é aprimorar a gestão financeira do seu negócio.';
        break;
      case 'Apenas mudar de cidade para ter mais qualidade de vida.':
        progresso = 0.7;
        descricao = 'Sua meta é mudar de cidade buscando qualidade de vida.';
        break;
      default:
        return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(descricao, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 24),
        Row(
          children: [
            SizedBox(
              height: 140,
              width: 140,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: progresso * 100,
                      color: Colors.blue,
                      radius: 55,
                      title: '${(progresso * 100).toInt()}%',
                      titleStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 100 - (progresso * 100),
                      color: Colors.grey[300],
                      radius: 55,
                      title: '',
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Progresso', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${(progresso * 100).toInt()}%', style: const TextStyle(fontSize: 22, color: Colors.blue)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
