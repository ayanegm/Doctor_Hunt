import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CloudinaryService {
  static const String cloudName = 'xmsmt5kq';
  static const String uploadPreset = 'doctor_hunt_preset';

  static Future<String?> uploadImage(File imageFile) async {
    try {
      final uri = Uri.parse(
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      );

      var request = http.MultipartRequest('POST', uri)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonMap = json.decode(responseData);

        return jsonMap['secure_url'];
      } else {
        var responseData = await response.stream.bytesToString(); // Add this
        print('Upload failed with status: ${response.statusCode}');
        print('Cloudinary Error Response: $responseData'); // Add this
        return null;
      }
    } catch (e) {
      print('Error uploading to Cloudinary: $e');
      return null;
    }
  }
}
