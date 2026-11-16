/// Calculates grid-line positions relative to the viewport centre.
///
/// [extent] represents the viewport width or height.
/// [center] represents the corresponding coordinate origin.
/// [spacing] represents the distance between adjacent grid lines.
List<double> gridLinePositions({
  required double extent,
  required double center,
  required double spacing,
}) {

  final minIndex = (-center / spacing).ceil();
  final maxIndex = ((extent - center) / spacing).floor();

  return [
    for (var i = minIndex; i <= maxIndex; i++)
      center + i * spacing,
  ];
}
