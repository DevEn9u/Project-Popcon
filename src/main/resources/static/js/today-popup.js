$(document).ready(function() {
  // 요일 배열 (0 = Sunday, 6 = Saturday)
  var weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  // 오늘 날짜 가져오기
  var today = new Date();
  var todayIndex = today.getDate() - today.getDate(); // 오늘 날짜의 인덱스 초기화

  // 슬라이더를 생성하는 함수
  function createDateSlider() {
    $('#date-slider').empty(); // 기존 슬라이더 초기화

    // 화면 너비에 따라 추가할 날짜 개수 결정 (max-width: 767px => 10개, 그 외 => 15개)
    var numDates = window.innerWidth <= 767 ? 10 : 15;

    // 슬라이더에 날짜 추가
    for (var i = 0; i < numDates; i++) {
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
  }

  // 화면 크기가 변경될 때 슬라이더를 다시 생성
  $(window).resize(function() {
    createDateSlider();
  });

  // 페이지 로드 시 슬라이더 생성
  createDateSlider();
});

// filterPopups 함수는 이전과 동일
function filterPopups(selectedDate) {
  // 선택된 날짜의 시간 설정: 00:00:00
  selectedDate.setHours(0, 0, 0, 0); // 시간 초기화

  // 조건을 만족하는 팝업을 저장할 배열
  var validPopups = [];

  $('.popup_wrap li').each(function() {
    var popupEndDate = new Date($(this).find('.popup_date').data('end-date')); // 데이터 속성에서 end_date 가져오기

    // popupEndDate의 시간 설정: 00:00:00
    popupEndDate.setHours(0, 0, 0, 0); // 시간 초기화

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
