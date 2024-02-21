//
//  CalendarView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct CalendarView: View {
    let days: [Days] = [.Sunday, .Monday, .Tuesday, .Wednesday, .Thursday, .Friday, .Saturday]
    let dayString: [String] = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    let allTakenDays: [Int] = [1, 3, 8, 13, 22]
    @State var selectedDate: Int = 20
    @State var selectedDay: Days = .Thursday
    @State var isShowingSelection: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // 현재 년·월 표시 및 선택
                HStack {
                    Spacer()
                    Group {
                        Text("2024.02")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            isShowingSelection.toggle()
                        }, label: {
                            Image(systemName: "chevron.down")
                                .foregroundStyle(Color.black)
                        })
                    }
                    Spacer()
                }
                
                // Calendar
                Group {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                        // 요일 View
                        ForEach(dayString, id: \.self) { day in
                            if day == "Su" {
                                Text(day)
                                    .foregroundStyle(Color(red: 255/255, green: 83/255, blue: 83/255))
                            } else if day == "Sa" {
                                Text(day)
                                    .foregroundStyle(Color(red: 62/255, green: 128/255, blue: 255/255))
                            } else {
                                Text(day)
                            }
                        }
                        
                        // 날짜 선택
                        ForEach((-3...29), id:\.self) { idx in
                            if idx > 0 {
                                VStack {
                                    Button(action: {
                                        selectedDate = idx
                                        var tmpDays = (idx % 7) + 3
                                        if tmpDays > 6 {
                                            tmpDays -= 7
                                        }
                                        selectedDay = days[tmpDays]
                                    }, label: {
                                        if selectedDate == idx {
                                            ZStack {
                                                Circle()
                                                    .fill(Color("AccentColor"))
                                                    .frame(width: 40)
                                                
                                                Text("\(idx)")
                                                    .foregroundStyle(Color.white)
                                                
                                            }
                                        } else {
                                            Text("\(idx)")
                                                .foregroundStyle(Color.black)
                                        }
                                    })
                                    
                                    if allTakenDays.contains(idx) {
                                        Circle()
                                            .fill(Color(red: 141/255, green: 207/255, blue: 100/255))
                                            .frame(width: 7)
                                    } else {
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 7)
                                    }
                                }
                                .frame(height: 60)
                            } else {
                                Text("")
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                Divider()
                    .frame(height: 30)
                
                // My Nutrients
                DailyNutrientsView(date: selectedDate, day: selectedDay)
                    .padding()
                
            }
            
            if isShowingSelection {
                CustomCalendarSelectionView(isShowingSelection: $isShowingSelection)
            }
        }
    }
}

#Preview {
    CalendarView()
}
