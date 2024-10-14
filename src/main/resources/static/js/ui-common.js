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

      // 클릭한 날짜의 인덱스와 날짜 계산
      var clickedIndex = $(this).index(); 
      var clickedDate = new Date(today);
      clickedDate.setDate(today.getDate() + clickedIndex);

      // 요일 표시
      var weekday = weekdays[clickedDate.getDay()];
      if (clickedIndex === todayIndex) {
        $(this).find('.weekday').text('TODAY');
      } else {
        $(this).find('.weekday').text(weekday); // 요일 표시
      } 

      // filterPopups 함수 호출
      console.log('Clicked Date:', clickedDate); // 클릭된 날짜 로그 출력
      filterPopups(clickedDate);
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

  // 오늘 날짜로 자동 필터링 수행
  filterPopups(today);
});

// filterPopups 함수는 이전과 동일
function filterPopups(selectedDate) {
  console.log('Selected Date:', selectedDate); // 선택된 날짜 출력

  // 선택된 날짜의 시간 설정: 00:00:00
  selectedDate.setHours(0, 0, 0, 0); // 시간 초기화

  $('.popup_wrap li').each(function() {
    var popupEndDate = new Date($(this).find('.popup_date').data('end-date')); // 데이터 속성에서 end_date 가져오기

    // popupEndDate의 시간 설정: 00:00:00
    popupEndDate.setHours(0, 0, 0, 0); // 시간 초기화

    console.log('Popup End Date:', popupEndDate); // 각 팝업의 end_date 출력

    // 선택된 날짜와 같거나 이후의 날짜만 표시
    if (popupEndDate >= selectedDate) {
      $(this).show(); // 선택된 날짜 이후 또는 같은 날짜의 팝업 표시
    } else {
      $(this).hide(); // 선택된 날짜 이전의 팝업 숨김
    }
  });
}

function filterPopups(selectedDate) {
  console.log('Selected Date:', selectedDate); // 선택된 날짜 출력

  // 선택된 날짜의 시간 설정: 00:00:00
  selectedDate.setHours(0, 0, 0, 0); // 시간 초기화

  // 조건을 만족하는 팝업을 저장할 배열
  var validPopups = [];

  $('.popup_wrap li').each(function() {
    var popupEndDate = new Date($(this).find('.popup_date').data('end-date')); // 데이터 속성에서 end_date 가져오기

    // popupEndDate의 시간 설정: 00:00:00
    popupEndDate.setHours(0, 0, 0, 0); // 시간 초기화

    console.log('Popup End Date:', popupEndDate); // 각 팝업의 end_date 출력

    // 선택된 날짜와 같거나 이후의 날짜만 배열에 추가
    if (popupEndDate >= selectedDate) {
      validPopups.push($(this)); // 조건을 만족하는 팝업 추가
    }
  });

  // 조건을 만족하는 팝업에서 랜덤으로 8개 선택
  var randomPopups = getRandomItems(validPopups, 8);

  // 모든 팝업 숨기고 랜덤으로 선택한 팝업만 표시
  $('.popup_wrap li').hide(); // 모든 팝업 숨기기
  randomPopups.forEach(function(popup) {
    popup.show(); // 랜덤으로 선택된 팝업 표시
  });
}

// 랜덤 아이템 선택 함수
function getRandomItems(items, count) {
  var shuffled = items.sort(() => 0.5 - Math.random()); // 무작위로 섞기
  return shuffled.slice(0, count); // 앞에서부터 count 개 선택
}





