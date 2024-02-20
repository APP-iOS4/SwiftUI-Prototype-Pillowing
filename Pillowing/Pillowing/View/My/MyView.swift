//
//  MyView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct MyView: View {
    var nutrientsStore: NutrientsStore = NutrientsStore()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.fill")
                    VStack {
                        Text("인자한제네바판토텐산")
                        Text("26세 / 여성")
                    }
                    Spacer()
                }
            }
            Spacer()
            Text("락토핏 유산균이 10알 남았어요")
                .frame(width: 386, height: 68)
                .background(Color.gray)
                .foregroundStyle(.black)
            
            HStack(spacing: 250) {
                
                Text("내 영양제")
                    .font(.headline)
                Button(action: {
                    
                }, label: {
                    Text("추가")
                })
                .foregroundStyle(.black)
            }
            List {
                Section {
                    HStack {
                        Image(systemName: "person.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MyView()
    }
}
