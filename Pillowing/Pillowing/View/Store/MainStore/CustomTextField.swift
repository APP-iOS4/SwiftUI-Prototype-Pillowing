//
//  CustomTextField.swift
//  Pillowing
//
//  Created by 정운관 on 2/20/24.
//

import SwiftUI

struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color.searchBar)
                    .opacity(0.8)
                    .cornerRadius(12)
                    .frame(height: 40)
                
                // 텍스트필드
                configuration
                    
                    .padding()
            }
        }
}

