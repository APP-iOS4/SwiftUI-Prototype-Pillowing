//
//  ReviewView.swift
//  Pillowing
//
//  Created by 이시형 on 2/20/24.
//

import SwiftUI

struct ReviewView: View {
    @State var isCancelReview: Bool = false
    @State var review: String = ""
    
    let placeholderText: String = """
    섭취한 제품의 리뷰를 자유롭게 작성해주세요.
    (최소 20자 이상)
    
    #을 입력해 태그를 추가할 수도 있어요.
    """
    let nutrientsStore = NutrientsStore()
    @State var stars: [Bool] = [true, true, true, true, true]
    
    var body: some View {
        ZStack {
            VStack {
//                HStack {
//                    Button(action: {
//                        isCancelReview.toggle()
//                    }, label: {
//                        Image(systemName: "chevron.left")
//                            .foregroundStyle(Color.black)
//                    })
//                    .padding(.leading, 30)
//                    Spacer()
//                }
                
                HStack {
                    nutrientsStore.nutrients[0].image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("\(nutrientsStore.nutrients[0].category.rawValue)")
                            .foregroundStyle(.gray)
                        Text("\(nutrientsStore.nutrients[0].name)")
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                
                VStack {
                    Text("평점을 선택해주세요")
                        .bold()
                    
                    HStack {
                        ForEach(stars, id: \.self) { index in
                            Button {
                                for i in 0...3 {
                                    stars[i] = false
                                }
                            } label: {
                                if index {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color(UIColor.systemGray5))
                                } else {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
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
            if isCancelReview {
                ReviewCancelView(isCancelReview: $isCancelReview)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ReviewView()
    }
}
