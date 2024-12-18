//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by James Conybear (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState: ViewState
    @Binding var articleURL: String
    var body: some View {
        VStack{
            Button(action: {
                viewState = .articleList
            }, label: {
                HStack{
                    Text("<")
                        .padding(.leading)
                    Spacer()
                }
                })
            SwiftUIWebView(urlString: articleURL)
        }
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), articleURL: .constant("www.google.com"))
}
