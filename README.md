# 🍿 팝업스토어의 모든 것 POPCON

<img width="1920" height="1080" alt="메인" src="https://github.com/user-attachments/assets/d31c2221-1116-4b8e-8a18-5efafc4956de" />


## 배포 URL 및 테스트 계정

[🔗 배포 URL](http://www.popcon.p-e.kr/)

- ID : admin
- PW : qwer1234
<br/>

## 🍿 프로젝트 소개

<img width="1920" height="1080" alt="다이어그램" src="https://github.com/user-attachments/assets/03947364-98bd-4388-8e63-ee9066e45382" />

- 최근 팝업스토어 시장은 빠르게 성장하고 있는 반면,
후기 확인 및 예약을 한 번에 할 수 있는 통합 플랫폼은 부족하다고 느꼈습니다.
- 이에 팝업스토어 정보 제공부터 예약, 후기, 포인트 시스템까지
통합적으로 제공하는 서비스를 기획하게 되었습니다.

- 소비자 (일반 이용자)는 팝업 스토어 예약 및 후기 작성 서비스를 이용할 수 있습니다.
- 판매자 (기업 이용자)는 팝업 스토어의 개최 기능을 이용할 수 있습니다.
- 후기를 작성하면 포인트가 지급되고, 포인트를 모아서 쿠폰 등의 상품으로 교환이 가능합니다.
- 자유게시판 이용이 가능합니다.

<br/>

## ⚙ 개발 환경

<img width="1920" height="1000" alt="사용기술" src="https://github.com/user-attachments/assets/4e2af466-2a47-41c2-abcf-4dcd3c5a18d6" />

### Frontend
- HTML5, CSS3, JavaScript(ES6+), jQuery, AJAX, React

### Backend
- Java, Spring Boot, Spring Security, Servlet & JSP, MyBatis

### Database
- Oracle Database, Firebase Realtime Database

### Deployment
- AWS EC2, Apache Tomcat

<br/>

## 🤝 팀원 구성 및 역할 분담

### 🛠 멤버 전원 공통 작업
- 웹 Front-End

### 🙋‍♂️ 강인구 (팀장)
- 회원 가입 및 로그인 페이지
- Q&A 채팅
- 포인트 및 쿠폰

### 👨‍🔧 민경준
- 팝업 게시판 
- 관리자 페이지, 마이 페이지
- 프로젝트 배포

### 👨‍🔧 박여은
- DB 설계 및 구현 총괄
- 자유 게시판, 공지 게시판
- 마이 페이지

### 👩‍🔧 육현희
- 예약 및 결제 기능
- 날짜에 따른 팝업 리스트
- 디자인 및 자료 준비

<br/>

## 📅 개발 기간 및 작업 관리

### 📆 개발 기간
- 전체 개발 기간: 2024/09/16 - 2024/10/20
<img width="2585" height="990" alt="그림2" src="https://github.com/user-attachments/assets/2884ef60-57d0-480a-9f4d-1aa546c4df49" />

<br/>

### 📗 작업 관리

- 구글 시트를 이용해 요구사항 정의서, 웹/앱 기능 정의서, DB 정의서, 프로그램 Naming Rule을 작성하였고, 작업 일정을 관리했습니다.
  
  | 요구사항 정의서 | 웹 기능 정의서 |
  | ---------- | ---------- |
  | ![요구사항_정의서](https://github.com/user-attachments/assets/276a27ab-2a08-44fc-97ec-80e657d12538) | ![WEB기능_정의서](https://github.com/user-attachments/assets/ffdd5c2f-e397-427a-b305-ed9dcc864528) |

  | 앱 기능 정의서 | DB 정의서 |
  | ---------- | ---------- |
  | ![APP기능_정의서](https://github.com/user-attachments/assets/4e057240-938d-4e4d-a5d7-1055ed997b5d) | ![DB정의서](https://github.com/user-attachments/assets/3a4f2fbd-a0d1-4370-8424-6148435be9c5) |

</br>

- 팀원 간 작업 진행 상황 및 개선 사항을 수시로 공유하였고, 매주 주간 회의를 통해 일정을 조율했습니다.
<p align="center">
  <img width="300" height="389" alt="캡쳐1" src="https://github.com/user-attachments/assets/3f86c046-c487-4ba2-ab96-102568148f08" />
  <img width="300" height="389" alt="캡쳐2" src="https://github.com/user-attachments/assets/b8efd6f4-6720-4048-8e47-28a258ede9a4" />
</p>

<br/>

## 💻 UI 및 페이지 기능

### UI
[🔗 Figma 디자인 보기](https://www.figma.com/design/GcLBrU6QTR0y4hByP2iWEK/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-PopCon-%EB%8D%94%EC%A1%B0%EC%9D%804%EA%B8%B0-?node-id=0-1&m=dev&t=fejhtNhVAdoLlIPw-1)

---

<br/>

### 초기 화면
![메인화면](https://github.com/user-attachments/assets/85d85710-5b36-46c7-b55d-f5718090f60c)

- 우측 하단의 버튼으로 관리자와 문의 채팅을 할 수 있습니다.
- 관리자 계정의 경우, 우측 하단에 관리자 페이지 버튼이 추가됩니다.

---

<br/>

### 회원 가입

| 회원 가입 | 아이디 찾기 |
| ---------- | ---------- |
| <img width="450" height="600" alt="회원가입" src="https://github.com/user-attachments/assets/bc5820ff-178a-40e7-a4db-aa0c7ff15086" /> | <img width="450" height="600" alt="아이디찾기" src="https://github.com/user-attachments/assets/eb43164d-9000-4006-ba1f-795cb1974734" /> |

- 초기 화면에서 우측 상단의 로그인 버튼을 누르면 회원 가입 및 아이디 찾기가 가능합니다.
- 아이디 찾기 시, 가입한 이메일로 인증번호가 발송됩니다.
- 회원가입 시 유형에 따라 다른 권한을 부여합니다.
- 개인 회원은 팝업스토어 예약만 가능하며, 기업 회원은 팝업 글쓰기가 가능합니다.

---

<br/>

### 팝업 컨테이너

| 글 작성하기 | 글 조회하기 |
| ---------- | ---------- |
| <img src="https://github.com/user-attachments/assets/7c5230b3-01e3-4ec0-a798-186b99976030" width="450"/>| <img src="https://github.com/user-attachments/assets/dbdfb02f-02fa-4833-9a7f-2f59c141a0d7" width="450" /> |

<br/>

| 예약하기 | 리뷰 남기기 |
| ---------- | ---------- |
| <img src="https://github.com/user-attachments/assets/1c6f5d3e-7e4e-475f-b77d-8038009d8c6d" width="450" /> | <img width="450" height="800" alt="리뷰작성" src="https://github.com/user-attachments/assets/6e0b4766-08e5-4bbb-b25b-3499c209a6af" />|

<br/>

| 좋아요 남기기 | 포인트 |
| ---------- | ---------- |
| <img src="https://github.com/user-attachments/assets/7692adab-f9d0-4d57-97c8-e8d6e21ef475" width="450"/> | <img width="450" height="800" alt="쿠폰" src="https://github.com/user-attachments/assets/66a7268e-b652-4e58-b6c2-34cd4640c1b2" /> |


- 팝업스토어 개최 글 작성 및 예약이 가능한 게시판입니다.
- 기업 회원은 글쓰기, 수정하기, 삭제하기 기능을 이용 가능합니다.
- 개인 회원은 좋아요 남기기, 예약하기, 후기 작성 기능을 이용 가능합니다.
- 좋아요를 남긴 게시물은 마이페이지에서 확인이 가능합니다.
- 키워드 버튼을 누르면 특정 키워드를 가진 팝업 게시물만 모아서 볼 수 있습니다.
- 후기를 남기면 포인트가 지급되고, 포인트로 쿠폰을 교환 가능합니다.

---

<br/>

### 마이페이지, 관리자 페이지

| 마이페이지 | 관리자 페이지 |
| ---------- | ---------- |
| <img src="https://github.com/user-attachments/assets/b72d2937-888b-4a9d-bd27-67ad81d9be1c" width="450"/> | <img width="450" src="https://github.com/user-attachments/assets/6aa00c78-a82f-4f08-9cf0-daf21d28c92a" /> |

- 마이페이지에서는 내가 작성한 글, 예약한 팝업, 좋아요한 팝업 등을 볼 수 있습니다.
- 비밀번호 등 가입 시 입력한 정보들을 수정할 수 있습니다.
- 관리자 페이지는 관리자 계정만 진입 가능합니다.
- 게시물 삭제 및 유저 강제 탈퇴, 아이디 복구, 이름 수정이 가능합니다.
- 유저들과의 문의 채팅이 가능합니다.

---

<br/>

## 🔧 주요 이슈 및 개선 사항
- Spring Security를 활용하여 비밀번호 암호화 구현
- React를 활용해 채팅 UI를 구현하고, Firebase Realtime Database를 연동하여 관리자 문의 메시지 송수신 기능 구현
- 후기 작성 및 좋아요 등록/취소 기능을 AJAX 기반 비동기 처리하여 새로고침 없이 동작하도록 개선
- PortOne API를 이용하여 실제 결제 기능 구현 (자정에 자동으로 결제 취소)


<br/>

## 📕 기타 자료

- [배포 링크](http://www.popcon.p-e.kr/)
- [Figma 디자인](https://www.figma.com/design/GcLBrU6QTR0y4hByP2iWEK/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-PopCon-%EB%8D%94%EC%A1%B0%EC%9D%804%EA%B8%B0-?node-id=0-1&m=dev&t=fejhtNhVAdoLlIPw-1)
- [발표 자료 PPT](https://docs.google.com/presentation/d/1cEKNtgqJB1aQIV8eIvsnY1yAZbONHdHI/edit?usp=sharing&ouid=105467538269372883911&rtpof=true&sd=true)
