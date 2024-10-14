let price = 0; // 티켓 가격
let headcount = 1; // 기본 인원 수

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

  $(window)
    // 분기점에 따라 swiper 속성이 변함 
    // (데스크톱에선 4칸, 테블릿에선 5칸, 모바일에선 6칸)
    .on('resize', function () {
      let w = $(this).outerWidth();

      // pick slider
      if(w>=768) {
        let pickPopup = new Swiper('.pick_slider .swiper', {
          slidesPerView: 5,
        });
      } else if(w>=1201) {
        let pickPopup = new Swiper('.pick_slider .swiper', {
          slidesPerView: 4,
        });
      } else {
        let pickPopup = new Swiper('.pick_slider .swiper', {
          slidesPerView: 6,
        });
      }

  // product slider
  let productPopup = new Swiper('.product_slider .swiper', {
    slidesPerView: 4,
  });
      // popular slider
      if(w>=768) {
        let popularPopup = new Swiper('.popular_slider .swiper', {
          slidesPerView: 5,
        });
      } else if(w>=1201) {
        let popularPopup = new Swiper('.popular_slider .swiper', {
          slidesPerView: 4,
        });
      } else {
        let popularPopup = new Swiper('.popular_slider .swiper', {
          slidesPerView: 6,
        });
      }
      // season slider
      if(w>=768) {
        let seasonPopup = new Swiper('.season_slider .swiper', {
          slidesPerView: 5,
        });
      } else if(w>=1201) {
        let seasonPopup = new Swiper('.season_slider .swiper', {
          slidesPerView: 4,
        });
      } else {
        let seasonPopup = new Swiper('.season_slider .swiper', {
          slidesPerView: 6,
        });
      }

      // product slider
      if(w>=768) {
        let productPopup = new Swiper('.product_slider .swiper', {
          slidesPerView: 5,
        });
      } else if(w>=1201) {
        let productPopup = new Swiper('.product_slider .swiper', {
          slidesPerView: 4,
        });
      } else {
        let productPopup = new Swiper('.product_slider .swiper', {
          slidesPerView: 6,
        });
      }
    })
    .trigger('resize');
	
	//popup-board-view 페이지 스와이퍼
	let popupBoard = new Swiper('.popup_view_inner .swiper', {
	  direction: 'horizontal',
	  loop: true,

	  pagination: {
	    el: '.swiper-pagination',
	    clickable: true,
	  },

	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  scrollbar: {
	    el: '.swiper-scrollbar',
	    draggable: true,
	  },
	});
	
	// scroll_btn 클릭 시 이동
	$('#footer .scroll_btn').on('click', function (e) {
	  e.preventDefault();

	  if ($(window).scrollTop() === 0) {
	    let bottom = $(document).outerHeight() - $(window).outerHeight();
	    $('html, body').animate({ scrollTop: bottom }, 1500);
	  } else {
	    $('html, body').animate({ scrollTop: 0 }, 1500);
	  }
	});

	// 맨 위에서 화살표 방향 변경
	$(window).on('scroll', function () {
	  if ($(this).scrollTop() <= 100) {
	    $('#footer .scroll_btn').addClass('down');
	  } else {
	    $('#footer .scroll_btn').removeClass('down');
	  }
	});

});




