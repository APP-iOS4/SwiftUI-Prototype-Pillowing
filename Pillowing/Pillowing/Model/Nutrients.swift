//
//  Nutrients.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import Foundation
import SwiftUI

enum NutrientsType: String {
    case eye = "눈"
    case bone = "뼈"
    case skin = "피부"
    case liver = "간"
    case largeIntestine = "대장"
    case vitamin = "종합 비타민"
}

enum Days: String {
    case Monday = "월요일"
    case Tuesday = "화요일"
    case Wednesday = "수요일"
    case Thursday = "목요일"
    case Friday = "금요일"
    case Saturday = "토요일"
    case Sunday = "일요일"
}

struct Nutrients {
    //이미지, 이름, 개수, 가격, (용량), 스토어 URL, 카테고리
    // 리뷰, 평점
    var name: String
    var count: Int
    var price: Int
    var storeURL: String
    var category: NutrientsType
    var reviews: [Review]?
    var rank: Int?
    
    var image: Image {
        Image(name)
    }
}

struct Review {
    var userName: String
    var grade: Int
    var description: String
}

struct MyNutrients {
    // 알람 설정 시간 , 섭취 횟수, 1회 섭취량, 섭취 요일, 푸시 알람 여부, 루틴 중단
    var nutrients: Nutrients
    var intakeDays: [Days]
    var intakeCount: Int
    var routines: [Routine]
    var isPushAlarm: Bool
    var isActive: Bool
}

struct Routine {
    var intakeTime: Date
    var onetakeCount: Int
    var log: [Date]
}
