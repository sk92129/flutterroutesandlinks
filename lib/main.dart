// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
void main() => runApp(const MyApp());


String html = "<p>Hello world! This is HTML5 Boilerplate. Go to the <a href=\"#/details\">details</a></p><p>Hello Sean! Go to the <a href=\"#/profile\">profile</a></p>";


/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),

        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),

        
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: 
        Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the Details screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('Go to the Profile screen'),
            ),
          ],
        ),

      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child:
        

      
              Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('Go to the Profile screen'),
            ),
            HtmlWidget(html )
          ],
        ),

      
      
      ),
    );
  }
}


/// The details screen
class ProfileScreen extends StatelessWidget {
  /// Constructs a [ProfileScreen]
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen ')),
      body: Center(
        child: 

                    Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the detail screen'),
            ),

            HtmlWidget(html )
          ],
        ),


      
      ),
    );
  }
}