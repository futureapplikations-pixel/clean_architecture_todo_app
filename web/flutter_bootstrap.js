(()=>{var C={blink:!0,gecko:!1,webkit:!1,unknown:!1},R=()=>navigator.vendor==="Google Inc."||navigator.userAgent.includes("Edg/")?"blink":navigator.vendor==="Apple Computer, Inc."?"webkit":navigator.vendor===""&&navigator.userAgent.includes("Firefox")?"gecko":"unknown",L=R(),x=()=>typeof ImageDecoder>"u"?!1:L==="blink",K=()=>typeof Intl.v8BreakIterator<"u"&&typeof Intl.Segmenter<"u",B=()=>{let i=[0,97,115,109,1,0,0,0,1,5,1,95,1,120,0];return WebAssembly.validate(new Uint8Array(i))},w={browserEngine:L,hasImageCodecs:x(),hasChromiumBreakIterators:K(),supportsWasmGC:B(),crossOriginIsolated:window.crossOriginIsolated};function c(...i){return new URL(T(...i),document.baseURI).toString()}function T(...i){return i.filter(e=>!!e).map((e,r)=>r===0?I(e):z(I(e))).filter(e=>e.length).join("/")}function z(i){let e=0;for(;e<i.length&&i.charAt(e)==="/";)e++;return i.substring(e)}function I(i){let e=i.length;for(;e>0&&i.charAt(e-1)==="/";)e--;return i.substring(0,e)}function U(i,e){return i.canvasKitBaseUrl?i.canvasKitBaseUrl:e.engineRevision&&!e.useLocalCanvasKit?T("https://www.gstatic.com/flutter-canvaskit",e.engineRevision):"canvaskit"}var v=class{constructor(){this._scriptLoaded=!1}setTrustedTypesPolicy(e){this._ttPolicy=e}async loadEntrypoint(e){let{entrypointUrl:r=c("main.dart.js"),onEntrypointLoaded:t,nonce:n}=e||{};return this._loadJSEntrypoint(r,t,n)}async load(e,r,t,n,s){s??=u=>{u.initializeEngine(t).then(m=>m.runApp())};let{entrypointBaseUrl:a}=t,{entryPointBaseUrl:o}=t;if(!a&&o&&(console.warn("[deprecated] `entryPointBaseUrl` is deprecated and will be removed in a future release. Use `entrypointBaseUrl` instead."),a=o),e.compileTarget==="dart2wasm")return this._loadWasmEntrypoint(e,r,a,s);{let u=e.mainJsPath??"main.dart.js",m=c(a,u);return this._loadJSEntrypoint(m,s,n)}}didCreateEngineInitializer(e){typeof this._didCreateEngineInitializerResolve=="function"&&(this._didCreateEngineInitializerResolve(e),this._didCreateEngineInitializerResolve=null,delete _flutter.loader.d... [truncated]
The current context is NOT secure.`,o+=`
Read more: https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts`),Promise.reject(new Error(o))}let{serviceWorkerVersion:r,serviceWorkerUrl:t=c(`flutter_service_worker.js?v=${r}`),timeoutMillis:n=4e3}=e,s=t;this._ttPolicy!=null&&(s=this._ttPolicy.createScriptURL(s));let a=navigator.serviceWorker.register(s).then(o=>this._getNewServiceWorker(o,r)).then(this._waitForServiceWorkerActivation);return E(a,n,"prepareServiceWorker")}async _getNewServiceWorker(e,r){if(!e.active&&(e.installing||e.waiting))return console.debug("Installing/Activating first service worker."),e.installing||e.waiting;if(e.active.scriptURL.endsWith(r))return console.debug("Loading from existing service worker."),e.active;{let t=await e.update();return console.debug("Updating service worker."),t.installing||t.waiting||t.active}}async _waitForServiceWorkerActivation(e){if(!e||e.state==="activated")if(e){console.debug("Service worker already active.");return}else throw new Error("Cannot activate a null service worker!");return new Promise((r,t)=>{e.addEventListener("statechange",()=>{e.state==="activated"&&(console.debug("Activated new service worker."),r())})})}};var g=class{constructor(e,r="flutter-js"){let t=e||[/\.js$/,/\.mjs$/];window.trustedTypes&&(this.policy=trustedTypes.createPolicy(r,{createScriptURL:function(n){if(n.startsWith("blob:"))return n;let s=new URL(n,window.location),a=s.pathname.split("/").pop();if(t.some(u=>u.test(a)))return s.toString();console.error("URL rejected by TrustedTypes policy",r,":",n,"(download prevented)")}}))}};var k=i=>{let e=WebAssembly.compileStreaming(fetch(i));return(r,t)=>((async()=>{let n=await e,s=await WebAssembly.instantiate(n,r);t(s,n)})(),{})};var W=(i,e,r,t)=>(window.flutterCanvasKitLoaded=(async()=>{if(window.flutterCanvasKit)return window.flutterCanvasKit;let n=r.hasChromiumBreakIterators&&r.hasImageCodecs;if(!n&&e.canvasKitVariant=="chromium")throw"Chromium CanvasKit variant specifically requested, but unsupported in this browser";l... [truncated]
"use strict";

let eventListener;
eventListener = (message) => {
    const pendingMessages = [];
    const data = message.data;
    data["instantiateWasm"] = (info,receiveInstance) => {
        const instance = new WebAssembly.Instance(data["wasm"], info);
        return receiveInstance(instance, data["wasm"])
    };
    import(data.js).then(async (skwasm) => {
        await skwasm.default(data);

        removeEventListener("message", eventListener);
        for (const message of pendingMessages) {
            dispatchEvent(message);
        }
    });
    removeEventListener("message", eventListener);
    eventListener = (message) => {

        pendingMessages.push(message);
    };

    addEventListener("message", eventListener);
};
addEventListener("message", eventListener);
`],{type:"application/javascript"}))}return url},mainScriptUrlOrBlob:a})};var b=class{async loadEntrypoint(e){let{serviceWorker:r,...t}=e||{},n=new g,s=new h;s.setTrustedTypesPolicy(n.policy),await s.loadServiceWorker(r).catch(o=>{console.warn("Exception while loading service worker:",o)});let a=new v;return a.setTrustedTypesPolicy(n.policy),this.didCreateEngineInitializer=a.didCreateEngineInitializer.bind(a),a.loadEntrypoint(t)}async load({serviceWorkerSettings:e,onEntrypointLoaded:r,nonce:t,config:n}={}){n??={};let s=_flutter.buildConfig;if(!s)throw"FlutterLoader.load requires _flutter.buildConfig to be set";let a=n.wasmAllowList?.[w.browserEngine]??C[w.browserEngine],o=d=>{switch(d){case"skwasm":return w.supportsWasmGC&&a;default:return!0}},u=(d,S)=>d.renderer==S,m=d=>d.compileTarget==="dart2wasm"&&!w.supportsWasmGC||n.renderer&&!u(d,n.renderer)?!1:o(d.renderer),p=s.builds.find(m);if(!p)throw"FlutterLoader could not find a build compatible with configuration and environment.";let l={};l.flutterTT=new g,e&&(l.serviceWorkerLoader=new h,l.serviceWorkerLoader.setTrustedTypesPolicy(l.flutterTT.policy),await l.serviceWorkerLoader.loadServiceWorker(e).catch(d=>{console.warn("Exception while loading service worker:",d)}));let y=U(n,s);p.renderer==="canvaskit"?l.canvasKit=W(l,n,w,y):p.renderer==="skwasm"&&(l.skwasm=P(l,n,w,y));let f=new v;return f.setTrustedTypesPolicy(l.flutterTT.policy),this.didCreateEngineInitializer=f.didCreateEngineInitializer.bind(f),f.load(p,l,n,t,r)}};window._flutter||(window._flutter={});window._flutter.loader||(window._flutter.loader=new b);})();
//# sourceMappingURL=flutter.js.map

if (!window._flutter) {
  window._flutter = {};
}
_flutter.buildConfig = {"engineRevision":"d2913632a4578ee4d0b8b1c4a69888c8a0672c4b","builds":[{"compileTarget":"dart2js","renderer":"canvaskit","mainJsPath":"main.dart.js"},{}]};

_flutter.loader.load({
  serviceWorkerSettings: {
    serviceWorkerVersion: "1268511255"
  }
});
