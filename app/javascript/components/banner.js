// app/javascript/components/banner.js
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["On assure le décollage, pas l'atterrissage!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
