//
//  ContentView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
                .tag(0)
            
            ReviewView()
                .tabItem {
                    Label("스토어", systemImage: "storefront")
                }
                .tag(1)
            
            MyDetailView()
                .tabItem {
                    Label("마이", systemImage: "person.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
