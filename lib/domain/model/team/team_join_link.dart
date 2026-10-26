class TeamJoinLink {
  const TeamJoinLink({
    required this.uid,
    required this.teamUid,
    required this.ownerUid,
    required this.createdAt,
    required this.expiresAt,
    this.createdByUid = '',
    this.revokedAt,
    this.status = 'active',
    this.teamName = '',
  });

  final String uid;
  final String teamUid;
  final String ownerUid;
  final String createdByUid;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final DateTime? revokedAt;
  final String status;
  final String teamName;

  bool get isRevoked => revokedAt != null || status == 'revoked';
  bool get isExpired =>
      expiresAt == null || !expiresAt!.isAfter(DateTime.now());
  bool get isActive => !isRevoked && !isExpired && status == 'active';

  factory TeamJoinLink.fromMap(Map<String, dynamic> map) => TeamJoinLink(
    uid: map['uid'] as String? ?? '',
    teamUid: map['teamUid'] as String? ?? '',
    ownerUid: map['ownerUid'] as String? ?? '',
    createdByUid: map['createdByUid'] as String? ?? '',
    createdAt: DateTime.tryParse(map['createdAt']?.toString() ?? ''),
    expiresAt: DateTime.tryParse(map['expiresAt']?.toString() ?? ''),
    revokedAt: DateTime.tryParse(map['revokedAt']?.toString() ?? ''),
    status: map['status'] as String? ?? 'active',
    teamName: map['teamName'] as String? ?? '',
  );
}
