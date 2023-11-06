import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../liber_plan_page.dart';

class WidgetBuildCardRow extends StatelessWidget {
  final List<Plan> plans;

  const WidgetBuildCardRow({Key? key, required this.plans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: height,
      color: Colors.blueGrey,
      alignment: Alignment.topCenter,
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.center,
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                  text: 'Liber',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  children: [
                    TextSpan(
                        text: 'Pass',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))
                  ]),
            ),
            IntrinsicWidth(
              child: Row(
                children: [
                  for (final plan in plans)
                    Card(
                      child: SizedBox(
                        width: (width / 5) - 15,
                        height: 580,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                plan.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Modular.to.navigate('/onboarding');
                                },
                                child: const Text('Contratar'),
                              ),
                            ),
                            const Divider(),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: plan.features.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const Icon(Icons.check),
                                    title: Text(plan.features[index]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
