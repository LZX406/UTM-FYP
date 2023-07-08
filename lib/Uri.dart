// ignore: file_names
Uri setUri(String link) {
  Uri httpsUri = Uri.https('');
  if (link.isNotEmpty && link.length > 9) {
    if (link.substring(1, 5) == 'https') {
      httpsUri = Uri.https(link.substring(8));
    } else if (link.substring(1, 4) == 'http') {
      httpsUri = Uri.https(link.substring(7));
    } else {
      httpsUri = Uri.https(link);
    }
  }
  return httpsUri;
}
