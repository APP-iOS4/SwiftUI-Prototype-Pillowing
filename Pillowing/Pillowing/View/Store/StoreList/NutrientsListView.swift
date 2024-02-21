//
//  NutrientsListView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct NutrientsListView: View {
    var nutrientsStore = NutrientsStore()
    var nutrientsType : NutrientsType
    @State private var selectedSortType : SortType?
    
    // 정렬 버튼을 누르면 새롭게 리스트를 그리기 위한 변수
    var filterNutrients : [Nutrients] {
        if let sortType = selectedSortType {
            return nutrientsStore.getNutirentsBySortType(sortType: sortType, category: nutrientsType)
        } else{
            return nutrientsStore.getNutirentsByCategory(category: nutrientsType)
        }
    }
    var body: some View {
        
        VStack{
            HStack{
                ForEach(SortType.allCases , id:\.self) {
                    sortType in
                    Button(action: {
                        // 똑같은 정렬 버튼을 다시 한번 누르면 정렬이 기본 설정 값으로 돌아간다
                        if selectedSortType == sortType {
                            selectedSortType = nil
                        } else {
                            selectedSortType = sortType
                        }
                    }, label: {
                        SortButtonView(sortName: "\(sortType.rawValue)")
                            .foregroundColor(selectedSortType == sortType ? Color.white : Color.gray)
                            
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(selectedSortType == sortType ? Color.accent : Color.white)
                                    
            
                            )
                    })
                }
            }
            .padding()
            
            Divider()
            
            HStack{
                Text("총 \(nutrientsStore.getNutirentsByCategory(category: nutrientsType).count)개의 검색결과가 있습니다")
                    .bold()
                    .font(.headline)
                    .padding(.leading)
                Spacer()
            }
            List{
                ForEach(filterNutrients) { nutrients in
                    NavigationLink {
                        NutrientsDetailView(nutrient: nutrients)
                    } label: {
                        NutrientsListLow(nutrients: nutrients)
                    }

                    
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("\(nutrientsType.rawValue)")
    }
    
}



#Preview {
    NutrientsListView(nutrientsType: .vitamin)
}
