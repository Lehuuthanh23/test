class Device {
  final String id;
  final String name;
  final String status;
  final String type;
  final String directory;
  final String owner;
  final String imageUrl;

  Device({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.directory,
    required this.owner,
    required this.imageUrl,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      type: json['type'],
      directory: json['directory'],
      owner: json['owner'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'type': type,
      'directory': directory,
      'owner': owner,
      'imageUrl': imageUrl,
    };
  }
}