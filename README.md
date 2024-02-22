# Pillowing
## 프로젝트 소개
   LAB5 **Pillowing** 프로토타입 개발    
   멋쟁이 사자처럼 앱스쿨: iOS 4기   

## 개발기간
   2024.02.19(월) ~ 2024.02.22(목) / 4일

## 팀원 소개
|          | 이름   | GitHub      | 프로젝트 소감 |
| -------- | ----- | ----------- | ---------- |
| <img src="https://avatars.githubusercontent.com/u/147501980?v=4" alt="drawing" width="100"/> | 우성종 | [@sungjongwoo](https://github.com/sungjongwoo)   | 첫 SwiftUI 프로토타입✌️ 협업을 통해 너무 즐거웠습니다. |
| <img src="https://avatars.githubusercontent.com/u/152110747?v=4" alt="drawing" width="100"/> | 유승재 | [@seungjaeyuu](https://github.com/seungjaeyuu) | 배추(배열 추가)가 정말 힘들었어요! 그래도 성공해서 다행! |
| <img src="https://avatars.githubusercontent.com/u/94823065?v=4" alt="drawing" width="100"/> | 이시형 | [@poetic-form](https://github.com/poetic-form) | 시형님의 앱스쿨에서의 마지막 프로젝트! 의미있으셨길 바랍니다.. |
| <img src="https://avatars.githubusercontent.com/u/90377826?v=4" alt="drawing" width="100"/> | 정운관 | [@UnGwan](https://github.com/UnGwan)  | |
| <img src="https://avatars.githubusercontent.com/u/37467592?v=4" alt="drawing" width="100"/> | 최정인 | [@choijungp](https://github.com/choijungp) | 평소 Custom Calendar 구현에 관심있었는데 이번 기회를 통해 구현해볼 수 있어서 궁금증 해결! 굿! |

## ADS
   영양제를 까먹거나 잊어버리는 모든 사람들을 위한 서비스로, 바쁜 일상 속에서 건강을 유지하고자 하는 분들에게 특히 유용합니다.

## 페르소나
   - 이름 : **영양제**        
   - 나이 : 32        
   - 직업 : 마케팅 관리자        
   - 배경 :    
   그녀는 빠르게 변화하는 삶을 살아가는 바쁜 마케팅 전문가이다.         
   건강에 관심이 많으며 균형 잡힌 식단의 중요성을 알지만 바쁜 일정으로 인해 자주 영양제를 재구입하는 것을 어려워한다.         
   또한 종종 정해진 시간에 영양제 섭취를 하는 것을 잊는다.   
   - 요구사항:    
   그녀는 재주문이나 재고 부족에 대한 걱정 없이 정기적으로 영양 보충제를 받을 수 있는 번거로움 없는 방법을 원한다.     
   바쁜 생활 방식으로 인해 보충제를 제때에 복용하는 것을 종종 잊어버려 예정된 섭취 시간을 놓치면 푸시 알람을 보내는 안정적인 알림 시스템이 필요하다.

## 앱 개발 및 배포 환경
   - Xcode version: 15.2      
   - Swift 5.9.2       
   - iOS Version: 17.2       
   - 실행 환경: iPhone 15 Pro       

## 앱 실행 환경
   1. Git 프로젝트 Clone.
   2. 프로젝트 폴더의 Pillowing.xcodeproj 실행
   3. 실행 기기를 iPhone 15 Pro(17.2)로 실행

## 단계별 사용자 시나리오 
   1. 캘린더탭
   - 캘린더탭을 클릭합니다.
   - 복용 관리를 위하여 해당 날짜에 섭취한 영양제를 클릭합니다.
   - 모든 영양제를 복용했다면 해당 날짜에 초록색 동그라미가 표시됩니다.
   - 원하는 날짜로 변경을 위해 상단을 날짜를 클릭하여 날짜를 변경합니다. 
    
   2. 스토어탭
   - 스토어탭을 클릭합니다.
   - 실시간 제품 순위를 누르면 제품 구매 및 리뷰를 작성할 수 있는 화면으로 넘어갑니다.
   - 영양제 카테고리를 누르면 특징에 맞는 영양제 화면으로 넘어갑니다.
   - 해당 화면에서 가격,별점,리뷰 순으로 정렬하며 볼 수 있습니다.
   - 검색을 통하여 원하는 영양제를 검색 가능합니다.
   
   3. 마이탭
   - 사용자가 현재 복용 중인 영양제를 확인할 수 있습니다.
   - 현재 복용 중인 영양제 중에서도 캘린더의 체킹 현황을 파악 후 부족한 영양제에 대한 알림을 확인할 수 있습니다.
   - 영양제 복용 중단 및 루틴 수정을 할 수 있습니다.
   - 영양제 루틴 수정 시, 섭취 요일, 시간을 설정할 수 있고 해당 요일과 시간에 맞춰 캘린더에 반영되고 푸시 알람 설정여부도 확인 가능합니다.

## 구현목표
   - 영양제 복용관리 및 구매에 유용한 앱 구현
   - Xcode를 사용하여 SwiftUI로 앱 구현
   - 여태 배운 내용들을 적극 활용해보기

## 아직 더 해봐야할 것들 (미구현된 목표)
   - MyDetailView에서 확인버튼을 누를 때 MyView로 넘어가지 않는것
   - View들 간의 데이터 연결이 아직 되지 않은 것

## 실행화면
| Calendar |  Store |   My   | 
| -------- | ----- | ------ |
|![calendar](https://github.com/APP-iOS4/SwiftUI-Prototype-Pillowing/assets/37467592/9b1449ea-965f-4825-a227-971ec5f10b3b)|![Store](https://github.com/APP-iOS4/SwiftUI-Prototype-Pillowing/assets/37467592/a6857192-a0af-42f3-af02-4919c2e3db3f)|![My](https://github.com/APP-iOS4/SwiftUI-Prototype-Pillowing/assets/37467592/ccbbab18-8dc5-4f64-9609-3bd3d6cc0d2f)|



     
## Notice
   이미지 출처는 구글링 및 필라멘토 홈페이지에서 발췌했습니다.      
   문제시, 요청을 주시면 바로 수정하겠습니다.    

## License
   Copyright 실습조 LAB5. All rights reserved.      
   License under the MIT license.
