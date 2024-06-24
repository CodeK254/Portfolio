import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void download(List<int> bytes) {
  try{
    // Encode our file in base64
    final base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor = AnchorElement(href: 'data:application/octet-stream;base64,$base64')..target = 'blank';
    // add the name
    anchor.download = "Titus Kariuki.pdf";
    // trigger download
    document.body!.append(anchor);
    anchor.click();
    anchor.remove();
  } catch(e){
    print("Error!!! $e");
  }
}