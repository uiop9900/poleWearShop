# PoleWear ShoppingMall & Pole Studio / 폴웨어 쇼핑몰 & 스튜디오

**[뱃지나 프로젝트에 관한 이미지들이 이 위치에 들어가면 좋습니다]**  
폴웨어 쇼핑몰에서 폴웨어 구매가 가능하며 안의 스튜디오 메뉴를 통해 폴 스튜디오도 예약이 가능합니다.<br>
관리자 페이지에서는 상품등록, 수정, 삭제가 가능하며 예약받은 내역을 확인하고 예약을 확정 짓습니다.

## Getting Started / 아래의 URL로 들어오세요.
- 쇼핑몰 홈페이지:  http://54.193.165.205:8080/product/main_view <br>
- admin 페이지: http://54.193.165.205:8080/admin/sign_in_view<br>
- test 사용자 계정: jis9510/dldbwls1128!<br>
- admin 계정: admin/dldbwls1128!

## 1. 구매 테스트
비로그인/로그인, 비회원/회원 모두 홈페이지 사용이 가능하게 구현했습니다.

### 비로그인 - 비회원 상품 구매
<img width="70%" src="https://user-images.githubusercontent.com/96981475/163783582-94ec1cd0-4620-4477-914f-330b4165e88d.gif"/>

```
비로그인 상태에서 상품을 둘러보다 상품을 구매하는 유저입니다. 
구매하기 버튼 클릭 후, 로그인화면에서 '비회원 구매하기'를 통해 비회원 주문창에서 구매합니다.
```

### 비로그인 - 회원 상품 구매
<img width="70%" src="https://user-images.githubusercontent.com/96981475/163787210-e4ab7d6c-b8ea-422f-ba85-db492b28a380.gif"/>

```
비로그인으로 상품을 둘러보다 구매시 로그인을 통해 회원으로 상품을 구매하는 유저입니다.
```

### 로그인 - 회원 상품 구매
<img width="70%" src="https://user-images.githubusercontent.com/96981475/163788218-43b22db2-300d-4f31-96c1-139022627f23.gif"/>

```
로그인된 상태로 상품을 둘러보다 회원으로 구매하는 유저입니다. 
로그인이 되어있기때문에 따로 로그인 화면으로 넘어가지 않습니다.
```

## 2. 구매 조회 테스트
비회원/회원 모두 본인이 구매한 상품을 확인할 수 있습니다.

### 회원 주문 조회
<img width="70%" src="https://user-images.githubusercontent.com/96981475/163789345-a736e52c-da5b-4111-9037-0b03af590178.gif"/>

```
유저 페이지에서 본인의 개인정보와 더불어 마일리지, 주문 내역 리스트, 리뷰 리스트를 확인할 수 있다.
```

### 비회원 주문조회
<img width="70%" src="https://user-images.githubusercontent.com/96981475/163781892-59464d3e-e92f-40eb-9174-fba25e3c1e60.gif"/>

```
구매시 넣은 구매자의 이름과 부여받은 주문번호로 비회원의 주문조회가 가능합니다.
```

### 테스트는 이런 식으로 작성하시면 됩니다

```
예시
```

## Deployment / 배포

Add additional notes about how to deploy this on a live system / 라이브 시스템을 배포하는 방법

## Built With / 누구랑 만들었나요?

* [이름](링크) - 무엇 무엇을 했어요
* [Name](Link) - Create README.md

## Contributiong / 기여

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us. / [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) 를 읽고 이에 맞추어 pull request 를 해주세요.

## License / 라이센스

This project is licensed under the MIT License - see the [LICENSE.md](https://gist.github.com/PurpleBooth/LICENSE.md) file for details / 이 프로젝트는 MIT 라이센스로 라이센스가 부여되어 있습니다. 자세한 내용은 LICENSE.md 파일을 참고하세요.

## Acknowledgments / 감사의 말

* Hat tip to anyone whose code was used / 코드를 사용한 모든 사용자들에게 팁
* Inspiration / 영감
* etc / 기타
