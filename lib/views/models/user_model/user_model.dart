// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names

class UserModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  int? width;
  int? height;
  String? color;
  int? likes;
  User? user;
  Urls? urls;
  Links? links;
  Location? location;
  Exif? exif;
  int? views;
  int? downloads;

  UserModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.width,
      this.height,
      this.color,
      this.likes,
      this.user,
      this.urls,
      this.links,
      this.location,
      this.exif,
      this.views,
      this.downloads});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    likes = json['likes'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    exif = json['exif'] != null ? new Exif.fromJson(json['exif']) : null;
    views = json['views'];
    downloads = json['downloads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['likes'] = this.likes;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.exif != null) {
      data['exif'] = this.exif!.toJson();
    }
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    return data;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  Links? links;
  ProfileImage? profileImage;
  int? totalCollections;
  String? instagramUsername;
  int? totalLikes;
  int? totalPhotos;

  User(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.links,
      this.profileImage,
      this.totalCollections,
      this.instagramUsername,
      this.totalLikes,
      this.totalPhotos});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    totalCollections = json['total_collections'];
    instagramUsername = json['instagram_username'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage!.toJson();
    }
    data['total_collections'] = this.totalCollections;
    data['instagram_username'] = this.instagramUsername;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  Links(
      {this.self,
      this.html,
      this.photos,
      this.likes,
      this.portfolio,
      this.following,
      this.followers});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

// class Links {
//   String? self;
//   String? html;
//   String? download;
//   String? downloadLocation;

//   Links({this.self, this.html, this.download, this.downloadLocation});

//   Links.fromJson(Map<String, dynamic> json) {
//     self = json['self'];
//     html = json['html'];
//     download = json['download'];
//     downloadLocation = json['download_location'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['self'] = this.self;
//     data['html'] = this.html;
//     data['download'] = this.download;
//     data['download_location'] = this.downloadLocation;
//     return data;
//   }
// }

class Location {
  String? name;
  String? city;
  String? country;
  Position? position;

  Location({this.name, this.city, this.country, this.position});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    country = json['country'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    return data;
  }
}

class Position {
  double? latitude;
  double? longitude;

  Position({this.latitude, this.longitude});

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Exif {
  String? make;
  String? model;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;

  Exif(
      {this.make,
      this.model,
      this.exposureTime,
      this.aperture,
      this.focalLength,
      this.iso});

  Exif.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    data['model'] = this.model;
    data['exposure_time'] = this.exposureTime;
    data['aperture'] = this.aperture;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    return data;
  }
}
