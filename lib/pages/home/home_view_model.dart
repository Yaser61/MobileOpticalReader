import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {

  ValueNotifier<XFile?> image = ValueNotifier(null);

}