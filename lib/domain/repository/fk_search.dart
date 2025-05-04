abstract mixin class FkSearch<Entity, SearchEntity> {
  Future<List<Entity>> search(SearchEntity entity);
}
