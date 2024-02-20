//
//  IntakeDayView.swift
//  Pillowing
//
//  Created by Woo Sung jong on 2/20/24.
//

import SwiftUI

struct IntakeDayView: View {
    
    @State private var isMondayToggled = false
    @State private var isTuesdayToggled = false
    @State private var isWednesdayToggled = false
    @State private var isThursdayToggled = false
    @State private var isFridayToggled = false
    @State private var isSaturdayToggled = false
    @State private var isSundayToggled = false
    
    var body: some View {
        VStack {
            Text("섭취 요일")
                .font(.headline)
            HStack {
                Button(action: {
                    isMondayToggled.toggle()
                }, label: {
                    Text("월")
                })
                .frame(width: 46, height: 56)
                .background(isMondayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isMondayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isTuesdayToggled.toggle()
                }, label: {
                    Text("화")
                })
                .frame(width: 46, height: 56)
                .background(isTuesdayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isTuesdayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isWednesdayToggled.toggle()
                }, label: {
                    Text("수")
                })
                .frame(width: 46, height: 56)
                .background(isWednesdayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isWednesdayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isThursdayToggled.toggle()
                }, label: {
                    Text("목")
                })
                .frame(width: 46, height: 56)
                .background(isThursdayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isThursdayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isFridayToggled.toggle()
                }, label: {
                    Text("금")
                })
                .frame(width: 46, height: 56)
                .background(isFridayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isFridayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isSaturdayToggled.toggle()
                }, label: {
                    Text("토")
                })
                .frame(width: 46, height: 56)
                .background(isSaturdayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isSaturdayToggled ? .white : .black)
                .cornerRadius(10)
                
                Button(action: {
                    isSundayToggled.toggle()
                }, label: {
                    Text("일")
                })
                .frame(width: 46, height: 56)
                .background(isSundayToggled ? Color.accentColor : .gray)
                .foregroundStyle(isSundayToggled ? .white : .black)
                .cornerRadius(10)
                
                
            }
            
            .padding()
            
                Button(action: {
                    
                }, label: {
                    Text("확인")
                })
                .frame(width: 372, height: 56)
                .background(Color.accentColor)
                .foregroundStyle(.white)
                .cornerRadius(20)
                
        }
    }
}

#Preview {
        IntakeDayView()
}
