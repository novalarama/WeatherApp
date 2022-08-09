class Cities {
  Data? data;

  Cities({this.data});

  Cities.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<Cities>? cities;

  Data({this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cities != null) {
      data['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class allCities {
  int? id;
  int? regionId;
  String? slug;
  String? name;
  dynamic code;
  String? latitude;
  String? longitude;
  String? location;
  int? order;
  bool? active;
  dynamic status;

  allCities(
      {this.id,
      this.regionId,
      this.slug,
      this.name,
      this.code,
      this.latitude,
      this.longitude,
      this.location,
      this.order,
      this.active,
      this.status});

  allCities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionId = json['region_id'];
    slug = json['slug'];
    name = json['name'];
    code = json['code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    order = json['order'];
    active = json['active'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['region_id'] = regionId;
    data['slug'] = slug;
    data['name'] = name;
    data['code'] = code;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['location'] = location;
    data['order'] = order;
    data['active'] = active;
    data['status'] = status;
    return data;
  }
}
