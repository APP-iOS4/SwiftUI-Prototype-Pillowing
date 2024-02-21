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
    @State private var pushAlert = false
    @State private var Count: Int = 1
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                        .font(.title)
                        
                        Text("\(Count)")
                            .font(.headline)
                        
                        Button(action: {
                            if Count < 3 {
                                Count += 1
                            }
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                        
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(Color.accentColor)
                        .font(.title)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("섭취 루틴")
                            .font(.headline)
                        HStack {
                            Text("오전 8:00")
                            Spacer()
                            Text("1정")
                            Button {
                                isShowingIntakeCountSheet.toggle()
                            } label: {
                                HStack {
                                    Text("  >")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        if Count >= 2 {
                            HStack {
                                Text("오후 1:00")
                                Spacer()
                                Text("1정")
                                Button {
                                    isShowingIntakeCountSheet.toggle()
                                } label: {
                                    HStack {
                                        Text("  >")
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        
                        if Count >= 3 {
                            HStack {
                                Text("오후 6:00")
                                Spacer()
                                Text("1정")
                                Button {
                                    isShowingIntakeCountSheet.toggle()
                                } label: {
                                    HStack {
                                        Text("  >")
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
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
            Section {
                VStack {
                    Toggle("남은 영양제 푸시 알람", isOn: $pushAlert)
                        .tint(.accentColor)
                        .font(.headline)
                    Text("""
                        알람 설정하면
                        남은 영양제가 10정 이하면 알림을 받을 수 있어요!
                        """)
                }
            }
        }
        
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("확인")
                .frame(width: 372, height: 56)
                .background(Color.accentColor)
                .foregroundStyle(.white)
                .cornerRadius(20)
        })
        .sheet(isPresented: $isShowingIntakeDaySheet) {
            IntakeDayView(isShowingSheet: $isShowingIntakeDaySheet)
            // Sheet 높이 고정
                .presentationDetents([.height(300)])
            // Sheet 굴곡
            //                .presentationCornerRadius(40)
        }
        
        .sheet(isPresented: $isShowingIntakeCountSheet) {
            IntakeCountView(isShowingSheet: $isShowingIntakeCountSheet)
                .presentationDetents([.height(500)])
            //                .presentationCornerRadius(40)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    MyDetailView()
}
