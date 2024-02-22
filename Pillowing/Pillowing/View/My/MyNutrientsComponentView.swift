//
//  MyNutrientsComponentView.swift
//  Pillowing
//
//  Created by 최정인 on 2/21/24.
//

import SwiftUI

struct MyNutrientsComponentView: View {
    var nutrient: Nutrients = NutrientsStore().nutrients[0]
    let takeTimes: [String] = ["8:30 AM", "12:30 PM"]
    @Binding var isTaking: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Spacer()
                // 영양제 정보
                HStack(alignment: .top) {
                    nutrient.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                    
                    VStack(alignment: .leading) {
                        Text(nutrient.category.rawValue)
                            .font(.system(size: 13))
                            .foregroundStyle(Color(red: 204/255, green: 204/255, blue: 204/255))
                        
                        Text(nutrient.name)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "trash")
                            .foregroundStyle(Color(red: 204/255, green: 204/255, blue: 204/255))
                    })
                }
                
                Spacer()
                
                if isTaking {
                    Text("매일")
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 5))
                    
                    ForEach(takeTimes, id: \.self) { time in
                        HStack {
                            Text(time)
                            
                            Image(systemName: "alarm")
                                .fontWeight(.bold)
                                .foregroundStyle(Color("AccentColor"))
                            
                            Spacer()
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 204/255, green: 204/255, blue: 204/255))
                                    .frame(width: 65, height: 30)
                                    .cornerRadius(30)
                                
                                Text("1정")
                                    .font(.system(size: 15))
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5))
                    }
                } else {
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 254/255, green: 184/255, blue: 0/255).opacity(0.2))
                            .frame(width: 90, height: 25)
                            .cornerRadius(10)
                        
                        Text("섭취 중단")
                            .foregroundStyle(Color(red: 254/255, green: 184/255, blue: 0/255))
                    }
                }
                
                Divider()
                Spacer()
                
                if isTaking {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            isTaking.toggle()
                        }, label: {
                            Text("루틴 중단")
                        })
                        
                        Spacer()
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 1, height: 30)
                        Spacer()
                        
                        NavigationLink(destination: MyDetailView()) {
                            Text("루틴 수정")
                        }
                        
                        Spacer()
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(Color.gray)
                } else {
                    HStack(alignment: .center) {
                        Spacer()
                        
                        Button(action: {
                            isTaking.toggle()
                        }, label: {
                            Text("다시 시작")
                        })
                        
                        Spacer()
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 1, height: 30)
                        Spacer()
                        
                        // TODO: 루틴 삭제 ??
                        Button(action: {}, label: {
                            Text("루틴 삭제")
                        })
                        
                        Spacer()
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(Color.gray)
                }
                
                Spacer()
            }
        }
        .padding()
        .frame(minWidth: 335, maxWidth: 370, minHeight: 200, maxHeight: 290)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
        )
    }
}

#Preview {
    MyNutrientsComponentView(isTaking: .constant(false))
}
