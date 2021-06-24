class FixtureModel {
  int id;
  String pageUrl;
  String monthYearKey;
  Opponent opponent;
  bool isPastMatch;
  List<String> lnameArr;
  String color;
  bool notStarted;
  Status status;

  FixtureModel(
      {this.id,
      this.pageUrl,
      this.monthYearKey,
      this.opponent,
      this.isPastMatch,
      this.lnameArr,
      this.color,
      this.notStarted,
      this.status});

  FixtureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageUrl = json['pageUrl'];
    monthYearKey = json['monthYearKey'];
    opponent = json['opponent'] != null
        ? new Opponent.fromJson(json['opponent'])
        : null;
    isPastMatch = json['isPastMatch'];
    lnameArr = json['lnameArr'].cast<String>();
    color = json['color'];
    notStarted = json['notStarted'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageUrl'] = this.pageUrl;
    data['monthYearKey'] = this.monthYearKey;
    if (this.opponent != null) {
      data['opponent'] = this.opponent.toJson();
    }
    data['isPastMatch'] = this.isPastMatch;
    data['lnameArr'] = this.lnameArr;
    data['color'] = this.color;
    data['notStarted'] = this.notStarted;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Opponent {
  int id;
  String name;
  int score;

  Opponent({this.id, this.name, this.score});

  Opponent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }
}

class Status {
  bool finished;
  bool started;
  bool cancelled;
  String scoreStr;
  String startDateStr;
  Reason reason;

  Status(
      {this.finished,
      this.started,
      this.cancelled,
      this.scoreStr,
      this.startDateStr,
      this.reason});

  Status.fromJson(Map<String, dynamic> json) {
    finished = json['finished'];
    started = json['started'];
    cancelled = json['cancelled'];
    scoreStr = json['scoreStr'];
    startDateStr = json['startDateStr'];
    reason =
        json['reason'] != null ? new Reason.fromJson(json['reason']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finished'] = this.finished;
    data['started'] = this.started;
    data['cancelled'] = this.cancelled;
    data['scoreStr'] = this.scoreStr;
    data['startDateStr'] = this.startDateStr;
    if (this.reason != null) {
      data['reason'] = this.reason.toJson();
    }
    return data;
  }
}

class Reason {
  String short;
  String long;

  Reason({this.short, this.long});

  Reason.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['long'] = this.long;
    return data;
  }
}
