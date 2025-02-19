import 'dart:convert';

DeezerSongModel deezerSongModelFromJson(String str) =>
    DeezerSongModel.fromJson(json.decode(str));

String deezerSongModelToJson(DeezerSongModel data) =>
    json.encode(data.toJson());

class DeezerSongModel {
  String id;
  bool readable;
  String title;
  String titleShort;
  String titleVersion;
  String isrc;
  String link;
  String share;
  String duration;
  int trackPosition;
  int diskNumber;
  String rank;
  DateTime releaseDate;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  String preview;
  double bpm;
  double gain;
  List<String> availableCountries;
  List<Contributor> contributors;
  String md5Image;
  String trackToken;
  Artist artist;
  Album album;
  String type;

  DeezerSongModel({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.isrc,
    required this.link,
    required this.share,
    required this.duration,
    required this.trackPosition,
    required this.diskNumber,
    required this.rank,
    required this.releaseDate,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.bpm,
    required this.gain,
    required this.availableCountries,
    required this.contributors,
    required this.md5Image,
    required this.trackToken,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory DeezerSongModel.fromJson(Map<String, dynamic> json) {
    return DeezerSongModel(
      id: json["id"].toString(),
      readable: json["readable"] ?? false,
      title: json["title"] ?? "",
      titleShort: json["title_short"] ?? "",
      titleVersion: json["title_version"] ?? "",
      isrc: json["isrc"] ?? "",
      link: json["link"] ?? "",
      share: json["share"].toString(), // Konwersja do String
      duration: json["duration"].toString(), // Konwersja do String
      trackPosition: json["track_position"] ?? 0,
      diskNumber: json["disk_number"] ?? 0,
      rank: json["rank"].toString(), // Konwersja do String
      releaseDate: DateTime.tryParse(json["release_date"]) ?? DateTime.now(),
      explicitLyrics: json["explicit_lyrics"] ?? false,
      explicitContentLyrics: json["explicit_content_lyrics"] ?? 0,
      explicitContentCover: json["explicit_content_cover"] ?? 0,
      preview: json["preview"] ?? "",
      bpm: json["bpm"]?.toDouble() ?? 0.0,
      gain: json["gain"]?.toDouble() ?? 0.0,
      availableCountries: List<String>.from(json["available_countries"] ?? []),
      contributors: List<Contributor>.from((json["contributors"] ?? []).map((x) => Contributor.fromJson(x))),
      md5Image: json["md5_image"] ?? "",
      trackToken: json["track_token"] ?? "",
      artist: Artist.fromJson(json["artist"] ?? {}),
      album: Album.fromJson(json["album"] ?? {}),
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "readable": readable,
    "title": title,
    "title_short": titleShort,
    "title_version": titleVersion,
    "isrc": isrc,
    "link": link,
    "share": share,
    "duration": duration,
    "track_position": trackPosition,
    "disk_number": diskNumber,
    "rank": rank,
    "release_date": releaseDate.toIso8601String(),
    "explicit_lyrics": explicitLyrics,
    "explicit_content_lyrics": explicitContentLyrics,
    "explicit_content_cover": explicitContentCover,
    "preview": preview,
    "bpm": bpm,
    "gain": gain,
    "available_countries": List<dynamic>.from(availableCountries.map((x) => x)),
    "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
    "md5_image": md5Image,
    "track_token": trackToken,
    "artist": artist.toJson(),
    "album": album.toJson(),
    "type": type,
  };
}

class Album {
  String id;
  String title;
  String link;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  DateTime releaseDate;
  String tracklist;
  String type;

  Album({
    required this.id,
    required this.title,
    required this.link,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.releaseDate,
    required this.tracklist,
    required this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    id: json["id"].toString(),
    title: json["title"] ?? "",
    link: json["link"] ?? "",
    cover: json["cover"] ?? "",
    coverSmall: json["cover_small"] ?? "",
    coverMedium: json["cover_medium"] ?? "",
    coverBig: json["cover_big"] ?? "",
    coverXl: json["cover_xl"] ?? "",
    md5Image: json["md5_image"] ?? "",
    releaseDate: DateTime.tryParse(json["release_date"]) ?? DateTime.now(),
    tracklist: json["tracklist"] ?? "",
    type: json["type"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "link": link,
    "cover": cover,
    "cover_small": coverSmall,
    "cover_medium": coverMedium,
    "cover_big": coverBig,
    "cover_xl": coverXl,
    "md5_image": md5Image,
    "release_date": releaseDate.toIso8601String(),
    "tracklist": tracklist,
    "type": type,
  };
}

class Artist {
  String id;
  String name;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  String type;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.type,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"].toString(),
    name: json["name"] ?? "",
    link: json["link"] ?? "",
    share: json["share"] ?? "",
    picture: json["picture"] ?? "",
    pictureSmall: json["picture_small"] ?? "",
    pictureMedium: json["picture_medium"] ?? "",
    pictureBig: json["picture_big"] ?? "",
    pictureXl: json["picture_xl"] ?? "",
    radio: json["radio"] ?? false,
    tracklist: json["tracklist"] ?? "",
    type: json["type"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "link": link,
    "share": share,
    "picture": picture,
    "picture_small": pictureSmall,
    "picture_medium": pictureMedium,
    "picture_big": pictureBig,
    "picture_xl": pictureXl,
    "radio": radio,
    "tracklist": tracklist,
    "type": type,
  };
}

class Contributor {
  int id;
  String name;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  String type;
  String role;

  Contributor({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.type,
    required this.role,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
    id: json["id"],
    name: json["name"] ?? "",
    link: json["link"] ?? "",
    share: json["share"] ?? "",
    picture: json["picture"] ?? "",
    pictureSmall: json["picture_small"] ?? "",
    pictureMedium: json["picture_medium"] ?? "",
    pictureBig: json["picture_big"] ?? "",
    pictureXl: json["picture_xl"] ?? "",
    radio: json["radio"] ?? false,
    tracklist: json["tracklist"] ?? "",
    type: json["type"] ?? "",
    role: json["role"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "link": link,
    "share": share,
    "picture": picture,
    "picture_small": pictureSmall,
    "picture_medium": pictureMedium,
    "picture_big": pictureBig,
    "picture_xl": pictureXl,
    "radio": radio,
    "tracklist": tracklist,
    "type": type,
    "role": role,
  };
}
