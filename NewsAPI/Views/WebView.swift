//
//  WebView.swift
//  NewsAPI
//
//  Created by James Conybear (student LM) on 12/13/24.
//

import SwiftUI
import WebKit

struct SwiftUIWebView : UIViewRepresentable{
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        var prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let updatedString = urlString.replacingOccurrences(of: "http:", with: "https:")
        print(updatedString)
        guard let url = URL(string: updatedString) else{
            print("failed")
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
}
