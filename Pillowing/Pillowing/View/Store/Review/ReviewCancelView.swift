//
//  ReviewCancleView.swift
//  Pillowing
//
//  Created by 이시형 on 2/20/24.
//

import SwiftUI

struct ReviewCancelView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isCancelReview: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            VStack {
                Text("작성중인 리뷰를\n취소하시겠습니까?")
                    .padding()
                
                HStack {
                    Button {
                        isCancelReview.toggle()
                    } label: {
                        Text("취소")
                            .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                            .foregroundStyle(.gray)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor.systemGray5))
                            )
                    }
                    Button {
                        isCancelReview.toggle()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("확인")
                            .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.accent)
                            )
                    }
                }
            }
            .font(.title2)
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
            .background(
                RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            )
        }
    }
}

#Preview {
    ReviewCancelView(isCancelReview: .constant(true))
}
