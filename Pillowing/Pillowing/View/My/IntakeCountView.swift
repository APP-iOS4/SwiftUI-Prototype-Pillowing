//
//  IntakeCountView.swift
//  Pillowing
//
//  Created by Woo Sung jong on 2/20/24.
//

import SwiftUI

struct IntakeCountView: View {
    
    @Binding var isShowingSheet: Bool
    @State private var date = Date()
    @State private var intakeNumber: Int = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("섭취 시간")
                .font(.headline)
                .padding(.leading)
            DatePicker(
                "",
                selection: $date,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.wheel)
            
            Divider()
                .padding()
            Text("섭취 량")
                .font(.headline)
                .padding(.leading)
            HStack {
                Button(action: {
                    if intakeNumber > 1 {
                        intakeNumber -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                })
                .font(.largeTitle)
                .padding()
                Spacer()
                Text("\(intakeNumber) 정")
                    .font(.headline)
                Spacer()
                
                Button(action: {
                    intakeNumber += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                .font(.largeTitle)
                .padding()
            }
            HStack {
                Spacer()
                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    Text("확인")
                })
                .frame(width: 372, height: 56)
                .background(Color.accentColor)
                .foregroundStyle(.white)
                .cornerRadius(20)
                Spacer()
            }
        }
    }
}

#Preview {
    IntakeCountView(isShowingSheet: .constant(true))
}
