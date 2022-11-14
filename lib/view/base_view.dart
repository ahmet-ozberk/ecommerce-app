import 'package:ecommerce/utils/controllers.dart';
import 'package:ecommerce/widgets/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView extends ConsumerStatefulWidget {
  const BaseView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends ConsumerState<BaseView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(Controllers.baseController).setWidgetPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = ref.read(Controllers.baseController);
    final watch = ref.watch(Controllers.baseController);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: AppNavigationBar(),
      body: watch.body(),
    );
  }
}
