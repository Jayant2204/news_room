import 'package:share/share.dart';

void shareFiles({String message, String filePath}) {
  if (filePath != null && filePath.isNotEmpty) {
    Share.share(message);
  } else {
    Share.shareFiles([filePath], text: message);
  }
}
