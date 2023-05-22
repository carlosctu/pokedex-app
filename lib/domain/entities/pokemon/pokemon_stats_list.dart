import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stats_list.g.dart';

@JsonSerializable()
class PokemonStatsList {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  final PokemonStat stat;
  PokemonStatsList({
    this.baseStat,
    this.effort,
    required this.stat,
  });

  factory PokemonStatsList.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatsListToJson(this);
}

@JsonSerializable()
class PokemonStat {
  final String? name;
  final String? url;
  PokemonStat({
    this.name,
    this.url,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}
