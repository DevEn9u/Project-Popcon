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
});

$(document).ready(function() {
  // 요일 배열 (0 = Sunday, 6 = Saturday)
  var weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  // 오늘 날짜 가져오기
  var today = new Date();
  var todayIndex = today.getDate() - today.getDate(); // 오늘 날짜의 인덱스 초기화

  // 슬라이더에 15일간의 날짜를 추가
  for (var i = 0; i < 15; i++) {
    var futureDate = new Date(today);
    futureDate.setDate(today.getDate() + i);

    // 새로운 div 요소 생성 (요일과 날짜를 담을 컨테이너)
    var $dateContainer = $('<div></div>').addClass('date-container');
    var $weekdayDiv = $('<span></span>').addClass('weekday'); // 요일을 표시할 div
    var $dateDiv = $('<p></p>').addClass('date').text(futureDate.getDate());

    // 클릭 이벤트 추가 (날짜 클릭 시 요일 표시)
    $dateContainer.click(function() {
      $('.date-container').removeClass('active');
      $('.weekday').text(''); // 모든 요일 초기화
      $(this).addClass('active');

      // 클릭한 날짜의 요일 계산
      var clickedIndex = $(this).index(); // 여기서 index()를 사용
      var clickedDate = new Date(today);
      clickedDate.setDate(today.getDate() + clickedIndex);

      // 요일 표시
      var weekday = weekdays[clickedDate.getDay()];
      if (clickedIndex === todayIndex) {
        $(this).find('.weekday').text('TODAY');
      } else {
        $(this).find('.weekday').text(weekday); // 요일 표시
      }
    });

    // 컨테이너에 요일과 날짜 div 추가
    $dateContainer.append($weekdayDiv);
    $dateContainer.append($dateDiv);

    // 슬라이더에 추가
    $('#date-slider').append($dateContainer);

    // 오늘 날짜에 active 클래스 추가
    if (i === todayIndex) {
      $dateContainer.addClass('active'); // 오늘 날짜에 active 클래스 적용
      $weekdayDiv.text('TODAY');
    }
  }
  
  //popup-board-view 페이지 스와이퍼
    const swiper = new Swiper('.swiper', {
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
	  
	  //팝업 글 보기 페이지에서 예약하기 클릭 시 이동
	  $('.pv_booking_btn').on('click', function () {
	    window.location.href = "./booking.do";
	  });
});

