// ignore: file_names
Uri setUri(String link) {
  Uri httpsUri = Uri.https('');
  if (link.isNotEmpty && link.length > 9) {
    if (link.substring(1, 5) == 'https') {
      httpsUri = Uri.parse(link.substring(7));
    } else if (link.substring(1, 4) == 'http') {
      httpsUri = Uri.parse(link.substring(6));
    } else if (link.substring(1, 4) != 'http') {
      httpsUri = Uri.https(link);
    } else {
      httpsUri = Uri.parse(link);
    }
  }
  return httpsUri;
}
