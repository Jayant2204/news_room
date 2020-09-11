import 'package:share/share.dart';

void shareFiles({String message, String filePath}) {
  if (filePath != null && filePath.isNotEmpty) {
    Share.shareFiles([filePath]);
  } else {
    Share.share(message);
  }
}
