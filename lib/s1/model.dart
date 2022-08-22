class Welcome7 {
    Welcome7({
       required this.status,
       required this.response,
    });

    String status;
    Response response;
}

class Response {
    Response({
        this.items,
    });

    List<Item>? items;
}

class Item {
    Item({
        required this.competition,
        required this.teama,
        required this.teamb,
        required this.dateStart,
        required this.result,
        required this.winMargin,
        required this.winningTeamId,
        required this.toss,
    });

    Competition competition;
    Team teama;
    Team teamb;
    DateTime dateStart;
    String result;
    String winMargin;
    int winningTeamId;
    Toss toss;
}

class Competition {
    Competition({
        required this.title,
        required this.matchFormat,
        required this.status,
        required this.season,
        required this.datestart,
        required this.totalTeams,
    });

    String title;
    String matchFormat;
    String status;
    String season;
    DateTime datestart;
    String totalTeams;
}

class Team {
    Team({
        required this.teamId,
        required this.name,
        required this.shortName,
        required this.logoUrl,
        required this.scores,
        required this.overs,
    });

    int teamId;
    String name;
    String shortName;
    String logoUrl;
    String scores;
    String overs;
}

class Toss {
    Toss({
        required this.text,
        required this.winner,
        required this.decision,
    });

    String text;
    int winner;
    int decision;
}
