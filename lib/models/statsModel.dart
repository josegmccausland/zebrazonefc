class StatsModel {
  String participantName;
  int particiantId;
  int teamId;
  int statValue;
  int subStatValue;
  int minutesPlayed;
  int matchesPlayed;
  int statValueCount;
  int rank;
  String participantCountryCode;
  String teamName;

  StatsModel(
      {this.participantName,
      this.particiantId,
      this.teamId,
      this.statValue,
      this.subStatValue,
      this.minutesPlayed,
      this.matchesPlayed,
      this.statValueCount,
      this.rank,
      this.participantCountryCode,
      this.teamName});

  StatsModel.fromJson(Map<String, dynamic> json) {
    participantName = json['ParticipantName'];
    particiantId = json['ParticiantId'];
    teamId = json['TeamId'];
    statValue = json['StatValue'];
    subStatValue = json['SubStatValue'];
    minutesPlayed = json['MinutesPlayed'];
    matchesPlayed = json['MatchesPlayed'];
    statValueCount = json['StatValueCount'];
    rank = json['Rank'];
    participantCountryCode = json['ParticipantCountryCode'];
    teamName = json['TeamName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ParticipantName'] = this.participantName;
    data['ParticiantId'] = this.particiantId;
    data['TeamId'] = this.teamId;
    data['StatValue'] = this.statValue;
    data['SubStatValue'] = this.subStatValue;
    data['MinutesPlayed'] = this.minutesPlayed;
    data['MatchesPlayed'] = this.matchesPlayed;
    data['StatValueCount'] = this.statValueCount;
    data['Rank'] = this.rank;
    data['ParticipantCountryCode'] = this.participantCountryCode;
    data['TeamName'] = this.teamName;
    return data;
  }
}
