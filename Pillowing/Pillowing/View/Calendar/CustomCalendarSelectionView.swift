//
//  CustomCalendarSelectionView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct CustomCalendarSelectionView: View {
    let years: [String] = ["2020", "2021", "2022", "2023", "2024"]
    let months: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State var selectedYear: String = "2024"
    @State var selectedMonth: Int = 2
    @Binding var isShowingSelection: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.black)
                .opacity(0.4)
            
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(height: 400)
                    .cornerRadius(35)
                
                VStack {
                    // 년·월
                    HStack {
                        Spacer()
                        Text("년")
                            .padding()
                        
                        Spacer()
                        
                        Text("월")
                            .padding()
                        Spacer()
                    }
                    .font(.system(size: 18))
                    
                    
                    // Year / Month 선택
                    HStack {
                        Spacer()
                        
                        Picker("year", selection: $selectedYear) {
                            ForEach(years, id:\.self) { year in
                                Text("\(year)")
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        Spacer()
                        
                        Picker("month", selection: $selectedMonth) {
                            ForEach(months, id:\.self) { month in
                                Text("\(month)")
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        Spacer()
                    }
                    .foregroundStyle(Color.black)
                    .font(.system(size: 20))
                    
                    
                    // 취소 · 확인 버튼
                    HStack {
                        Button(action: {
                            isShowingSelection = false
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 228/255, green:  228/255, blue: 228/255))
                                    .frame(width: 176, height: 66)
                                    .cornerRadius(20)
                                
                                Text("취소")
                                    .font(.system(size: 23))
                                    .foregroundStyle(Color.black)
                            }
                        })
                        
                        Button(action: {
                            isShowingSelection = false
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color("AccentColor"))
                                    .frame(width: 176, height: 66)
                                    .cornerRadius(20)
                                
                                Text("확인")
                                    .font(.system(size: 23))
                                    .foregroundStyle(Color.white)
                            }
                        })
                    }
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    CustomCalendarSelectionView(isShowingSelection: .constant(true))
}
