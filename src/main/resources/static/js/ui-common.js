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
	
	// booking_select 달력 동적으로 삽입
	var today = new Date();
	var date = new Date();

	// 이전달 버튼 클릭시
	$("input[name=preMonth]").click(function () {
	    $("#calendar > tbody > td").remove();
	    $("#calendar > tbody > tr").remove();
	    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	    buildCalendar();
	});

	// 다음달 버튼 클릭시
	$("input[name=nextMonth]").click(function () {
	    $("#calendar > tbody > td").remove();
	    $("#calendar > tbody > tr").remove();
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    buildCalendar();
	});

	// 달력 만들기
	function buildCalendar() {
	    let nowYear = today.getFullYear();
	    let nowMonth = today.getMonth();
		// 1일이 무슨 요일인지
	    let firstDay = new Date(nowYear, nowMonth, 1).getDay(); 
		// 그 달의 마지막 날
	    let lastDate = new Date(nowYear, nowMonth + 1, 0).getDate(); 

	    // 년.월 작성
	    $(".year_month").text(nowYear + ". " + (nowMonth + 1));

	    // 날짜 채우기
	    $("#calendar tbody").empty(); // 이전에 있던 내용을 비워줌
	    let row = $("<tr></tr>");

	    // 첫번째 줄 1일 시작 전까지 빈칸으로 채우기
	    for (let i = 0; i < firstDay; i++) {
	        row.append("<td></td>");
	    }
		// 가격과 인원 선택 UI를 기본적으로 숨김
		$(".select_count, .count_wrap, .selected-date-container").hide();

	    // 날짜 채우기
	    for (let i = 1; i <= lastDate; i++) {
	        const dateCell = $("<td class='date'>" + i + "</td>");
	        
			
	        // 날짜 셀 클릭 이벤트 추가
	        dateCell.on("click", function() {
	            // 모든 날짜에서 colToday 클래스 제거하고 selectday 클래스 추가
	            $(".date").removeClass("colToday").removeClass("selectday");
	            $(this).addClass("selectday");
				
				// 선택한 날짜 텍스트 가져오기
				let selectedDate = $(this).text();
				let nowYear = today.getFullYear();
				let nowMonth = today.getMonth() + 1; // 월은 0부터 시작하므로 +1
				            // 선택한 날짜를 readonly input에 표시
				$("#selectedDate").val(`${nowYear}-${nowMonth}-${selectedDate}`);
		
				// 가격 및 인원 선택 UI 표시
				$(".select_count, .count_wrap, .selected-date-container").show();
				// 가격 및 인원 수 업데이트
				updateDisplay();
	        });

	        row.append(dateCell);

	        // 7일째 되면 새로운 줄을 추가
	        if ((i + firstDay) % 7 === 0) {
	            $("#calendar tbody").append(row);
	            row = $("<tr></tr>"); // 새로운 행 시작
	        }
	    }

	    // 남은 날짜 처리
	    if (row.children().length > 0) {
	        $("#calendar tbody").append(row); // 남은 row를 추가
	    }

	    // 오늘 날짜 표시
	    let todayDate = today.getDate();
	    $(".date").each(function (index) {
	        if (nowYear == date.getFullYear() && nowMonth == date.getMonth() 
				&& $(this).text() == todayDate) {
	            $(this).addClass('colToday');
	        }
	    });
	}

	buildCalendar();
	
	// 인원 수 조절 버튼 클릭 이벤트
	$(".plus_btn").click(function() {
		if(headcount<10){	
		    headcount++;
		    updateDisplay();
		}
	});

	$(".min_btn").click(function() {
	    if (headcount > 1) {
	        headcount--;
	        updateDisplay();
	    }
	});
	
	function updateDisplay() {
	    // 가격과 인원 수 업데이트
	    $(".count_window").text(headcount); // 인원 수 표시
	    $(".count_pay").text(headcount * price + "원"); // 가격 표시
	}
	
	// 초기 디스플레이 설정
	updateDisplay();

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
});

