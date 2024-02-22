//
//  StoreView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct StoreView: View {
    
    var nutreintsStore = NutrientsStore()
    
    
    
    //실시간 순위를 위한 영양제 리스트
    var nutreintsByRank : [Nutrients] {
        nutreintsStore.getNutirentsBySortType(sortType: .starRating, category: .vitamin , allType: true)
    }
//case eye = "눈"
//case bone = "뼈"
//case skin = "피부"
//case liver = "간"
//case largeIntestine = "대장"
//case vitamin = "종합 비타민"
    //카테고리 이미지
    var categoriesImage : [String] = [
        "eyeCategory","boneCategory","skinCategory","liverCategory","largeIntestineCategory","vitaminCategory"
    ]
    
    var gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack(){
            VStack(spacing:20){
                //검색창
                SearchBarView()
                //실시간 제품 순위
                VStack(spacing:-5){
                    HStack(alignment : .bottom){
                        Text("실시간 제품 순위")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.leading)
                        Text("(2024.02.22 기준 리뷰 많은 순)")
                            .foregroundStyle(.gray)
                            .bold()
                            .font(.caption2)
                            
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing:-5) {
                            ForEach(0..<5) { rank in
                                NavigationLink {
                                    NutrientsDetailView(nutrient: nutreintsByRank[rank])
                                } label: {
                                    VStack{
                                        RankItemView(nutirent: nutreintsByRank[rank], rank: rank+1)
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
                // 영양제 카테고리
                VStack(spacing:0){
                    HStack{
                        Text("영양제 카테고리")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridItems){
                            ForEach(Array(NutrientsType.allCases.enumerated()) , id: \.1) { index,nutrientType in
                                NavigationLink {
                                    NutrientsListView( nutrientsType: nutrientType)
                                } label: {
                                    VStack{
                                        CategoryView(categoryName: nutrientType.rawValue, categoryImage: categoriesImage[index])
                                    }
                                }
                                
                                
                                
                            }
                        }
                        .padding([.leading,.trailing])
                        .padding(.top,10)
                    }
                    
                }
                
                .frame(maxHeight: .infinity)
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
    //빈화면 터치시 키보드 내려가기 위한 함수
    private func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    StoreView()
}
