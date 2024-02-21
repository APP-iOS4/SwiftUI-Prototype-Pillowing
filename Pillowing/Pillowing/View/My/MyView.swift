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
                }
            }
            Spacer()
            Text("락토핏 유산균이 10알 남았어요")
                .frame(width: 386, height: 68)
                .background(Color.gray)
                .foregroundStyle(.black)
            
            HStack {
                Spacer()
                NavigationLink {
                    MyDetailView()
                } label: {
                    Text("추가")
                }
                .foregroundStyle(.black)
                .padding()
            }
            List {
                Section("내 영양제") {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.fill")
                            VStack(alignment: .leading) {
                                Text("라이프익스텐션")
                                    .foregroundStyle(.gray)
                                Text("투퍼데이 멀티비타민(타블렛)")
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("매일")
                            HStack {
                                Text("8:30 AM")
                                Spacer()
                                Text("1정")
                            }
                            
                            HStack {
                                Text("12:30 AM")
                                Spacer()
                                Text("1정")
                            }
                        }
                        .padding()
                        
                        Divider()
                        HStack {
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("루틴 중단")
                                .foregroundStyle(.black)
                            })
                            Spacer()
                            Divider()
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("루틴 수정")
                                    .foregroundStyle(.black)
                            })
                            Spacer()
                        }
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
