import SwiftUI

struct NutrientsSearchList: View {
    var nutrientsStore = NutrientsStore()
    
    @Binding var searchText : String
    
    var filterNutrients : [Nutrients] {
        return nutrientsStore.getNutirentsBySearch(text: searchText)
    }
             
    var body: some View {
        VStack{
            TextField("영양제 검색",text : $searchText)
                .padding()
                .textFieldStyle(CustomTextField())
            if !filterNutrients.isEmpty {
                List {
                    ForEach(filterNutrients) {
                        nutrient in
                        NutrientsListLow(nutrients: nutrient)
                            
                    }
                }
                .listStyle(.plain)
            } else {
                Text("검색결과가 없습니다")
                            .foregroundColor(.gray)
                            .padding()

            }
            Spacer()
        }
    }
}

#Preview {
    NutrientsSearchList(searchText: .constant("장"))
}
