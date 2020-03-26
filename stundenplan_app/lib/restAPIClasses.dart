import 'package:json_annotation/json_annotation.dart';

part 'restAPIClasses.g.dart';

@JsonSerializable()
class Entfall {
  Kurs kurs;
  Stunde stunde;
  DateTime datum;

  Entfall(this.kurs, this.stunde, this.datum);

  factory Entfall.fromJson(Map<String, dynamic> json) => _$EntfallFromJson(json);
  Map<String, dynamic> toJson() => _$EntfallToJson(this);
}

@JsonSerializable()
class Fach {
  String fach;
  String kuerzel;

  Fach(this.fach, this.kuerzel);

  factory Fach.fromJson(Map<String, dynamic> json) => _$FachFromJson(json);
  Map<String, dynamic> toJson() => _$FachToJson(this);
}

@JsonSerializable()
class Kurs {
  String bezeichnung;
  Fach fach;
  Stufe stufe;
  Lehrer lehrer;
  Set<Stunde> stunden;

  Kurs(this.bezeichnung, this.fach, this.stufe, this.lehrer, this.stunden);

  factory Kurs.fromJson(Map<String, dynamic> json) => _$KursFromJson(json);
  Map<String, dynamic> toJson() => _$KursToJson(this);
}

@JsonSerializable()
class Lehrer {
  String nachname;
  String anrede;
  String kuerzel;

  Lehrer({this.nachname, this.anrede, this.kuerzel});

  factory Lehrer.fromJson(Map<String, dynamic> json) => _$LehrerFromJson(json);
  Map<String, dynamic> toJson() => _$LehrerToJson(this);
}

@JsonSerializable()
class NeuerNutzer {
  String vorname;
  String nachname;
  String benutzername;
  String passwort;

  NeuerNutzer(this.vorname, this.nachname, this.benutzername, this.passwort);

  factory NeuerNutzer.fromJson(Map<String, dynamic> json) => _$NeuerNutzerFromJson(json);
  Map<String, dynamic> toJson() => _$NeuerNutzerToJson(this);
}

@JsonSerializable()
class Schueler {
  Stufe stufe;
  String benutzername;
  String vorname;
  String nachname;
  Set<Kurs> kurse;

  Schueler(this.stufe, this.benutzername, this.vorname, this.nachname,
      this.kurse);

  factory Schueler.fromJson(Map<String, dynamic> json) => _$SchuelerFromJson(json);
  Map<String, dynamic> toJson() => _$SchuelerToJson(this);
}

@JsonSerializable()
class Stufe {
  String stufe;

  Stufe(this.stufe);

  factory Stufe.fromJson(Map<String, dynamic> json) => _$StufeFromJson(json);
  Map<String, dynamic> toJson() => _$StufeToJson(this);
}

@JsonSerializable()
class Stunde {
  int tag;
  int stunde;

  Stunde(this.tag, this.stunde);

  factory Stunde.fromJson(Map<String, dynamic> json) => _$StundeFromJson(json);
  Map<String, dynamic> toJson() => _$StundeToJson(this);
}

