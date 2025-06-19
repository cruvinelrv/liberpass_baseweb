import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/login/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:liberpass_baseweb/app/modules/central_base/central_base_module.dart';
import 'package:liberpass_baseweb/app/modules/central_base/shared/presentation/ui/cubits/menu_cubit/menu_cubit.dart';
import 'package:liberpass_baseweb/app/modules/central_base/shared/presentation/ui/pages/internal_page/internal_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/crm/presentation/ui/pages/add_person_page/add_person_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/fms/financial_management_module.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/scm/presentation/cubits/item_page_cubit/item_page_cubit.dart';
import 'package:liberpass_baseweb/app/modules/escape_manager/presentation/ui/pages/permission_denied_page/permission_denied_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/geremetrika_page/geremetrika_page.dart';
import 'package:liberpass_baseweb/app/modules/landing/landing_module.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/onboarding_module.dart';
import 'modules/auth_manager/auth_manager_module.dart';
import 'modules/auth_manager/login/presentation/ui/pages/login_page/login_page.dart';
import 'modules/auth_manager/shared/guards/auth_guard.dart';
import 'modules/auth_manager/shared/session/session_manager.dart';
import 'modules/central_base/shared/presentation/ui/pages/base_page/base_page.dart';
import 'modules/central_base/sub_modules/crm/presentation/ui/pages/person_page/person_page.dart';
import 'modules/central_base/sub_modules/scm/presentation/ui/pages/order_page/order_page_original.dart';
import 'modules/escape_manager/presentation/ui/pages/pages_escape_manager.dart';
import 'modules/central_base/sub_modules/scm/presentation/ui/pages/pages_item_management.dart';
import 'modules/central_base/sub_modules/scm/presentation/ui/pages/upload_itens_page/upload_itens_page.dart';
import 'modules/landing/presentation/ui/pages/pages_landing.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<AuthGuard>(AuthGuard.new);
    i.addSingleton<AuthCubit>(AuthCubit.new);
    i.addSingleton<SessionManager>(SessionManager.new);
    i.add<ItemCubit>(ItemCubit.new);
    i.add<MenuCubit>(MenuCubit.new);
    i.add<ItemPageCubit>(ItemPageCubit.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: LandingModule());
    r.module('/auth-manager', module: AuthManagerModule());
    r.module('/central-base', module: CentralBaseModule());
    r.module('/onboarding', module: OnboardingModule());
    r.module('/financial', module: FinancialManagementModule());

    r.child('/base-page', child: (context) => const BasePage(), children: [
      ChildRoute('/internal-page',
          child: (context) => const InternalPage(
                title: 'title',
                color: Colors.red,
              )),
      ChildRoute('/geremetrika', child: (context) => const GeremetrikaPage()),
      ChildRoute('/order', child: (context) => const OrderPage()),
      ChildRoute('/scm', child: (context) => const ItemPage()),
      ChildRoute('/crm', child: (context) => const PersonPage()),
      ChildRoute('/under-construction', child: (context) => const UnderConstructionPage()),
    ]);
    // ChildRoute('/base-page',
    //     child: (context, args) => const BasePage(),
    //     children: [
    //       ChildRoute('/internal-page',
    //           child: (context) => const InternalPage(
    //                 title: 'title',
    //                 color: Colors.red,
    //               )),
    //       ChildRoute('/geremetrika',
    //           child: (context, args) => const GeremetrikaPage()),
    //       ChildRoute('/order', child: (context, args) => const OrderPage()),
    //       ChildRoute('/scm', child: (context, args) => const ItemPage()),
    //       ChildRoute('/crm', child: (context, args) => const PersonPage()),
    //       ChildRoute('/under-construction',
    //           child: (context, args) => const UnderConstructionPage()),
    //     ]),
    ChildRoute('/liberpass-info', child: (context) => const LiberpassInfoPage());
    ChildRoute('/login', child: (context) => const LoginPage());
    ChildRoute(
      '/geremetrika',
      child: (context) => const GeremetrikaPage(),
      //guards: [AuthGuard()],
    );
    ChildRoute('/add-item', child: (context) => const AddItemPage());
    ChildRoute('/order-page', child: (context) => const OrderPage());
    ChildRoute('/add-prices', child: (context) => const AddPricesPage());
    r.child('/upload-itens', child: (context) => const UploadItensPage());
    ChildRoute('/upload-itens', child: (context) => const UploadItensPage());
    ChildRoute('/item', child: (context) => const ItemPage());
    ChildRoute('/error', child: (context) => const ErrorPage());
    ChildRoute('/under-construction', child: (context) => const UnderConstructionPage());
    ChildRoute('/crm', child: (context) => const PersonPage());
    ChildRoute('/add-person', child: (context) => const AddPersonPage());
    r.child('/permission-denied', child: (context) => const PermissionDeniedPage());
  }

  @override
  void exportedBinds(Injector i) {
    // TODO: implement exportedBinds
    super.exportedBinds(i);
  }
}
