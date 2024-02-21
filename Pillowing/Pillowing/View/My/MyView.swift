//
//  MyView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct MyView: View {
    var nutrientsStore: NutrientsStore = NutrientsStore()
    @State var isTakingList: [Bool] = [true, true, true]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                userProfileView
                
                // 남은 영양제 알림
                ZStack {
                    Rectangle()
                        .fill(Color("AccentColor").opacity(0.3))
                        .frame(width: 350, height: 64)
                        .cornerRadius(10)
                    
                    Text("락토핏 유산균이 10알 남았어요")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                }
                
                myNutrientsView
            }
        }
    }
    
    var userProfileView: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color(red: 244/255, green: 244/255, blue: 244/255))
                    .frame(width: 90, height: 90)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(Color(red: 221/255, green: 221/255, blue: 221/255))
            }
            .padding()
            Spacer()
                .frame(width: 20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("우성종")
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    Image(systemName: "pencil")
                        .foregroundStyle(Color(red: 204/255, green: 204/255, blue: 204/255))
                    
                    Spacer()
                        .frame(width: 95)
                    
                    
                    Image(systemName: "gearshape.fill")
                        .foregroundStyle(Color(red: 204/255, green: 204/255, blue: 204/255))
                }
                
                Spacer()
                    .frame(height: 15)
                
                Text("26세 / 남성")
                    .foregroundStyle(Color(red: 111/255, green: 111/255, blue: 111/255))
            }
            Spacer()
        }
        .padding()
    }
    
    var myNutrientsView: some View {
        VStack {
            HStack {
                Text("내 영양제")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
                
                // TODO: 영양제 검색 페이지로 이동 MyListView()
                NavigationLink(destination: MyListView()) {
                    Text("추가")
                        .foregroundStyle(Color("AccentColor"))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            ForEach(0..<isTakingList.count, id: \.self) { i in
                MyNutrientsComponentView(isTaking: $isTakingList[i])
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        MyView()
    }
}
