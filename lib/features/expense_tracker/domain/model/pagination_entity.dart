class PaginationEntity {
  final bool refresh;
  final int page;

  PaginationEntity({required this.refresh, required this.page});

  //toJson
  Map<String, dynamic> toJson() => {'page': page};
}
