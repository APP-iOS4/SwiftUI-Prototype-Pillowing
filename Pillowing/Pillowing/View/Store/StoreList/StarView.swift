//
//  StarView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct StarView: View {
    var starCount : Double
    var reviewCount : Int
    var body: some View {
        HStack( spacing:-1){
            ForEach(1..<6){ num in
                if num <= Int(starCount) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                } else {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.gray)
                }
            }
            Text(String(format: "%.1f", starCount))
                .font(.body)
                .padding(.leading,5)
            Text("(\(reviewCount))")
                .font(.caption)
                .padding(.leading,2)
                .foregroundStyle(.gray)
                
        }
        
    }
}

#Preview {
    StarView(starCount: 4.0, reviewCount: 30)
}
