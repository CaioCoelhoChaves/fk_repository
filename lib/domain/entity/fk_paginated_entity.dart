class FKPaginatedEntity<T> {
  const FKPaginatedEntity({required this.items, required this.pagination});

  final List<T> items;
  final FKPagination pagination;
}

class FKPagination {
  const FKPagination({
    required this.page,
    required this.size,
    required this.totalItemsCount,
    required this.hasNext,
  });

  final int? page;
  final int? size;
  final int? totalItemsCount;
  final bool? hasNext;
}
