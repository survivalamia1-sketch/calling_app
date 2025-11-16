/// Represents the layout mode for displaying participants
enum MeetingLayout {
  /// Gallery view - all participants in a grid
  gallery,

  /// Speaker view - active speaker prominently displayed
  speaker,

  /// Pinned participant view
  pinned,
}

extension MeetingLayoutX on MeetingLayout {
  String get displayName {
    switch (this) {
      case MeetingLayout.gallery:
        return 'Gallery View';
      case MeetingLayout.speaker:
        return 'Speaker View';
      case MeetingLayout.pinned:
        return 'Pinned View';
    }
  }

  String get description {
    switch (this) {
      case MeetingLayout.gallery:
        return 'See everyone at once';
      case MeetingLayout.speaker:
        return 'Focus on active speaker';
      case MeetingLayout.pinned:
        return 'Pin a specific participant';
    }
  }
}
