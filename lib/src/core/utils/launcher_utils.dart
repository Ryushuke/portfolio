import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  // Método estático: você pode chamar sem criar uma instância da classe
  static Future<void> abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível abrir $url');
    }
  }
}
