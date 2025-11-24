class DimensionsProductoModel {
  final double width;
  final double height;
  final double depth;

  DimensionsProductoModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsProductoModel.fromjson(Map<String, dynamic> json) {
    return DimensionsProductoModel(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }
}
