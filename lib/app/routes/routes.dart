import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/close_order_page/close_order_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/pdf_order_page/pdf_order_page.dart';
=======
import 'package:liberpass_baseweb/app//modules/geremetrika/domain/entities/order_entity.dart';
import 'package:liberpass_baseweb/app//modules/geremetrika/presentation/ui/pages/close_order_page/close_order_page.dart';
import 'package:liberpass_baseweb/app//modules/geremetrika/presentation/ui/pages/pdf_order_page/pdf_order_page.dart';
>>>>>>> 8067b635bdba8b7a17fbfa2632bd0e48f962b2ca

import '..//modules/error/presentation/ui/pages/error_page/error_page.dart';
import '..//modules/geremetrika/data/models/order_model.dart';
import '..//modules/geremetrika/presentation/ui/pages/home_page/home_page.dart';
import '..//modules/geremetrika/presentation/ui/pages/order_head_page/order_head_page.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/order_head_page':
        return MaterialPageRoute(
          builder: (context) => const OrderHeadPage(),
        );
      case '/pdf_order_page':
        return MaterialPageRoute(
          builder: (context) => PdfOrderPage(
            args: ModalRoute.of(context)!.settings.arguments as OrderEntity,
          ),
        );
      case '/close_order_page':
        final args = settings.arguments as OrderModel;
        return MaterialPageRoute(
          builder: (context) {
            return CloseOrderPage(
              opa: args,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
