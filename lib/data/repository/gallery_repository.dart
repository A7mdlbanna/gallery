import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/utils/api_path.dart';
import '../../core/utils/api_service.dart';
import '../../core/utils/app_local_storage.dart';
import '../../core/utils/big_print.dart';

class GalleryRepository {

  List<String> gallery = [];
  static const String galleryKey = 'gallery_data';

  /// Get Api
  Future<Response> getGallery() async {
    final Response<dynamic> response = await ApiService.getApi(
      ApiPaths.myGallery,);
    return response;
  }

  Future<void> saveGallery(List<String> gallery) async {
    print(jsonEncode(gallery));
    await AppLocalStorage.saveData(key: galleryKey, value: jsonEncode(gallery));
    this.gallery = gallery;
    print('----------gallery were saved----------');
  }

  Future<void> removeGallery() async {
    await AppLocalStorage.removeData(galleryKey);
    gallery = [];
    print('----------gallery were removed----------');
  }

  List<String> getCachedGallery() {
    if (AppLocalStorage.getData(key: galleryKey) == null) return [];
    final galleryJsonData = jsonDecode(AppLocalStorage.getData(key: galleryKey)??'[]');
    bigPrint('$galleryJsonData');
    gallery = [];
    if(galleryJsonData.isNotEmpty) galleryJsonData.forEach((element) => gallery.add(element.toString()));
    print('----------gallery got----------');
    return gallery;
  }

  Future<Response> uploadGallery(File image)async {
    final Response response = await ApiService.upload(ApiPaths.upload, file: image,);
    return response;
  }
}

