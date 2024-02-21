//
//  NutrientsListLow.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct NutrientsListLow: View {
    var nutrients: Nutrients
    var body: some View {
        HStack{
            nutrients.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70,height: 70)
            
            VStack(alignment:.leading ,spacing: 0){
                Text("\(nutrients.name)")
                    .foregroundStyle(.black)
                    .lineLimit(1)
                    .font(.headline)
                HStack{
                    Text("\(nutrients.count)캡슐")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                    Spacer()
                    Text("\(nutrients.price)원")
                        .foregroundStyle(.black)
                        .font(.title3)
                        .bold()
                        .padding(.trailing)
                }
                
                
                //Nutrients 객체에서 평점을 얻어오는 프로퍼티가 필요함
                HStack {
                    StarView(starCount: 4.0, reviewCount: nutrients.reviews?.count ?? 0)
                        .font(.caption2)
                        .foregroundStyle(.black)
                    Spacer()
                    Text("(하루에 \(nutrients.price/nutrients.count)원)")
                        .padding(.trailing)
                        .font(.caption)
                        .foregroundStyle(.orange)
                }
            }
            
        }
    }
    
    
}

#Preview {
    NutrientsListLow(nutrients: Nutrients(name: "락토핏 생유산균 골드", imageString: "largeIntestine1", count: 80, price: 11500, storeURL: "https://link.coupang.com/a/bq9bXH", category: .largeIntestine))
}
