class TableModel {
  String qualColor;
  int idx;
  String name;
  int id;
  String pageUrl;
  bool featuredInMatch;
  int played;
  int wins;
  int draws;
  int losses;
  String scoresStr;
  int goalConDiff;
  int pts;
  Null deduction;

  TableModel(
      {this.qualColor,
      this.idx,
      this.name,
      this.id,
      this.pageUrl,
      this.featuredInMatch,
      this.played,
      this.wins,
      this.draws,
      this.losses,
      this.scoresStr,
      this.goalConDiff,
      this.pts,
      this.deduction});

  TableModel.fromJson(Map<String, dynamic> json) {
    qualColor = json['qualColor'];
    idx = json['idx'];
    name = json['name'];
    id = json['id'];
    pageUrl = json['pageUrl'];
    featuredInMatch = json['featuredInMatch'];
    played = json['played'];
    wins = json['wins'];
    draws = json['draws'];
    losses = json['losses'];
    scoresStr = json['scoresStr'];
    goalConDiff = json['goalConDiff'];
    pts = json['pts'];
    deduction = json['deduction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qualColor'] = this.qualColor;
    data['idx'] = this.idx;
    data['name'] = this.name;
    data['id'] = this.id;
    data['pageUrl'] = this.pageUrl;
    data['featuredInMatch'] = this.featuredInMatch;
    data['played'] = this.played;
    data['wins'] = this.wins;
    data['draws'] = this.draws;
    data['losses'] = this.losses;
    data['scoresStr'] = this.scoresStr;
    data['goalConDiff'] = this.goalConDiff;
    data['pts'] = this.pts;
    data['deduction'] = this.deduction;
    return data;
  }
}
