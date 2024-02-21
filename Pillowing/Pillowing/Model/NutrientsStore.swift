//
//  NutrientsStore.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import Foundation
import SwiftUI

class NutrientsStore {
    var nutrients: [Nutrients] = []
    
    init() {
        nutrients = [
            // 대장
            Nutrients(name: "락토핏 생유산균 골드", count: 80, price: 18500, storeURL: "https://link.coupang.com/a/bq9bXH", category: .largeIntestine),
            Nutrients(name: "덴프스 덴마크 유산균이야기", count: 60, price: 28700, storeURL: "https://link.coupang.com/a/bq9c28", category: .largeIntestine),
            Nutrients(name: "비포락토 프로바이오틱스", count: 30, price: 7980, storeURL: "https://link.coupang.com/a/bq9dUJ", category: .largeIntestine),
            
            // 눈
            Nutrients(name: "안국건강 루테인 지아잔틴 미니", count: 180, price: 33430, storeURL: "https://www.coupang.com/vp/products/7568064592?itemId=19952555841&vendorItemId=71619989627&q=%EB%88%88+%EC%98%81%EC%96%91%EC%A0%9C&itemsCount=36&searchId=fabd503410564affba27198114d21cdb&rank=2&isAddedCart=", category: .eye),
            Nutrients(name: "고려은단 루테인 지아잔틴 아스타잔틴", count: 60, price: 26400, storeURL: "https://www.coupang.com/vp/products/7660979010?itemId=20853545536&vendorItemId=87492245488&sourceType=srp_product_ads&clickEventId=13d95ff0-cf8f-11ee-badd-2f932383a0ac&korePlacement=15&koreSubPlacement=5&q=%EB%88%88+%EC%98%81%EC%96%91%EC%A0%9C&itemsCount=36&searchId=fabd503410564affba27198114d21cdb&rank=4&isAddedCart=", category: .eye),
            Nutrients(name: "종근당 20100 파워루테인 플러스", count: 60, price: 11250, storeURL: "https://www.coupang.com/vp/products/7764504001?itemId=20946061576&vendorItemId=70296556710&q=%EB%88%88+%EC%98%81%EC%96%91%EC%A0%9C&itemsCount=36&searchId=fabd503410564affba27198114d21cdb&rank=27&isAddedCart=", category: .eye),
            
            // 종합비타민
            Nutrients(name: "Life Extension 라이프익스텐션 투퍼데이 Two-Per-Day Tablets", count: 120, price: 25620, storeURL: "https://www.coupang.com/vp/products/7692145851?itemId=20694472452&vendorItemId=88673455491&q=%EB%9D%BC%EC%9D%B4%ED%94%84%EC%9D%B5%EC%8A%A4%ED%85%90%EC%85%98+%ED%88%AC%ED%8D%BC%EB%8D%B0%EC%9D%B4+%EC%A2%85%ED%95%A9%EB%B9%84%ED%83%80%EB%AF%BC&itemsCount=36&searchId=7b5df67d780c4cb5bd172b46adee62d4&rank=0&isAddedCart=", category: .vitamin)
            ,
            Nutrients(name: "얼라이브 원스데일리 포맨 멀티비타민", count: 80, price: 26490, storeURL: "https://www.coupang.com/vp/products/7460287402?itemId=20000650509&vendorItemId=81352051865&pickType=COU_PICK&q=%EC%A2%85%ED%95%A9+%EB%B9%84%ED%83%80%EB%AF%BC&itemsCount=36&searchId=5bbea606ab10468b99ba83892d509a4c&rank=1&isAddedCart=", category: .vitamin)
            ,
            Nutrients(name: "뉴트리디데이 프리미엄 멀티비타민 골드", count: 90, price: 9900, storeURL: "https://www.coupang.com/vp/products/7311465993?itemId=18657860312&vendorItemId=4529156516&q=%EC%A2%85%ED%95%A9+%EB%B9%84%ED%83%80%EB%AF%BC&itemsCount=36&searchId=5bbea606ab10468b99ba83892d509a4c&rank=7&isAddedCart=", category: .vitamin)
        ]
        generateExampleReviews()
    }
    
    //카테고리 별 리스트를 얻어오는 작업
    func getNutirentsByCategory(category: NutrientsType) -> [Nutrients] {
        return nutrients.filter{ $0.category == category }
    }
    
    //스토어 리스트에서 정렬 타입별로 다시 리스트를 반환
    func getNutirentsBySortType(sortType: SortType , category : NutrientsType , allType : Bool = false) -> [Nutrients] {
        // 실시간 순위를 보여주기 위한 임시적으로 리뷰갯수로 실시간 순위를 반영
        if allType {
            return nutrients.sorted(by: {$0.reviews?.count ?? 0 < $1.reviews?.count ?? 0} )
        }
        let nutrientsBySort = getNutirentsByCategory(category: category)
        switch sortType {
        case .lowPrice:
            return nutrientsBySort.sorted(by: {$0.price < $1.price} )
        case .highPrice:
            return nutrientsBySort.sorted(by: {$0.price > $1.price} )
        case .mostReviews:
            return nutrientsBySort.sorted(by: {$0.reviews?.count ?? 0 < $1.reviews?.count ?? 0} )
        case .starRating:
            return nutrientsBySort.sorted(by: {$0.gradeAverage > $1.gradeAverage} )
        }
    }
    
    //검색 키워드를 기반으로 알맞는 영양제 리스트를 반환(임시용)
    func getNutirentsBySearch(text : String) -> [Nutrients] {
        var nutirentsBySearch : [Nutrients] = []
        for nutrient in nutrients {
            if nutrient.category.rawValue.contains(text) {
                nutirentsBySearch.append(nutrient)
            }
        }
        return nutirentsBySearch
    }
    
    
    //임시적으로 리뷰를 만들어주는 함수
    
    func generateExampleReviews() {
        let testUser = ["최정인","정운관","유승재","이시형","우성종","짱구","훈이","철수","도라에몽","코난","루피","익명1","남도일","뽀로로","텔레토피"]
        let testDescription = [
            "정말 좋은 거 같아요! 효과가 느껴져서 매우 만족합니다.",
            "효과는 있지만 가격이 조금 비싸요. 그래도 효과를 생각하면 괜찮은 것 같아요.",
            "향이 강해서 복용이 좀 힘들었어요. 그래도 효과는 좋네요.",
            "제대로 먹으면 정말 좋은 제품인 것 같아요.",
            "가성비 좋은 제품! 효과도 좋고 가격도 착해요.",
            "별로 효과를 못 느끼겠어요. 다른 제품을 찾아봐야 할 것 같아요.",
            "효과가 좋아서 계속 재구매 중이에요.",
            "매일 꾸준히 복용 중이라 효과가 꾸준히 나타나고 있어요.",
            "포장이 꼼꼼해서 좋아요. 제품도 효과가 좋아서 만족합니다.",
            "비슷한 제품을 여러 개 시도해봤는데, 이게 제일 좋아요!"
        ]
        let testBadDescription = [
            "효과가 하나도 없어요. 돈 낭비인 것 같아요.",
            "별로에요. 다른 제품으로 바꾸려고 생각 중이에요.",
            "향이 정말 못 참겠어요. 복용하기가 어렵습니다.",
            "가격 대비 효과가 너무 아쉬워요. 실망입니다.",
            "부작용이 생겼어요. 이걸로 인해 건강이 더 나빠졌어요.",
            "효과를 기대하고 있었는데 아무런 변화가 없어요.",
            "피부에 발진이 생겼어요. 안 좋은 부작용이 나타납니다.",
            "복용 후에 이상한 증상이 나타나서 중단했어요.",
            "효과가 너무 미미해서 기대 이하에요.",
            "다른 사람들이 좋다고 해서 샀는데, 제게는 맞지 않는 것 같아요."
        ]
        for index in 0..<nutrients.count {
            if nutrients[index].reviews == nil {
                nutrients[index].reviews = []
            }
            var grade = (1...5).randomElement()!
            var desrcription = grade > 3 ? testDescription.randomElement()! : testBadDescription.randomElement()!
            let exampleReview1 = Review(userName: testUser.randomElement()!, grade: grade, description: desrcription)
            grade = (1...5).randomElement()!
            desrcription = grade > 3 ? testDescription.randomElement()! : testBadDescription.randomElement()!
            let exampleReview2 = Review(userName: testUser.randomElement()!, grade: grade, description: desrcription)
            grade = (1...5).randomElement()!
            desrcription = grade > 3 ? testDescription.randomElement()! : testBadDescription.randomElement()!
            let exampleReview3 = Review(userName: testUser.randomElement()!, grade: grade, description: desrcription)
            
            nutrients[index].reviews?.append(contentsOf: [exampleReview1, exampleReview2, exampleReview3])
        }
    }
}


enum SortType : String , CaseIterable {
    case lowPrice = "낮은 가격순"
    case highPrice = "높은 가격순"
    case mostReviews = "리뷰 많은순"
    case starRating = "별점 순"
}
