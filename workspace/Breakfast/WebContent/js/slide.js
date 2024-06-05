$(document).ready(function () {
  const $cont2 = $('.cont2');
  const $slider = $('.slider');
  const winW = $(window).width();
  const animSpd = 750;
  const distOfLetGo = winW * 0.2;
  let curSlide = 1;
  let animation = false;
  let autoScrollVar = true;
  let autoPlayPaused = false;
  let diff = 0;

  let arrCities = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let numOfCities = arrCities.length;

  function generateSlide(city) {
    let frag2 = $(document.createDocumentFragment());
    const numSlide = arrCities.indexOf(arrCities[city]) + 1;
    const imgName=['火腿吐司','燻雞吐司','照燒豬排吐司','培根吐司','豬排吐司','檸檬雞吐司','煎蛋吐司','豬肉吐司','鮪魚吐司'];
    const enName=['Toast with Ham','Toast with Smoked Chicken','Toast with Teriyaki Pork Chop','Toast with Bacon','Toast with Pork Chop','Toast with Lemon Chicken','Toast with Eggs','Toast with Pork','Toast with Tuna'];

    const $slide = $(`<div data-target="${numSlide}" class="slide slide--${numSlide}">
      <div class="slide__darkbg slide--${numSlide}__darkbg"></div>
      <div class="slide__text1">${imgName[numSlide - 1]}</div>
      <div class="slide__text2">${enName[numSlide - 1]}</div>
    </div>`);

    frag2.append($slide);
    $slider.append(frag2);
  }

  for (let i = 0; i < numOfCities; i++) {
    generateSlide(i);
  }

  function resumeAutoPlay() {
    autoPlayPaused = false;
    autoScroll();
  }

  function pauseAutoPlay() {
    autoPlayPaused = true;
    autoScrollVar = true;
    setTimeout(resumeAutoPlay, 3000);
  }

  function autoScroll() {
    if (autoScrollVar && !autoPlayPaused) {
      if (curSlide === numOfCities) {
        curSlide = 0;
        toDefault();
      }
      navigateDown();
      setTimeout(autoScroll, 3000);
    }
  }

  function resetAutoScroll() {
    autoScrollVar = false;
  }

  function timeout() {
    animation = false;
  }

  function pagination(direction) {
    animation = true;
    diff = 0;
    $slider.addClass('animation');
    $slider.css({
      'transform': 'translate3d(0, -' + (curSlide - direction) * 100 + '%, 0)'
    });
    $slider.find('.slide__darkbg').css({
      'transform': 'translate3d(0, ' + (curSlide - direction) * 0 + '%, 0)'
    });
  }

  function navigateDown() {
    if (!autoScrollVar) return;
    if (curSlide >= numOfCities) return;
    pagination(0);
    setTimeout(timeout, animSpd);
    curSlide++;
  }

  function navigateUp() {
    if (curSlide <= 1) {
      curSlide = numOfCities;
      toDefault();
    } else {
      pagination(2);
      setTimeout(timeout, animSpd);
      curSlide--;
    }
  }

  function toDefault() {
    pagination(1);
    setTimeout(timeout, animSpd);
  }

  autoScroll();
});