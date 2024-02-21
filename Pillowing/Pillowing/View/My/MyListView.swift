//
//  MyListView.swift
//  Pillowing
//
//  Created by Woo Sung jong on 2/21/24.
//

import SwiftUI

struct MyListView: View {
    var nutrientsStore = NutrientsStore()
    
    @State var searchText : String = ""
    
    @State var filterNutrients : [Nutrients] = NutrientsStore().nutrients
    
    var body: some View {
        NavigationStack {
        VStack{
            HStack {
            TextField("영양제 검색",text : $searchText)
                .padding()
                .textFieldStyle(CustomTextField())
                Button(action: {
                    filterNutrients = nutrientsStore.getNutirentsBySearch(text: searchText)
                }, label: {
                    Text("검색")
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.accent)
                        )
                        .padding(.trailing)
                })
            }
                if !filterNutrients.isEmpty {
                    ScrollView {
                        ForEach(filterNutrients) {nutrient in
                            NavigationLink(destination: MyDetailView()) {
                                NutrientsListLow(nutrients: nutrient)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView {
                        ForEach(nutrientsStore.nutrients) { myNutrient in
                            NavigationLink(destination: MyDetailView()) {
                                NutrientsListLow(nutrients: myNutrient)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                }
            }
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    MyListView()
}
