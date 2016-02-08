// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library chartjs.example;

// Based off the Javascript example
// https://github.com/nnnick/Chart.js/blob/b8691c9581bff0eeecb34f98e678dc045a18f33e/samples/line.html
// On 2015-10-15

import 'dart:html';
import 'dart:math';

import 'package:chartjs/chartjs.dart';
import 'package:js/js.dart';

void main() {
  var ctx = (querySelector('#canvas') as CanvasElement).context2D;

  var rnd = new Random();

  var data = new LinearChartData(labels: <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July"
  ], datasets: <ChartDataSet>[
    new ChartDataSet(
        label: "My First dataset",
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: [
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100)
        ]),
    new ChartDataSet(
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.2)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: [
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100),
          rnd.nextInt(100)
        ])
  ]);

  Chart.defaults.global.onAnimationProgress = allowInterop((_, __) {
    print("Animation progress: $_ $__");
  });

  Chart.defaults.global.onAnimationComplete = allowInterop(() {
    print("Animation complete");
  });
  new Chart(ctx).Line(data, new LineChartOptions(pointDotRadius: 10));
}
