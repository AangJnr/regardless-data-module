
class PlayerProfileConfig {
  final bool allowCustomPosition;
  final List<PlayerProfileOption> positions;
  final List<PlayerProfileStat> stats;
  final List<PlayerProfileDetail> details;
  final PlayerProfileJerseyNumber jerseyNumber;

  const PlayerProfileConfig({
    this.allowCustomPosition = false,
    this.positions = const [],
    this.stats = const [],
    this.details = const [],
    this.jerseyNumber = const PlayerProfileJerseyNumber(),
  });

  factory PlayerProfileConfig.fromMap(Map<String, dynamic> raw) {
    final positions = (raw['positions'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (item) => PlayerProfileOption(
            key: (item['key'] as String?) ?? '',
            label: (item['label'] as String?) ?? '',
          ),
        )
        .toList();

    final stats = (raw['stats'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (item) => PlayerProfileStat(
            key: (item['key'] as String?) ?? '',
            label: (item['label'] as String?) ?? '',
            type: (item['type'] as String?) ?? 'number',
            minimum: item['minimum'] as num?,
            maximum: item['maximum'] as num?,
          ),
        )
        .toList();

    final details = (raw['playerDetails'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (item) => PlayerProfileDetail(
            key: (item['key'] as String?) ?? '',
            label: (item['label'] as String?) ?? '',
            type: (item['type'] as String?) ?? 'text',
            minimum: (item['minimum'] as num?)?.toInt(),
            maximum: (item['maximum'] as num?)?.toInt(),
            maxLength: (item['maxLength'] as num?)?.toInt() ?? 500,
            multiline: item['multiline'] == true,
          ),
        )
        .toList();

    final jerseyConfig = raw['jerseyNumber'] as Map? ?? const {};
    return PlayerProfileConfig(
      allowCustomPosition: raw['allowCustomPosition'] == true,
      positions: positions,
      stats: stats,
      details: details,
      jerseyNumber: PlayerProfileJerseyNumber(
        enabled: jerseyConfig['enabled'] == true,
        minimum: (jerseyConfig['minimum'] as num?)?.toInt() ?? 0,
        maximum: (jerseyConfig['maximum'] as num?)?.toInt() ?? 99,
      ),
    );
  }
}

class PlayerProfileDetail {
  final String key;
  final String label;
  final String type;
  final int? minimum;
  final int? maximum;
  final int maxLength;
  final bool multiline;

  const PlayerProfileDetail({
    required this.key,
    required this.label,
    required this.type,
    this.minimum,
    this.maximum,
    this.maxLength = 500,
    this.multiline = false,
  });
}

class PlayerProfileOption {
  final String key;
  final String label;

  const PlayerProfileOption({required this.key, required this.label});
}

class PlayerProfileStat {
  final String key;
  final String label;
  final String type;
  final num? minimum;
  final num? maximum;

  const PlayerProfileStat({
    required this.key,
    required this.label,
    required this.type,
    this.minimum,
    this.maximum,
  });
}

class PlayerProfileJerseyNumber {
  final bool enabled;
  final int minimum;
  final int maximum;

  const PlayerProfileJerseyNumber({
    this.enabled = false,
    this.minimum = 0,
    this.maximum = 99,
  });
}
