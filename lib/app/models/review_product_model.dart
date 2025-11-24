class ReviewProductModel {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  ReviewProductModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });
  factory ReviewProductModel.fromJson(Map<String, dynamic> json) {
    return ReviewProductModel(
      rating: (json['rating']) ?? 0,
      comment: (json['comment']) ?? '',
      date: json['date'] ?? '',
      reviewerName: json['reviewerNmae'] ?? '',
      reviewerEmail: json['reviewerEmai'] ?? '',
    );
  }
}
