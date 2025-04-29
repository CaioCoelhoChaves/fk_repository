abstract mixin class FkCreate<Entity, ReturnType> {
  Future<ReturnType> create(Entity entity);
}
