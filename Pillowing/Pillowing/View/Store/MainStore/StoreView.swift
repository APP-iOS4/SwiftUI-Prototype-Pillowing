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
    
    var gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                //검색창
                HStack{
                    TextField("영양제 검색",text : $searchText)
                        .padding(.leading)
                        .textFieldStyle(CustomTextField())
                    Button(action: {
                        
                    }, label: {
                        Text("검색")
                            .foregroundColor(.white)
                            .padding()
                            .frame(height:  40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.accent)
                            )
                            .padding(.trailing)
                        
                    })
                }
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
                            RankItemView(nutirent: nutreintsStore.nutrients[0])
                            RankItemView(nutirent: nutreintsStore.nutrients[0])
                            RankItemView(nutirent: nutreintsStore.nutrients[0])
                            RankItemView(nutirent: nutreintsStore.nutrients[0])
                            RankItemView(nutirent: nutreintsStore.nutrients[0])
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
                                Button(action: {

                                }, label: {
                                    NavigationLink {
                                        NutrientsListView()
                                    } label: {
                                        VStack{
                                            CategoryView(categoryName: nutrientType.rawValue, categoryImage: "person.fill")
                                        }
                                    }
                                })
                                
                                
                            }
                        }
                        .padding([.leading,.trailing])
                        .padding(.top,10)
                    }
                    
                }
                .frame(maxHeight: .infinity)
            }
        }
        
        
        
        
    }
}

#Preview {
    StoreView()
}
