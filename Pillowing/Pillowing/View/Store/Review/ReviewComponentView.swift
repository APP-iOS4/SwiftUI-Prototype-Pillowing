//
//  ReviewComponentView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI

struct ReviewComponentView: View {
    var review: Review
    var body: some View {
        // user · grade
        HStack {
            ZStack {
                Circle()
                    .fill(Color(red: 244/255, green: 244/255, blue: 244/255))
                    .frame(width: 60)
                
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27)
            }
            
            Spacer()
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(review.userName)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    HStack {
                        ForEach(0..<5, id: \.self) { i in
                            if i < review.grade {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color(red: 255/255, green: 196/255, blue: 68/255))
                            } else {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color(red: 221/255, green: 221/255, blue: 221/255))
                            }
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 7)
                
                Text(review.description)
            }
        }
    }
}

#Preview {
    ReviewComponentView(review: Review(userName: "최정인", grade: 3, description: "메롱"))
}
