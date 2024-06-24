'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"flutter_bootstrap.js": "b1421f553d507d3e43e1316a7949132e",
"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "b7af083de608b169247de613fe1ed61b",
"assets/NOTICES": "f084bd8424f799d2ca2c63c2d2c75b78",
"assets/AssetManifest.bin": "7467765f504a63848d9cde12da6a68cd",
"assets/assets/images/image_005.jpg": "da176c236c8aac7beae71adafd2474f1",
"assets/assets/images/testimonial_page.png": "7dd200ade1b0e8212602ee80c3eb4f47",
"assets/assets/images/image_010.jpg": "6535c82c4817997817122ffd838aaa5b",
"assets/assets/images/image_004.jpg": "0818058b9fc6b063df348184b44053db",
"assets/assets/images/image_001.jpg": "a441d4385613d3fd2515d04304063a9d",
"assets/assets/images/image_015.jpg": "08b8af23e267a50affd93a0516d54a70",
"assets/assets/images/image_017.jpg": "f80ff13854bdc50a70ddc018bf6f2908",
"assets/assets/images/image_003.jpg": "46d614c8359b53ea56953758c681e39a",
"assets/assets/images/image_002.jpg": "68e2b4cc8fe4e45427d1eec92e425739",
"assets/assets/images/image_011.jpg": "1621c99a731e8ca31f8193ac6f9a490b",
"assets/assets/images/services_page.png": "84a774231f88a465aa365d869f2ebfda",
"assets/assets/images/image_012.jpg": "5d3678658979b0ef24e427fa34ae481a",
"assets/assets/images/image_020.jpg": "5e6e988087bf3f07e0f53ed1e57ab07f",
"assets/assets/images/home_page.png": "0c0439421ada2f16035523b6e2fa3bad",
"assets/assets/images/resume_page.png": "a3355613deef3b0c0d373b8e83ffd341",
"assets/assets/images/image_016.jpg": "03e8a0dd85d2809829e88c074a9ea55a",
"assets/assets/images/image_019.jpg": "4f7fe84a7c547c3fb940f47fc8c63bd5",
"assets/assets/images/image_014.jpg": "15e8a56d8aee5abb71aecd680ab1fa9d",
"assets/assets/images/contacts_page.png": "cbc2d150abb572bfe9b98b6a9e28e04e",
"assets/assets/images/image_018.jpg": "670d9c5a6617e8eab19e73c0061572e3",
"assets/assets/images/image_009.jpg": "84afe34490d6f851b18bac728ffd34d0",
"assets/assets/images/image_006.jpg": "45a0ded839f5934409eb352297762bfe",
"assets/assets/images/image_008.jpg": "13b6f7c3d6b8dfc7e915b77d93d0e27d",
"assets/assets/images/image_007.jpg": "6881fd86aa0208b8fc0744a30c6dd7e4",
"assets/assets/images/image_013.jpg": "6535c82c4817997817122ffd838aaa5b",
"assets/assets/launcher/file.png": "dd843ecb28d0e1bd83095dbc6b5459d4",
"assets/assets/launcher/portfolio.png": "4258645b4bb33a93cd1970a0bb64492b",
"assets/assets/launcher/portfolio1.png": "b49cf3d0f9b453a0de2db51148d7b883",
"assets/assets/logo.png": "e2ded41444799e8fd3290855d4a98e2b",
"assets/assets/demo/ig.png": "d1b82d93ce6c998c7f91a7db755e50ce",
"assets/assets/demo/github.png": "04c830d5af018d362a14d4c3064078d7",
"assets/assets/demo/ruby.jpg": "3fd07ad39cdb928c4187de6417c66469",
"assets/assets/demo/karu.jpg": "50d2343538ac58b7846fe30571abaaf2",
"assets/assets/demo/four.png": "b2868575c2fa357dab53696242890d55",
"assets/assets/demo/one.png": "f92fb435cee4e07127831c5b27bc1c44",
"assets/assets/demo/kasa.jpg": "c486309ed1c36a27f7651de9b26a824c",
"assets/assets/demo/three.png": "2004c9b52a80f95ec9948662b8715a24",
"assets/assets/demo/two.png": "850c608f720c2836bc4e0efc89be88ef",
"assets/assets/demo/fb.png": "c04e398327ed5e1482ed439b8c932bd1",
"assets/assets/demo/resume.png": "29748880e7727b6b5f44596c313e79b8",
"assets/assets/logo_two.jpg": "0cdd094fe7287af9dba251d774da02e4",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "75212075a3a07a6fcd406c2a3521ef5a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "79acf4680d2398899eda514303f5b437",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "8807b9aec711395cf3c6d9d05989139c",
"assets/AssetManifest.bin.json": "520fd1b8771db178e38eb196dba2c459",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "9e409c2f431ff2a6caa69ad90ae654aa",
"assets/AssetManifest.json": "c25bc0eeb86cfaa0f3265413a779ada5",
"index.html": "19d16704da03f58bbe51664de75ab152",
"/": "19d16704da03f58bbe51664de75ab152",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
