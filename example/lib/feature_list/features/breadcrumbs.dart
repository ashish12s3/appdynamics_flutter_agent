/*
 * Copyright (c) 2021. AppDynamics LLC and its affiliates.
 * All rights reserved.
 *
 */

import 'package:appdynamics_mobilesdk/appdynamics_mobilesdk.dart';
import 'package:appdynamics_mobilesdk_example/feature_list/utils/flush_beacons_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Breadcrumbs extends StatefulWidget {
  const Breadcrumbs({Key? key}) : super(key: key);

  @override
  _BreadcrumbsState createState() => _BreadcrumbsState();
}

class _BreadcrumbsState extends State<Breadcrumbs> {
  Future<void> _leaveCrashOnlyBreadcrumbPressed() async {
    await Instrumentation.leaveBreadcrumb(
        "A crash only breadcrumb.", BreadcrumbVisibility.crashesOnly);
  }

  Future<void> _leaveCrashAndSessionBreadcrumbPressed() async {
    await Instrumentation.leaveBreadcrumb("A crash and session breadcrumb.",
        BreadcrumbVisibility.crashesAndSessions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FlushBeaconsAppBar(title: "Breadcrumbs"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ElevatedButton(
              key: const Key("leaveBreadcrumbCrashButton"),
              child: const Text('Leave crashes only breadcrumb'),
              onPressed: _leaveCrashOnlyBreadcrumbPressed,
            ),
            ElevatedButton(
              key: const Key("leaveBreadcrumbCrashAndSessionButton"),
              child: const Text('Leave crashes and sessions breadcrumb',
                  textAlign: TextAlign.center),
              onPressed: _leaveCrashAndSessionBreadcrumbPressed,
            ),
          ]),
        ),
      ),
    );
  }
}