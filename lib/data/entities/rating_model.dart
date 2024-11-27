/// * RatingModel: class model for rating data
/// * [rate] - the product's rate.
/// * [count] - the product's count.
class RatingModel{
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  /// * fromJson: method to convert a map to a factory RatingModel
  factory RatingModel.fromJson(Map<String, dynamic> json){
    return RatingModel(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  /// * toJson: method to convert a factory RatingModel to a map
  Map<String, dynamic> toJson(){
    return {
      'rate': rate,
      'count': count,
    };
  }
}