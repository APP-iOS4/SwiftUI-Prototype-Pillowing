//
//  StoreView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct StoreView: View {
    
    var nutreintsStore = NutrientsStore()
    
    @State private var searchText = ""
    
    //실시간 순위를 위한 영양제 리스트
    var nutreintsByRank : [Nutrients] {
        nutreintsStore.getNutirentsBySortType(sortType: .starRating, category: .vitamin , allType: true)
    }
    
    var gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack(){
            VStack(spacing:20){
                //검색창
                SearchBarView(searchText: $searchText)
                //실시간 제품 순위
                VStack{
                    HStack{
                        Text("실시간 제품 순위")
                            .bold()
                            .font(.title3)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing:-5) {
                            ForEach(0..<5) { rank in
                                NavigationLink {
                                    NutrientsDetailView()
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
                VStack{
                    HStack{
                        Text("영양제 카테고리")
                            .bold()
                            .font(.title3)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridItems){
                            ForEach(NutrientsType.allCases , id: \.self) { nutrientType in
                                NavigationLink {
                                    NutrientsListView( nutrientsType: nutrientType)
                                } label: {
                                    VStack{
                                        CategoryView(categoryName: nutrientType.rawValue, categoryImage: "person.fill")
                                    }
                                }
                                
                                
                                
                            }
                        }
                        .padding([.leading,.trailing])
                        .padding(.top,10)
                    }
                    
                }
                .onAppear{
                    searchText = ""
                }
                .frame(maxHeight: .infinity)
            }
        }
        
        
        
        
    }
}

#Preview {
    StoreView()
}
