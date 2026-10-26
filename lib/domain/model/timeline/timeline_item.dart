enum TimelineAction {
  accountCreated,
  eventAttended,
  eventUnattended,
  collabAdded,
  providerMediaFirstUpload,
  providerMediaUpload,
  providerEventFirstPublished,
  tournamentCreated,
  tournamentSeasonStarted,
  tournamentSeasonCompleted,
  tournamentMatchResult,
  unknown,
}

extension TimelineActionX on TimelineAction {
  static TimelineAction fromApi(String raw) {
    switch (raw) {
      case 'ACCOUNT_CREATED':
        return TimelineAction.accountCreated;
      case 'EVENT_ATTENDED':
        return TimelineAction.eventAttended;
      case 'EVENT_UNATTENDED':
        return TimelineAction.eventUnattended;
      case 'COLLAB_ADDED':
        return TimelineAction.collabAdded;
      case 'PROVIDER_MEDIA_UPLOAD':
        return TimelineAction.providerMediaUpload;
      case 'PROVIDER_MEDIA_FIRST_UPLOAD':
        return TimelineAction.providerMediaFirstUpload;
      case 'PROVIDER_EVENT_FIRST_PUBLISHED':
        return TimelineAction.providerEventFirstPublished;
      case 'TOURNAMENT_CREATED':
        return TimelineAction.tournamentCreated;
      case 'TOURNAMENT_SEASON_STARTED':
        return TimelineAction.tournamentSeasonStarted;
      case 'TOURNAMENT_SEASON_COMPLETED':
        return TimelineAction.tournamentSeasonCompleted;
      case 'TOURNAMENT_MATCH_RESULT':
        return TimelineAction.tournamentMatchResult;
      default:
        return TimelineAction.unknown;
    }
  }
}

class TimelineItem {
  final String uid;
  final String profileUid;
  final String actorUid;
  final TimelineAction action;
  final String occurredAt;
  final String visibility;
  final Map<String, dynamic> meta;

  const TimelineItem({
    this.uid = '',
    this.profileUid = '',
    this.actorUid = '',
    this.action = TimelineAction.unknown,
    this.occurredAt = '',
    this.visibility = 'logged_in',
    this.meta = const {},
  });

  factory TimelineItem.fromMap(Map<String, dynamic> map) {
    return TimelineItem(
      uid: map['uid'] as String? ?? '',
      profileUid: map['profileUid'] as String? ?? '',
      actorUid: map['actorUid'] as String? ?? '',
      action: TimelineActionX.fromApi(map['action'] as String? ?? ''),
      occurredAt: map['occurredAt'] as String? ?? '',
      visibility: map['visibility'] as String? ?? 'logged_in',
      meta: (map['meta'] as Map?)?.cast<String, dynamic>() ?? const {},
    );
  }

  String getMessage() {
    switch (action) {
      case TimelineAction.accountCreated:
        return 'Joined Regardless Mode';
      case TimelineAction.eventAttended:
        return 'Attended ${meta['eventName'] ?? 'an event'}';
      case TimelineAction.eventUnattended:
        return 'Unattended ${meta['eventName'] ?? 'an event'}';
      case TimelineAction.collabAdded:
        return 'Collaborated on ${(meta['providerUserName'] ?? meta['providerName'] ?? 'a provider')}';
      case TimelineAction.providerMediaFirstUpload:
        return 'Published first media upload';
      case TimelineAction.providerMediaUpload:
        return 'Uploaded ${meta['count']} media items';
      case TimelineAction.providerEventFirstPublished:
        return meta['summary'] ?? 'Published first event';
      case TimelineAction.tournamentCreated:
        return meta['summary'] ?? 'Created a tournament';
      case TimelineAction.tournamentSeasonStarted:
        return meta['summary'] ?? 'Started a tournament season';
      case TimelineAction.tournamentSeasonCompleted:
        return meta['summary'] ?? 'Completed a tournament season';
      case TimelineAction.tournamentMatchResult:
        return meta['summary'] ?? 'Recorded a tournament result';
      default:
        return 'Activity updated';
    }
  }
}
