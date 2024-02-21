//
//  WebView.swift
//  Pillowing
//
//  Created by 최정인 on 2/20/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlString: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView: WKWebView = WKWebView()
        
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

#Preview {
    WebView(urlString: "https://www.naver.com/")
}
