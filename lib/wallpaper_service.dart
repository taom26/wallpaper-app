import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class WallpaperService {
  Future<void> setWallpaper(String imageUrl) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      try {
        var dio = Dio();
        var dir = await getExternalStorageDirectory();
        String savePath = "${dir!.path}/${imageUrl.split('/').last}";
        await dio.download(imageUrl, savePath);
        bool result = await WallpaperManager.setWallpaperFromFile(
            savePath, WallpaperManager.HOME_SCREEN);

        if (result) {
          Fluttertoast.showToast(msg: 'Fondo de pantalla aplicado con éxito');
        } else {
          Fluttertoast.showToast(msg: 'Error al aplicar el fondo de pantalla');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: 'Error: $e');
      }
    } else {
      Fluttertoast.showToast(msg: 'Permiso de almacenamiento denegado');
    }
  }
}
