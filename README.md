# PoleWear ShoppingMall & Pole Studio / 폴웨어 쇼핑몰 & 스튜디오

폴웨어 쇼핑몰에서 폴웨어 구매가 가능하며 안의 스튜디오 메뉴를 통해 폴 스튜디오도 예약이 가능합니다.<br>
관리자 페이지에서는 상품등록, 수정, 삭제가 가능하며 예약받은 내역을 확인하고 예약을 확정 짓습니다.

## Description
- 프로젝트 기간: 22년 3월20일 ~ 22년 4월12일
- 개발환경
  - 언어: Java, HTML, CSS, JavaScript, SQL
  - 프레임워크: Spring, MyBatis, Bootstrap
  - 서버: AWS

## Project Proposal
- 초기 기획서: https://ovenapp.io/view/UFWGP4aZAQwtrFkHpcGAnGY40sKGDwA6/
- 일정: https://docs.google.com/spreadsheets/d/12Juq29pbosLOh2vHluBqmMXBy7UENlMa30yLTuXPQsc/edit?usp=sharing
- URL 설계(Swagger): http://54.193.165.205:8080/swagger-ui/index.html
- 포트폴리오: [폴웨어 포트폴리오_최종본_이지아.pdf](https://github.com/uiop9900/poleWearShop/files/8510665/_._.pdf)


## Getting Started / 아래의 URL로 들어오세요.
- 쇼핑몰 홈페이지:  http://54.193.165.205:8080/product/main_view <br>
- admin 페이지: http://54.193.165.205:8080/admin/sign_in_view<br>
- test 사용자 계정: ji9510/dldbwls1128!<br>
- admin 계정: admin/dldbwls1128!

## 1. 구매 테스트
비로그인/로그인, 비회원/회원의 다양한  모두 홈페이지 사용이 가능하게 구현했습니다.

### 1-1) 비로그인 - 비회원 상품 구매
```
비로그인 상태에서 상품을 둘러보다 상품을 구매하는 유저입니다. 
구매하기 버튼 클릭 후, 로그인화면에서 '비회원 구매하기'를 통해 비회원 주문창에서 구매합니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163783582-94ec1cd0-4620-4477-914f-330b4165e88d.gif"/>

### 1-2) 비로그인 - 회원 상품 구매

```
비로그인으로 상품을 둘러보다 구매시 로그인을 통해 회원으로 상품을 구매하는 유저입니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163787210-e4ab7d6c-b8ea-422f-ba85-db492b28a380.gif"/>



### 1-3) 로그인 - 회원 상품 구매
```
로그인된 상태로 상품을 둘러보다 회원으로 구매하는 유저입니다. 
로그인이 되어있기때문에 따로 로그인 화면으로 넘어가지 않습니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163788218-43b22db2-300d-4f31-96c1-139022627f23.gif"/>


## 2. 구매 조회 테스트
비회원/회원 모두 본인이 구매한 상품을 확인할 수 있습니다.

### 2-1) 회원 주문 조회

```
유저 페이지에서 본인의 개인정보와 더불어 마일리지, 주문 내역 리스트, 리뷰 리스트를 확인할 수 있다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163789345-a736e52c-da5b-4111-9037-0b03af590178.gif"/>


### 2-2) 비회원 주문조회

```
구매시 넣은 구매자의 이름과 부여받은 주문번호로 비회원의 주문조회가 가능합니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163781892-59464d3e-e92f-40eb-9174-fba25e3c1e60.gif"/>



## 3. 스튜디오 예약하기
스튜디오 홈페이지에 유저가 예약을 남기면 추후 관리자가 확인 후 확정예약으로 변경합니다.

### 3-1) 유저의 스튜디오 예약

```
유저는 스튜디옹 홈페이지에서 본인의 예약내역을 입력하고 제출합니다.<br>
추후 관리자와의 연락이 있을것이라고 유저에게 alert하고 종료된다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163834199-58be8f56-7c4f-41f8-9e2e-9b7dbc3f28ef.gif"/>

### 3-2) 관리자의 스튜디오 예약 확정

```
admin 페이지에서 들어온 예약을 확인하고 가격을 필수적으로 기입하면서 예약을 확정시킵니다.<br>
스튜디오 예약관련 수정, 삭제는 admin 페이지에서만 가능합니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163836880-e8c27146-b1b8-4634-b8b6-a0287784f2c2.gif"/>

### 3-3) 홈페이지에서의 확정예약 확인

```
admin페이지에서 예약을 확정하면 홈페이지에서 확정된 예약이 보여집니다.
```

<img width="60%" src="https://user-images.githubusercontent.com/96981475/163837317-49e01a65-384b-4bde-bd81-337635da7fd6.gif"/>


## Reference
- pixabay
- https://hot-han.com/
- http://lenique.co.kr/index.html
- http://sol-blanc.com/
- https://www.sognareby.com/
- https://m.blog.naver.com/jixiah/222453669566
