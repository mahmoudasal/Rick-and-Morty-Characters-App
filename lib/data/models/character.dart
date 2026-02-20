class Character {
  int id;
  String name;
  Status status;
  Species species;
  String type;
  Gender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: _statusFromString(json['status']),
      species: _speciesFromString(json['species']),
      type: json['type'],
      gender: _genderFromString(json['gender']),
      origin: Location.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }
}

enum Gender { FEMALE, MALE, UNKNOWN }

Gender _genderFromString(String gender) {
  switch (gender.toLowerCase()) {
    case 'female':
      return Gender.FEMALE;
    case 'male':
      return Gender.MALE;
    default:
      return Gender.UNKNOWN;
  }
}

class Location {
  String name;
  String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'], url: json['url']);
  }
}

enum Species { ALIEN, HUMAN }

Species _speciesFromString(String species) {
  switch (species.toLowerCase()) {
    case 'alien':
      return Species.ALIEN;
    case 'human':
      return Species.HUMAN;
    default:
      return Species.HUMAN;
  }
}

enum Status { ALIVE, DEAD, UNKNOWN }

Status _statusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'alive':
      return Status.ALIVE;
    case 'dead':
      return Status.DEAD;
    default:
      return Status.UNKNOWN;
  }
}
