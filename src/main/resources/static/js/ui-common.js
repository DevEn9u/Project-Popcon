$(function () {
  // 서브메뉴 on
  $('.gnb').on('mouseenter', function () {
    $('#header').addClass('on');
  });
  $('#header').on('mouseleave', function () {
    $('#header').removeClass('on');
  });
  
  // header fixed
  const header = $('#header');
  $(window).on('scroll', function () {
    // 세로 스크롤바 위치
    let st = $(window).scrollTop();
    
    if (st > 0) {
      header.addClass('fixed');
    } else {
      header.removeClass('fixed');
    }
  });
  
  // main slider
  let mainPopup = new Swiper('.main_slider .swiper', {
    slidesPerView: 2,
    
    pagination: {
      el: '.swiper-pagination',
    },
    
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    
  });

  // pick slider
  let pickPopup = new Swiper('.pick_slider .swiper', {
    slidesPerView: 4,
  });

  // popular slider
  let popularPopup = new Swiper('.popular_slider .swiper', {
    slidesPerView: 4,
  });

  // season slider
  let seasonPopup = new Swiper('.season_slider .swiper', {
    slidesPerView: 4,
  });

  // product slider
  let productPopup = new Swiper('.product_slider .swiper', {
    slidesPerView: 4,
  });

});