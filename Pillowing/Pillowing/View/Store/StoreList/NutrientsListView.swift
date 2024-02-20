//
//  NutrientsListView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct NutrientsListView: View {
    var nutrientsStore = NutrientsStore()
    var body: some View {
        VStack{
            HStack{
                ForEach(sortType.allCases , id:\.self) {
                    sortType in
                    Button(action: {
                        
                    }, label: {
                        SortButtonView(sortName: "\(sortType.rawValue)")
                    })
                }
            }
            .padding()
            Divider()
            HStack{
                Text("총 xx개의 검색결과가 있습니다")
                    .bold()
                    .font(.headline)
                    .padding(.leading)
                Spacer()
            }
            VStack{
                ScrollView{
                    List{
                    }
                }
            }
        }
        .navigationTitle("카테고리")
        
    }
    
}

enum sortType : String , CaseIterable {
    case lowPrice = "낮은 가격순"
    case highPrice = "높은 가격순"
    case mostReviews = "리뷰 많은순"
    case starRating = "별점 순"
}

#Preview {
    NutrientsListView()
}
