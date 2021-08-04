# 음원 스트리밍 사이트 구현(팀 프로젝트)

### 1. 개발목적
> Spring MVC 패턴의 구조와 기능에 대해 학습한다.

### 2. 결과물
+ 배포 링크 : http://goldrocket.cafe24.com/music/index.do
+ 아이디 : user
+ 비밀번호 : user1234@

### 3. 참여 인원
+ 최영서 , 김찬구 (2명)

### 4. 제작기간 <2021.06.25 ~ 2021.08.04>
+ 6.25 프로젝트 주제 설정 
+ 6.26 ~ 6.29 스토리보드 작성
+ 6.30 ~ 7.7 View 페이지 설계
+ 7.8 ~ 7.13 DB 설계 
+ 7.15 ~ 8.4 개발환경 설정 및 MVC 디자인 패턴을 이용한 기능 구현

### 5. 개발환경
#### * Back-end
- JAVA
- Spring
- Mybatis

#### * Build tool
+ Maven

#### * Database
+ Mysql

#### * Front-end
+ Javascript
+ jQuery
+ HTML
+ CSS

---
### 6. DB 구조
+ erd 링크 : https://www.erdcloud.com/d/QajBJKBpJeXQg2a7N
<img width="782" alt="스크린샷 2021-08-05 오전 3 30 28" src="https://user-images.githubusercontent.com/75986296/128235272-fd2ce47d-dca4-4d87-bb71-6517252d2907.png">

--- 
### 7. 주요기능

+ #### 로그인 & 비밀번호 찾기 
   + 쿠키를 통해 아이디 저장이 가능하도록 한다.<img width="1168" alt="스크린샷 2021-08-05 오전 3 32 39" src="https://user-images.githubusercontent.com/75986296/128242232-30da9fff-ebea-451f-b769-fb6c3e406d08.png">
   + 유저가 가입한 이메일로 비밀번호를 새로 만들어 발송한다. (JavaMail 라이브러리 이용) 
      >![화면 기록 2021-08-05 오전 4 18 06](https://user-images.githubusercontent.com/75986296/128241952-d6f35f4c-2fb3-49d1-a176-880a6202c722.gif)<img width="941" alt="스크린샷 2021-08-05 오전 4 18 34" src="https://user-images.githubusercontent.com/75986296/128242006-537d4c1e-f8ba-4c48-95fa-af9989b05458.png">  


+ #### 음원 실시간 차트 
   + 스트리밍 재생 수에 따라 실시간으로 순위가 변동된다. (순위가 올라간 곡은 ↑ 로 표시, 내려간 곡은 ↓ 로 표시, 변동이 없는 곡은 - 로 표시)
      > 스트리밍 로그는 사용자에게 제공되지 않는다.
![차트](https://user-images.githubusercontent.com/75986296/128234046-2690840b-eb2a-4aef-914b-f069159045a0.gif)

+ #### 웹플레이어 재생 
   + '듣기' 버튼을 클릭하면 웹 플레이어 창이 생성된다. 
   + '추가' 버튼을 클릭하면 해당 유저의 플레이리스트에 추가된다.   
      + 음량 조절과 해당 Play 구간을 선택해서 들을 수 있다.
         > 이용권이 없거나 이용권이 만료된 회원은 웹 플레이어 서비스가 제공되지 않는다.
         > <img width="833" alt="스크린샷 2021-08-05 오전 3 16 48" src="https://user-images.githubusercontent.com/75986296/128235903-d0c249eb-273a-433e-a8cc-197158ff342d.png">
         
+ #### 결제 API 
   + '구매' 버튼을 클릭하면 Iamport API가 연동되고 PG사를 통한 결제 승인이 이루어진다.
      + 서버에서 금액 검증하기 
        > 결제한 금액과 검증을 마친 금액을 비교했을때 '일치' 하면 성공
        > ![결제1](https://user-images.githubusercontent.com/75986296/128235681-b5a63d26-da5f-4ebd-b20f-e146d90e2967.gif)

+ #### 마이페이지
   + 해당 회원이 최근 감상한 곡의 목록, 좋아요 누른 곡, 내가 쓴 댓글 목록 조회 가능.
       > 좋아요 옆의 숫자는 해당 곡에 대하여 모든 유저들이 누른 수 
       <img width="789" alt="스크린샷 2021-08-05 오전 2 49 08" src="https://user-images.githubusercontent.com/75986296/128234959-c01e216d-6a59-447b-b77e-28435ced8b20.png"><img width="783" alt="스크린샷 2021-08-05 오전 3 00 02" src="https://user-images.githubusercontent.com/75986296/128235000-c932905f-4fa0-45d1-b20c-3bdeebd2ffd6.png">
--- 

+ #### 관리자 페이지 - 공지사항 게시 
   + 스마트 에디터를 통해 내용을 작성할 수 있다. 
   + 파일 업로드를 할 수 있다.
      ><img width="1039" alt="스크린샷 2021-08-05 오전 3 48 57" src="https://user-images.githubusercontent.com/75986296/128237919-723d6ea9-0096-4429-aab2-985e2d65c3eb.png">

+ #### 관리자 페이지 - 스트리밍 통계 관리 











