abstract mixin class FkCreate<Entity> {
  Future<Entity> create(Entity entity);
}
