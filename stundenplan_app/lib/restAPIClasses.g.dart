// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restAPIClasses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entfall _$EntfallFromJson(Map<String, dynamic> json) {
  return Entfall(
    json['kurs'] == null
        ? null
        : Kurs.fromJson(json['kurs'] as Map<String, dynamic>),
    json['stunde'] == null
        ? null
        : Stunde.fromJson(json['stunde'] as Map<String, dynamic>),
    json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
  );
}

Map<String, dynamic> _$EntfallToJson(Entfall instance) => <String, dynamic>{
      'kurs': instance.kurs,
      'stunde': instance.stunde,
      'datum': instance.datum?.toIso8601String(),
    };

Fach _$FachFromJson(Map<String, dynamic> json) {
  return Fach(
    json['fach'] as String,
    json['kuerzel'] as String,
  );
}

Map<String, dynamic> _$FachToJson(Fach instance) => <String, dynamic>{
      'fach': instance.fach,
      'kuerzel': instance.kuerzel,
    };

Kurs _$KursFromJson(Map<String, dynamic> json) {
  return Kurs(
    json['bezeichnung'] as String,
    json['fach'] == null
        ? null
        : Fach.fromJson(json['fach'] as Map<String, dynamic>),
    json['stufe'] == null
        ? null
        : Stufe.fromJson(json['stufe'] as Map<String, dynamic>),
    json['lehrer'] == null
        ? null
        : Lehrer.fromJson(json['lehrer'] as Map<String, dynamic>),
    (json['stunden'] as List)
        ?.map((e) =>
            e == null ? null : Stunde.fromJson(e as Map<String, dynamic>))
        ?.toSet(),
  );
}

Map<String, dynamic> _$KursToJson(Kurs instance) => <String, dynamic>{
      'bezeichnung': instance.bezeichnung,
      'fach': instance.fach,
      'stufe': instance.stufe,
      'lehrer': instance.lehrer,
      'stunden': instance.stunden?.toList(),
    };

Lehrer _$LehrerFromJson(Map<String, dynamic> json) {
  return Lehrer(
    nachname: json['nachname'] as String,
    anrede: json['anrede'] as String,
    kuerzel: json['kuerzel'] as String,
  );
}

Map<String, dynamic> _$LehrerToJson(Lehrer instance) => <String, dynamic>{
      'nachname': instance.nachname,
      'anrede': instance.anrede,
      'kuerzel': instance.kuerzel,
    };

NeuerNutzer _$NeuerNutzerFromJson(Map<String, dynamic> json) {
  return NeuerNutzer(
    json['vorname'] as String,
    json['nachname'] as String,
    json['benutzername'] as String,
    json['passwort'] as String,
  );
}

Map<String, dynamic> _$NeuerNutzerToJson(NeuerNutzer instance) =>
    <String, dynamic>{
      'vorname': instance.vorname,
      'nachname': instance.nachname,
      'benutzername': instance.benutzername,
      'passwort': instance.passwort,
    };

Schueler _$SchuelerFromJson(Map<String, dynamic> json) {
  return Schueler(
    json['stufe'] == null
        ? null
        : Stufe.fromJson(json['stufe'] as Map<String, dynamic>),
    json['benutzername'] as String,
    json['vorname'] as String,
    json['nachname'] as String,
    (json['kurse'] as List)
        ?.map(
            (e) => e == null ? null : Kurs.fromJson(e as Map<String, dynamic>))
        ?.toSet(),
  );
}

Map<String, dynamic> _$SchuelerToJson(Schueler instance) => <String, dynamic>{
      'stufe': instance.stufe,
      'benutzername': instance.benutzername,
      'vorname': instance.vorname,
      'nachname': instance.nachname,
      'kurse': instance.kurse?.toList(),
    };

Stufe _$StufeFromJson(Map<String, dynamic> json) {
  return Stufe(
    json['stufe'] as String,
  );
}

Map<String, dynamic> _$StufeToJson(Stufe instance) => <String, dynamic>{
      'stufe': instance.stufe,
    };

Stunde _$StundeFromJson(Map<String, dynamic> json) {
  return Stunde(
    json['tag'] as int,
    json['stunde'] as int,
  );
}

Map<String, dynamic> _$StundeToJson(Stunde instance) => <String, dynamic>{
      'tag': instance.tag,
      'stunde': instance.stunde,
    };
