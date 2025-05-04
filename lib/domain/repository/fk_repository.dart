import 'package:fk_repository/data/data_parser/fk_data_parser.dart';

abstract class FkRepository<Data> {
  const FkRepository({required this.parser});

  final FkFullDataParser<Data> parser;
}
