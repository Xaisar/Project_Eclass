
class Profile {
  String id;
  String nisn;
  String nama;
  String alamat;
  String telpon;
  String email;
  String gender;
  String tempat_lahir;
  String tanggal_lahir;
  String telpon_orangtua;

  Profile({
    required this.id,
    required this.nisn,
    required this.nama,
    required this.alamat,
    required this.telpon,
    required this.email,
    required this.gender,
    required this.tempat_lahir,
    required this.tanggal_lahir,
    required this.telpon_orangtua
  });

  factory Profile.fromJson(Map<String,dynamic> json){
    return new Profile(
      id : json['id'].toString(),
      nisn: json['identity_number'].toString(),
      nama: json['name'].toString(),
      alamat: json['address'].toString(),
      telpon: json['phone_number'].toString(),
      email: json['email'].toString(),
      gender: json['gender'].toString(),
      tempat_lahir: json['birthplace'].toString(),
      tanggal_lahir: json['birthdate'].toString(),
      telpon_orangtua: json['parent_phone_number'].toString()
    );
  }
}