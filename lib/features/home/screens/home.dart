import 'dart:developer';

import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:desktop_sidebar/features/home/side_menu/side_menu.dart';
import 'package:desktop_sidebar/features/home/widgets/animated_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return Scaffold(
      // backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, fixture) {
        log((fixture.maxHeight * 0.1).toString());
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const AnimatedWave(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isCollapsed ? 128 : 280,
                    height: fixture.maxHeight,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const SideMenu(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
