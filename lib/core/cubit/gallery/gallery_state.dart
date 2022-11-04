part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GetGalleryLoading extends GalleryState {}
class GetGallerySuccess extends GalleryState {}
class GetGalleryFailed extends GalleryState {}