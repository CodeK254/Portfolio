'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"manifest.json": "a67989697c366cf4f821bde4733a6ca8",
"index.html": "0feda76d998a29479493e16f57b7c9c4",
"/": "0feda76d998a29479493e16f57b7c9c4",
"assets/AssetManifest.bin": "d29210debfb106f8c8783f0e23df90db",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/demo/two.png": "850c608f720c2836bc4e0efc89be88ef",
"assets/assets/demo/fb.png": "c04e398327ed5e1482ed439b8c932bd1",
"assets/assets/demo/ruby.jpg": "3fd07ad39cdb928c4187de6417c66469",
"assets/assets/demo/one.png": "f92fb435cee4e07127831c5b27bc1c44",
"assets/assets/demo/github.png": "04c830d5af018d362a14d4c3064078d7",
"assets/assets/demo/four.png": "b2868575c2fa357dab53696242890d55",
"assets/assets/demo/resume.png": "29748880e7727b6b5f44596c313e79b8",
"assets/assets/demo/kasa.jpg": "c486309ed1c36a27f7651de9b26a824c",
"assets/assets/demo/karu.jpg": "50d2343538ac58b7846fe30571abaaf2",
"assets/assets/demo/ig.png": "d1b82d93ce6c998c7f91a7db755e50ce",
"assets/assets/demo/three.png": "2004c9b52a80f95ec9948662b8715a24",
"assets/assets/images/two.png": "3a152c871798fa6d526829b08ae9e525",
"assets/assets/images/forteen.png": "83bab2f1f5664fa2c10ce4bdc8929df4",
"assets/assets/images/one.png": "81075ed2de2fdddd411704bbd4a0bcfb",
"assets/assets/images/six.png": "7c4f3a36c559da6104264c7367237067",
"assets/assets/images/four.png": "cbc797c6f45ca8c60ca5fb58b94d4424",
"assets/assets/images/twelve.png": "b764a0da680c0d229b67cac4abf14998",
"assets/assets/images/ten.png": "5be79641ddbfd9a2e0b9f2be168e8632",
"assets/assets/images/eight.png": "8e8904e9e608774dd1866fa070551f6a",
"assets/assets/images/eleven.png": "f554d5fb697711d522426d3b6c9c4f9f",
"assets/assets/images/five.png": "fe73378ce11de5ff770c2704e458c459",
"assets/assets/images/sixteen.png": "de010e2a76db2fc766061fb9cf8a808f",
"assets/assets/images/seventeen.png": "d8b3c55e37919e123163355450c0fc3f",
"assets/assets/images/seven.png": "a35f269ef21bb1f015a1da11ece30fbe",
"assets/assets/images/fifteen.png": "dfefd5fdf0e1fd28e91d6567fc41739b",
"assets/assets/images/nine.png": "f54c7879152e76cab56a57e403d9f6e9",
"assets/assets/images/three.png": "4ba642bb42fb9b3bf477ac22cc3e38bc",
"assets/assets/images/thirteen.png": "121ffcbc2e071b14579fced01f469c53",
"assets/assets/logo_two.jpg": "0cdd094fe7287af9dba251d774da02e4",
"assets/assets/logo.png": "e2ded41444799e8fd3290855d4a98e2b",
"assets/AssetManifest.bin.json": "2d0e2f4b7fd24386a42aa85c61c81d96",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/NOTICES": "f8b3fb12a0b6954625bbb4144f3ea2db",
"assets/AssetManifest.json": "1071e0fa7d9c5fa01389a12367dc1f90",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0a94bab8e306520dc6ae14c2573972ad",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "9cda082bd7cc5642096b56fa8db15b45",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b00363533ebe0bfdb95f3694d7647f6d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"splash/img/dark-4x.png": "50e292bff3c49a1824b31f04e0353a17",
"splash/img/light-3x.png": "5f08946ddf16e89d7095d957fdf6ee6e",
"splash/img/light-2x.png": "281c3529d5b5b87bce4402cb9f5d5d01",
"splash/img/dark-1x.png": "5f2e4eb7fff4100a1a0d86735dff053c",
"splash/img/dark-2x.png": "281c3529d5b5b87bce4402cb9f5d5d01",
"splash/img/light-1x.png": "5f2e4eb7fff4100a1a0d86735dff053c",
"splash/img/dark-3x.png": "5f08946ddf16e89d7095d957fdf6ee6e",
"splash/img/light-4x.png": "50e292bff3c49a1824b31f04e0353a17",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "c94c38ff00a9d487c353a2d78989ea08",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "52b9dbd39e14088e1330b96c4bc1fba0",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
