//
//  RankItemView.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct RankItemView: View {
    var nutirentsStore = NutrientsStore()
    var nutirent : Nutrients
    var body: some View {
        HStack {
            VStack(spacing: -20){
                nutirentsStore.nutrients[0].image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)
                    .padding()
                Text("실시간 1위")
                    .bold()
                    .font(.system(size: 9))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width : 80 ,height:  20 )
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                    )
                    
            }
            .padding(.bottom)
            VStack(alignment:.leading){
                Text(nutirent.name)
                
                Text("\(nutirent.price)원")
                    .bold()
                    .font(.callout)
                    .padding(.top,-4)
                Text("(하루에 \(nutirent.price/nutirent.count)원)")
                    .foregroundStyle(.orange)
                    .font(.caption)
            }
            .padding(.trailing)

        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
        )
        .padding([.top,.bottom,.leading])
    }
}

#Preview {
    RankItemView(nutirent: Nutrients(name: "락토핏 생유산균 골드", count: 80, price: 11500, storeURL: "https://link.coupang.com/a/bq9bXH", category: .largeIntestine))
}
