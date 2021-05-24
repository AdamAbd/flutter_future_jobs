import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:future_jobs/gender_provider.dart';
import 'package:future_jobs/height_provider.dart';
import 'package:future_jobs/weight_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeightProvider>(
          create: (context) => WeightProvider(),
        ),
        ChangeNotifierProvider<HeightProvider>(
          create: (context) => HeightProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        // showSemanticsDebugger: true,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Weight (kg):', style: TextStyle(fontSize: 20.0)),
            // NOTE: Menggunakan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, child) => Slider(
            //     min: 1.0,
            //     max: 100.0,
            //     divisions: 100,
            //     label: weightProvider.weight.round().toString(),
            //     value: weightProvider.weight,
            //     onChanged: (value) {
            //       value = value.roundToDouble();
            //       print('weight $value');
            //       weightProvider.weight = value;
            //     },
            //   ),
            // ),
            Slider(
              min: 1.0,
              max: 100.0,
              divisions: 100,
              label: weightProvider.weight.round().toString(),
              value: weightProvider.weight,
              onChanged: (value) {
                value = value.roundToDouble();
                print('weight $value');
                weightProvider.weight = value;
              },
            ),
            SizedBox(height: 20.0),
            Text('Your Height (cm):', style: TextStyle(fontSize: 20.0)),
            Consumer<HeightProvider>(
              builder: (context, heightProvider, child) => Slider(
                min: 1.0,
                max: 200.0,
                divisions: 200,
                label: heightProvider.height.round().toString(),
                value: heightProvider.height,
                activeColor: Colors.pink,
                inactiveColor: Colors.pink.withOpacity(0.2),
                onChanged: (value) {
                  value = value.roundToDouble();
                  print('height $value');
                  heightProvider.height = value;
                },
              ),
            ),
            SizedBox(height: 50.0),
            // NOTE: Menggunakan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, child) =>
            //       Consumer<HeightProvider>(
            //     builder: (context, heightProvider, child) => Text(
            //       'Your BMI:\n${(weightProvider.weight / pow(heightProvider.height / 100, 2)).toStringAsFixed(2)}',
            //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),

            Text(
              'Your BMI:\n${(weightProvider.weight / pow(heightProvider.height / 100, 2)).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
