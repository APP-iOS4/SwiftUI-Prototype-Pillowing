//
//  NutrientsDetailView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct NutrientsDetailView: View {
    var nutrient: Nutrients
    var nutrientStar: Double = 4.2
//    let reviews: [Review] = [
//        Review(userName: "최정인", grade: 4, description: "이거 먹고 내 건강시대 시작됐다."),
//        Review(userName: "이시형", grade: 4, description: "장 건강엔 락토핏 생유산균 골드"),
//        Review(userName: "정운관", grade: 5, description: "5박스째 시켜먹고 있어요. 굿 👍🏻"),
//        Review(userName: "우성종", grade: 4, description: "장 튼튼, 건강 튼튼, 락토핏 락토핏"),
//        Review(userName: "유승재", grade: 4, description: "역시 유산균은 락토핏 생유산균 골드!!"),
//    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .center) {
                        productView
                        
                        NavigationLink(destination: WebView(urlString: nutrient.storeURL)) {
                            ZStack {
                                Rectangle()
                                    .fill(Color("AccentColor").opacity(0.3))
                                    .frame(width: 350, height: 50)
                                    .cornerRadius(10)
                                
                                HStack {
                                    Text("이 제품 최저가로 바로가기                          >")
                                        .foregroundStyle(Color.black)
                                }
                            }
                        }
                        
                        Divider()
                        
                        // Review
                        productReviewView
                    }
                }
                
                // Review Write Button
                NavigationLink(destination: ReviewView()) {
                    ZStack {
                        Rectangle()
                            .fill(Color("AccentColor"))
                            .frame(width: 350, height: 50)
                            .cornerRadius(20)
                        
                        Text("리뷰 쓰기")
                            .foregroundStyle(Color.white)
                    }
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
    
    // MARK: - 제품 정보
    var productView: some View {
        VStack(alignment: .leading) {
            // MARK: Product
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    nutrient.image
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Text(nutrient.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Text("\(nutrient.count)캡슐")
                        .foregroundStyle(Color(red: 193/255, green: 193/255, blue: 193/255))
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("가격")
                        .foregroundStyle(Color(red: 193/255, green: 193/255, blue: 193/255))
                    
                    Spacer()
                        .frame(width: 100)
                    Text("\(nutrient.count)캡슐 / \(nutrient.price)원")
                }
                
                Spacer()
                    .frame(height: 15)
                
                HStack {
                    Text("평점")
                        .foregroundStyle(Color(red: 193/255, green: 193/255, blue: 193/255))
                    
                    Spacer()
                        .frame(width: 100)
                    
//                    ForEach(0..<5, id: \.self) { i in
//                        if i < Int(floor(nutrientStar)) {
//                            Image(systemName: "star.fill")
//                                .foregroundStyle(Color(red: 255/255, green: 196/255, blue: 68/255))
//                        } else {
//                            Image(systemName: "star.fill")
//                                .foregroundStyle(Color(red: 221/255, green: 221/255, blue: 221/255))
//                        }
//                    }
//                    
//                    Text("\(nutrientStar, specifier: "%.1f")")
//                    
//                    Text("(\(reviews.count))")
//                        .foregroundStyle(Color(red: 193/255, green: 193/255, blue: 193/255))
                    StarView(starCount: nutrient.gradeAverage , reviewCount: nutrient.reviews?.count ?? 0)
                        
                }
            }
            .padding()
            
            
            // Review
        }
    }
    
    // MARK: - 제품 리뷰
    var productReviewView: some View {
        VStack(alignment: .leading) {
            Text("리뷰")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
    if let reviews = nutrient.reviews {
           ForEach(0..<(reviews.count) , id: \.self) {
                            num in
                            ReviewComponentView(review: reviews[num])
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                        }
                    }                                        
            }
        }
        .padding()
    }
}


#Preview {
    NutrientsDetailView(nutrient: NutrientsStore().nutrients[0])
}
