//
//  ReviewView.swift
//  Pillowing
//
//  Created by 이시형 on 2/20/24.
//

import SwiftUI

struct ReviewView: View {
    @State var review: String = ""
    let placeholderText: String = """
    섭취한 제품의 리뷰를 자유롭게 작성해주세요.
    (최소 20자 이상)
    
    #을 입력해 태그를 추가할 수도 있어요.
    """
    let nutrientsStore = NutrientsStore()
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "circle")
                
                VStack(alignment: .leading) {
                    Text("\(nutrientsStore.nutrients[0].category.rawValue)")
                        .foregroundStyle(.gray)
                    Text("\(nutrientsStore.nutrients[0].name)")
                }
                Spacer()
            }
            .padding(30)
            
            VStack {
                Text("평점을 선택해주세요")
                    .bold()
                
                HStack {
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
                .font(.title)
                .padding(2)
            }
            .padding(EdgeInsets(top: 25, leading: 50, bottom: 25, trailing: 50))
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.background)
                    .shadow(color: .gray, radius: 5)
            )
            
            VStack(alignment: .leading) {
                HStack{
                    Text("상세 리뷰")
                    Spacer()
                }
                .bold()
                
                HStack{
                    Text("(구매이유, 효과, 가성비, 편의성, 불편감, 추천여부/사유 등)\n")
                    Spacer()
                }
                .font(.caption)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $review)
                        .frame(maxHeight: 100)
                    if review.isEmpty {
                        Text(placeholderText)
                            .padding()
                            .foregroundStyle(.gray)
                    }
                }
                
                HStack {
                    Spacer()
                    Text("0/2000")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            .padding(30)
            
            Divider()
            
            Spacer()
            
            Button {
                
            } label: {
                Text("리뷰 쓰기")
                    .foregroundStyle(.white)
            }
            .padding(EdgeInsets(top: 10, leading: 120, bottom: 10, trailing: 120))
            .background(
                RoundedRectangle(cornerRadius: 20)
                .fill(.accent)
                )
        }
        .navigationTitle("리뷰 쓰기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ReviewView()
    }
}
