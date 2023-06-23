import 'package:flutter/material.dart';
import '../liber_plan_page.dart';

class WidgetBuildCardColumn extends StatelessWidget {
  final List<Plan> plans;

  const WidgetBuildCardColumn({Key? key, required this.plans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final plan in plans) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  plan.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'R\$ ${plan.price.toStringAsFixed(2)} / mês',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'R\$ ${plan.price.toStringAsFixed(2)} / mês',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: plan.features.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    title: Text(plan.features[index]),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
