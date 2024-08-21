'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "e991927fdd9b43af24e7c8e63d992a40",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/apps/assistant/maps.png": "c268296c961f81883ea05f445e5d0a45",
"assets/assets/apps/assistant/ask_ai.png": "342fc3a768329c137c80df777b4ad9c5",
"assets/assets/apps/assistant/details.png": "68be62679077973c80b84637e0ad9225",
"assets/assets/apps/assistant/splash.png": "1fb534f4bd29e4aa89e64417f1cf72a9",
"assets/assets/apps/farmers/6.png": "96f853efce0622bc7a3bda7f3618d72e",
"assets/assets/apps/farmers/1.png": "08cf351b6f95d5bbe9598f92e4f084cd",
"assets/assets/apps/farmers/4.png": "11d1b8d8edc74257e7ddd4cc2c4c337c",
"assets/assets/apps/farmers/3.png": "7095fcb6fb95b6ff1e0fe36d96ae5056",
"assets/assets/apps/farmers/8.png": "60317b88d162c06dc90be5b19749a6c6",
"assets/assets/apps/farmers/2.png": "34cbef52f70a2e68d8eebffaf07dfb40",
"assets/assets/apps/farmers/7.png": "ce7a2b5c72c077c9d9acb801cad7bade",
"assets/assets/apps/farmers/5.png": "44a48094ba0e3cbaf8908d96c534025c",
"assets/assets/apps/notepad/add_todo.png": "688a1c5ec082097b32af37b23a21c6f1",
"assets/assets/apps/notepad/dark.png": "142c19a47cb7d4ce3c17594b4fdb8d58",
"assets/assets/apps/notepad/search_in_todo.png": "7f73152391290ef1359c7b229bc40015",
"assets/assets/apps/notepad/search_in_notepad.png": "c7c065f20eae52112fde85d905af1a0c",
"assets/assets/apps/notepad/add_note.png": "f5b02d1bf148cbc0acbf4926617668ac",
"assets/assets/apps/notepad/edit_note.png": "ba60258796b736487614bf90cbb9c3d5",
"assets/assets/apps/notepad/note_list.png": "7f581acbbb060d6ea96f416a448bba00",
"assets/assets/apps/notepad/todolist.png": "e463bb5adfbb6a774b1ee8b6d5235554",
"assets/assets/apps/notepad/preferences.png": "3f0ae6721b2d614abf74f07edba31697",
"assets/assets/apps/notepad/authentication.png": "18d932c1ddc5fd0b3dfe7b6051504acd",
"assets/assets/apps/notepad/search.png": "c073640e0b21c34fd8663fdd57289d81",
"assets/assets/apps/notepad/notepad.png": "1ff508a416754b3ff892cb6f840ccbde",
"assets/assets/apps/notepad/filter_search.png": "758f1bcf098d09b7717090504136e85d",
"assets/assets/apps/pick_and_drop/maps.png": "e47d34bf20cbff5c6374b97b856b5cf8",
"assets/assets/apps/pick_and_drop/language.png": "02fe1eacd92f517c7bb33742261243e2",
"assets/assets/apps/pick_and_drop/dashboard.png": "cbd5b952aefebb13e4d66470f327f09d",
"assets/assets/apps/pick_and_drop/allow_maps.png": "9676ea46778e70926ca8aed9b88d2f43",
"assets/assets/images/image_001.jpg": "a441d4385613d3fd2515d04304063a9d",
"assets/assets/images/image_020.jpg": "5e6e988087bf3f07e0f53ed1e57ab07f",
"assets/assets/images/image_018.jpg": "670d9c5a6617e8eab19e73c0061572e3",
"assets/assets/images/image_011.jpg": "1621c99a731e8ca31f8193ac6f9a490b",
"assets/assets/images/image_009.jpg": "84afe34490d6f851b18bac728ffd34d0",
"assets/assets/images/home_page.png": "0c0439421ada2f16035523b6e2fa3bad",
"assets/assets/images/image_005.jpg": "da176c236c8aac7beae71adafd2474f1",
"assets/assets/images/testimonial_page.png": "7dd200ade1b0e8212602ee80c3eb4f47",
"assets/assets/images/image_010.jpg": "6535c82c4817997817122ffd838aaa5b",
"assets/assets/images/image_014.jpg": "15e8a56d8aee5abb71aecd680ab1fa9d",
"assets/assets/images/image_016.jpg": "03e8a0dd85d2809829e88c074a9ea55a",
"assets/assets/images/image_015.jpg": "08b8af23e267a50affd93a0516d54a70",
"assets/assets/images/image_017.jpg": "f80ff13854bdc50a70ddc018bf6f2908",
"assets/assets/images/image_008.jpg": "13b6f7c3d6b8dfc7e915b77d93d0e27d",
"assets/assets/images/image_013.jpg": "6535c82c4817997817122ffd838aaa5b",
"assets/assets/images/image_003.jpg": "46d614c8359b53ea56953758c681e39a",
"assets/assets/images/image_019.jpg": "4f7fe84a7c547c3fb940f47fc8c63bd5",
"assets/assets/images/services_page.png": "84a774231f88a465aa365d869f2ebfda",
"assets/assets/images/resume_page.png": "a3355613deef3b0c0d373b8e83ffd341",
"assets/assets/images/image_012.jpg": "5d3678658979b0ef24e427fa34ae481a",
"assets/assets/images/image_006.jpg": "45a0ded839f5934409eb352297762bfe",
"assets/assets/images/image_007.jpg": "6881fd86aa0208b8fc0744a30c6dd7e4",
"assets/assets/images/image_004.jpg": "0818058b9fc6b063df348184b44053db",
"assets/assets/images/image_002.jpg": "68e2b4cc8fe4e45427d1eec92e425739",
"assets/assets/images/contacts_page.png": "cbc2d150abb572bfe9b98b6a9e28e04e",
"assets/assets/logo_two.jpg": "0cdd094fe7287af9dba251d774da02e4",
"assets/assets/logo.png": "e2ded41444799e8fd3290855d4a98e2b",
"assets/assets/launcher/file.png": "dd843ecb28d0e1bd83095dbc6b5459d4",
"assets/assets/launcher/portfolio.png": "4258645b4bb33a93cd1970a0bb64492b",
"assets/assets/launcher/portfolio1.png": "b49cf3d0f9b453a0de2db51148d7b883",
"assets/assets/demo/two.png": "850c608f720c2836bc4e0efc89be88ef",
"assets/assets/demo/one.png": "f92fb435cee4e07127831c5b27bc1c44",
"assets/assets/demo/resume.png": "29748880e7727b6b5f44596c313e79b8",
"assets/assets/demo/four.png": "b2868575c2fa357dab53696242890d55",
"assets/assets/demo/ig.png": "d1b82d93ce6c998c7f91a7db755e50ce",
"assets/assets/demo/kasa.jpg": "c486309ed1c36a27f7651de9b26a824c",
"assets/assets/demo/ruby.jpg": "3fd07ad39cdb928c4187de6417c66469",
"assets/assets/demo/three.png": "2004c9b52a80f95ec9948662b8715a24",
"assets/assets/demo/github.png": "04c830d5af018d362a14d4c3064078d7",
"assets/assets/demo/karu.jpg": "50d2343538ac58b7846fe30571abaaf2",
"assets/assets/demo/fb.png": "c04e398327ed5e1482ed439b8c932bd1",
"assets/fonts/MaterialIcons-Regular.otf": "9cc2125840b79b6b3d82d259f3368c1a",
"assets/AssetManifest.bin": "159eac68c72518c7dc92dc210f97226a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "79acf4680d2398899eda514303f5b437",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "75212075a3a07a6fcd406c2a3521ef5a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "8807b9aec711395cf3c6d9d05989139c",
"assets/AssetManifest.json": "bd0096f557ac5fcded5c7634f83e52ca",
"assets/NOTICES": "1edd6ec9aff1091ff1524da388d6b6b1",
"index.html": "23e94defd3428d0b94edb14a79c9d9b3",
"/": "23e94defd3428d0b94edb14a79c9d9b3",
"main.dart.js": "c46e715bb5787dce1f10f9ee01cdf5f9",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "009c9e65172e010890f7f65fde438006",
"flutter_bootstrap.js": "4cbe1b440106e8a15f7ca8ca18963211",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"flutter.js": "f393d3c16b631f36852323de8e583132"};
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
