import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'navigation_controller.g.dart';

@Injectable()
class NavigationController = _NavigationControllerBase
    with _$NavigationController;

abstract class _NavigationControllerBase with Store implements Disposable {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }
}
