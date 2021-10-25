import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Action", "Drama", "Thriller", "Comedy", "Horror"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
