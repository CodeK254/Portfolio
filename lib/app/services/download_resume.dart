// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void download() {
  try{
    // Create the link with the file
    final anchor = AnchorElement(href: "https://drive.usercontent.google.com/uc?id=1dF49xrn0UYmUsUFp8RWR38ffiGJe_Kid&authuser=0&export=download")..target = 'blank';
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