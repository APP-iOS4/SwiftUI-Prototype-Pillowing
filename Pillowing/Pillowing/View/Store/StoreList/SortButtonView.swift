//
//  SortButtonView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

//enum으로 sort 종류의 케이스를 만들고
//store 클래스에서 switch문을 통해 sort case에 따라 정렬된 리스트를 반환

struct SortButtonView: View {
    var sortName : String
    var body: some View {
        Text(sortName)
            .font(.callout)
            .frame(maxWidth: 100, minHeight: 25)
            .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                )
            .foregroundStyle(.gray)
            .fontWeight(.heavy)
            
    }
}

#Preview {
    SortButtonView(sortName: "낮은 가격순")
}
