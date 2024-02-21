//
//  NutrientsStore.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import Foundation

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
    }
}
