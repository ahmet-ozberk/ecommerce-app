import 'package:ecommerce/utils/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(Controllers.baseController);
    final watch = ref.watch(Controllers.baseController);
    return SafeArea(
      top: false,
      child: Container(
        height: 60,
        margin: 20.paddingOnlyLeftRight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: 20.borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: read.baseModel.mapIndexed((value, index) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  key: value.key,
                  onPressed: () {
                    read.changeIndex(index);
                    read.setWidgetPosition();
                  },
                  child: SizedBox(
                    height: 60,
                    width: Grock.width / 5.9,
                    child: Icon(
                      value.icon,
                      color: watch.currentIndex == index ? Colors.black : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
            AnimatedPositioned(
              top: 27,
              left: watch.selectedPosition,
              curve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 400),
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
