//
//  DailyNutrientsView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct DailyNutrientsView: View {
    var date: Int
    var day: Days
    var nutrientsName: [String] = ["락토핏 생유산균 골드 09:00", "안국건강 루테인 지아잔틴 미니 13:30", "얼라이브 원스데일리 포맨 멀티비타민 20:00"]
    @State var isNutrientsTaken: [Bool] = Array(repeating: false, count: 3)
    
    var body: some View {
        VStack(alignment: .leading) {
            // Date
            Text("02.\(date) \(day.rawValue)")
                .foregroundStyle(Color(.gray))
                .font(.system(size: 13))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            
            // Nutrients
            Group {
                ForEach(0..<nutrientsName.count, id: \.self) { idx in
                    HStack {
                        Button(action: {
                            isNutrientsTaken[idx].toggle()
                        }, label: {
                            if isNutrientsTaken[idx] {
                                Image(systemName: "pill.fill")
                                    
                            } else {
                                Image(systemName: "pill.fill")
                                    .foregroundStyle(Color(red: 183/255, green: 183/255, blue: 183/255))
                            }
                        })

                        Text(nutrientsName[idx])
                        
                    }
                }
            }
            .font(.system(size: 18))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        }
    }
}

#Preview {
    DailyNutrientsView(date: 20, day: .Thursday)
}
