import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Imageprovider with ChangeNotifier {
  XFile? _image;
  bool _showNetwork = true;
  final List<XFile> _imageFileList = [];
  XFile? get image => _image;
  List<XFile?> get imageFileList => _imageFileList;
  bool get showNetwork => _showNetwork;

  void setImage(image) {
    _image = image;
    notifyListeners();
  }

  void setGalleryImages(image) {
    _imageFileList.addAll(image);
    notifyListeners();
  }

  void removeImage(bool notify) {
    _image = null;
    if(notify == true) {
      notifyListeners();
    }

}
  void removeGalleryImage(bool notify) {
    _imageFileList.clear();
    notifyListeners();
  }
  
  void removeOneGalleryImage(int passindex) {
    _imageFileList.removeAt(passindex);
    notifyListeners();
  }
  void removenetworkImage(bool value) {
    _showNetwork = value;
    notifyListeners();
  }
}
