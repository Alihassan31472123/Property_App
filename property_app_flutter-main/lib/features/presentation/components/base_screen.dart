import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ScreenBase extends ConsumerStatefulWidget {
  final Widget screenBody;
  final Widget? leading;
  final Widget? floatingActionButton;
  final List<Widget>? appBarActions;
  final bool? centerTitle;
  final Widget? navigationDrawer;
  final Widget? screenTitle;
  final BottomSheet? bottomSheet;
  final Widget? bottomNavigationBar;

  const ScreenBase({super.key,
    required this.screenBody,
    this.appBarActions,
    this.centerTitle,
    this.leading,
    this.navigationDrawer,
    this.floatingActionButton,
    this.screenTitle,
    this.bottomSheet,
    this.bottomNavigationBar
  });

  @override
  _ScreenBaseState createState() => _ScreenBaseState();
}

class _ScreenBaseState extends ConsumerState<ScreenBase> {

  _scaffold() {
    List<Widget> actions = <Widget>[];
    if(widget.appBarActions != null) {
      actions = widget.appBarActions!;
    }
    return Scaffold(
      appBar: AppBar(
        title: widget.screenTitle,
        centerTitle: widget.centerTitle ?? true,
        leading: widget.leading,
        actions: actions,
      ),
      drawer: widget.navigationDrawer,
      body: SafeArea(
        child: widget.screenBody,
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomSheet: widget.bottomSheet,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }
}

