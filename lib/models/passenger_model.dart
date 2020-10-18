class PassengerModel {
  int totalPassengers;
  int totalPages;
  List<Data> data;

  PassengerModel({this.totalPassengers, this.totalPages, this.data});

  PassengerModel.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPassengers'] = this.totalPassengers;
    data['totalPages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String passengerId;
  String name;
  int trips;
  Airline airline;
  int v;

  Data({this.passengerId, this.name, this.trips, this.airline, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    passengerId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    airline =
    json['airline'] != null ? new Airline.fromJson(json['airline']) : null;
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.passengerId;
    data['name'] = this.name;
    data['trips'] = this.trips;
    if (this.airline != null) {
      data['airline'] = this.airline.toJson();
    }
    data['__v'] = this.v;
    return data;
  }
}

class Airline {
  int airlineId;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;

  Airline(
      {this.airlineId,
        this.name,
        this.country,
        this.logo,
        this.slogan,
        this.headQuaters,
        this.website,
        this.established});

  Airline.fromJson(Map<String, dynamic> json) {
    airlineId = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.airlineId;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['slogan'] = this.slogan;
    data['head_quaters'] = this.headQuaters;
    data['website'] = this.website;
    data['established'] = this.established;
    return data;
  }
}
