import 'dart:convert';

Measurement measurementFromJson(String str) => Measurement.fromJson(json.decode(str));

String measurementToJson(Measurement data) => json.encode(data.toJson());

class Measurement {
   int? status;
    D? d;
    Measurement({
        this.status,
        this.d,
    });

   

    factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        status: json["status"],
        d: D.fromJson(json["d"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "d": d!.toJson(),
    };
}

class D {
    D({
        this.measurementId,
        this.neck,
        this.height,
        this.weight,
        this.belly,
        this.chest,
        this.wrist,
        this.armLength,
        this.thigh,
        this.shoulder,
        this.hips,
        this.ankle,
    });

    String? measurementId;
    String? neck;
    String? height;
    String? weight;
    String? belly;
    String? chest;
    String? wrist;
    String? armLength;
    String? thigh;
    String? shoulder;
    String? hips;
    String? ankle;

    factory D.fromJson(Map<String, dynamic> json) => D(
        measurementId: json["measurementId"],
        neck: json["neck"],
        height: json["height"],
        weight: json["weight"],
        belly: json["belly"],
        chest: json["chest"],
        wrist: json["wrist"],
        armLength: json["armLength"],
        thigh: json["thigh"],
        shoulder: json["shoulder"],
        hips: json["hips"],
        ankle: json["ankle"],
    );

    Map<String, dynamic> toJson() => {
        "measurementId": measurementId,
        "neck": neck,
        "height": height,
        "weight": weight,
        "belly": belly,
        "chest": chest,
        "wrist": wrist,
        "armLength": armLength,
        "thigh": thigh,
        "shoulder": shoulder,
        "hips": hips,
        "ankle": ankle,
    };
}
