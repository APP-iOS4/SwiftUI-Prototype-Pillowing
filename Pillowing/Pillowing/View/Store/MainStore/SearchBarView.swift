//
//  SearchBarView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText : String = ""
    var body: some View {
        HStack{
            TextField("영양제 검색",text : $searchText)
                .padding(.leading)
                .textFieldStyle(CustomTextField())
                .overlay(
                    HStack {
                        Spacer()
                        if searchText != "" {
                            Button(action: {
                                self.searchText = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing , 7)
                                    
                            })
                        }
                            
                    }
                )
                .onAppear{
                    searchText = ""
                }

                
            
            NavigationLink(destination: NutrientsSearchList(searchText: $searchText )) {
                Text("검색")
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.accent)
                    )
                    .padding(.trailing)
                
            }
        }
        
        
        
    }
}

#Preview {
    SearchBarView()
}
