//
//  MyDetailView.swift
//  Pillowing
//
//  Created by Woo Sung jong on 2/20/24.
//

import SwiftUI

struct MyDetailView: View {
    var nutrientsStore: NutrientsStore = NutrientsStore()
    
    
    @State private var isShowingIntakeDaySheet: Bool = false
    @State private var isShowingIntakeCountSheet: Bool = false
    @State private var selectedIntakeDay = "월"
    @State private var vibrateOnRing = false
    
    @State private var Count: Int = 1
    
    var body: some View {
        List {
            Section {
                Button(action: {
                    isShowingIntakeDaySheet.toggle()
                    print("gg")
                }, label: {
                    HStack {
                        Text("섭취 요일")
                            .font(.headline)
                        Spacer()
                        Text("월, 수, 금")
                    }
                    .foregroundStyle(.black)
                })
            }
            
            Section {
                VStack {
                    HStack {
                        Text("섭취 횟수")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            if Count > 1 {
                                Count -= 1
                                print("-\(Count)")
                            }
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                        })
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(Color.accentColor)
                        
                        Text("\(Count)")
                            .font(.headline)
                        
                        Button(action: {
                            Count += 1
                            print("+: \(Count)")
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(Color.accentColor)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("섭취 루틴")
                            .font(.headline)
                        HStack {
                            Button {
                                isShowingIntakeCountSheet.toggle()
                            } label: {
                                HStack {
                                    Text("오전 8:00")
                                    Spacer()
                                    Text("1정")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                }
                
            }
            
            Section {
                VStack {
                    Toggle("푸시 알람", isOn: $vibrateOnRing)
                        .tint(.accentColor)
                        .font(.headline)
                    Text("""
                        알람 설정하면
                        등록하신 시간에 맞춰 알림을 받을 수 있어요!
                        """)
                }
            }
        }
        
        .sheet(isPresented: $isShowingIntakeDaySheet) {
            IntakeDayView()
        }
        .sheet(isPresented: $isShowingIntakeCountSheet) {
            IntakeCountView()
        }
    }
}

#Preview {
    MyDetailView()
}
