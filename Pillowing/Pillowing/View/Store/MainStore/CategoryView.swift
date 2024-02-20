//
//  CategoryView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct CategoryView: View {
    var categoryName : String
    var categoryImage : String
    var body: some View {
        VStack {
            Image(systemName: categoryImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .foregroundStyle(.gray)
            Text(categoryName)
                
                .foregroundStyle(.black)
        }
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
        )
        
    }
}

#Preview {
    CategoryView(categoryName: "테스트" , categoryImage: "person.fill")
}
