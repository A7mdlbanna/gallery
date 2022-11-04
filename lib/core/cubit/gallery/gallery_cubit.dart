import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gallery/ui/helper/app_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/model/gallery/gallery.dart';
import '../../../ui/helper/navigator.dart';
import '../../../ui/resources/app_routes.dart';
import '../../../ui/widgets/dialog/app_dialogs.dart';
import '../../../ui/widgets/network_error.dart';
import '../../../data/network/network_connection.dart';
import '../../../data/repository/gallery_repository.dart';
import '../../utils/big_print.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  GalleryRepository galleryRepository = GalleryRepository();
  void init(context)async {
    if (galleryRepository.getCachedGallery().isEmpty) {
      source == ConnectivityResult.none ? pushPage(context, const NetworkErrorScreen(isLogin: false,)) : null;
      await getGallery(context);
    } else {
      gallery = galleryRepository.getCachedGallery();
    }

  }

  List<String> gallery = [];
  Future<void> getGallery(context)async{
    emit(GetGalleryLoading());
    try {
      Response response = await galleryRepository.getGallery();
      if (response.statusCode! < 300) {
        bigPrint('#######RESPONSE: ${response.data}');
        final gallery = Gallery.fromJson(response.data);
        this.gallery = gallery.data?.images??[];
        /// SAVE DATA INTO LOCAL STORAGE
        try {
          await galleryRepository.saveGallery(this.gallery.map((e) => e.toString()).toList());
        } on Exception catch (e) {
          print(e.toString());
          emit(GetGalleryFailed());
        }
        emit(GetGallerySuccess());
      } else {
        emit(GetGalleryFailed());
      }
    } on Exception catch (e) {
      // AppDialogs.showErrorDialog(context, error: e.toString());
    }
  }

  void upload(XFile? image, context) async{
    if(image == null){
      AppToast.toast(msg: 'Image is Empty', context: context);
      return;
    }
    try {
      if(source == ConnectivityResult.none){
        pushName(context, AppRoutes.networkError);
        return;
      }
      Response response = await galleryRepository.uploadGallery(File(image.path));
      if(response.statusCode! < 300 && response.data['status'] == 'success'){
        AppToast.toast(msg: response.data['message'], context: context);
        getGallery(context);
      }
    } on Exception catch (e) {
      AppToast.toast(msg: 'There was an Error', context: context);
    }
  }
}
