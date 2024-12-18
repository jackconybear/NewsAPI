//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by James Conybear (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var viewState: ViewState
    @Binding var articleURL: String
    @State var data: FetchData = FetchData()
    var body: some View {
        ScrollView{
            ForEach(data.response.articles) { article in 
                Button(action: {
                    articleURL = article.url ??
                    "www.google.com"
                    viewState = .webView
                }, label: {
                    VStack{
                    HStack{
                        AsyncImage(url: article.urlToImage){
                            phase in
                            switch phase{
                            case.failure:
                                Image("fnf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            case.success(let image): image .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            default:
                                ProgressView()
                            }
                        }.padding()
                        Text(article.title ?? " ")
                    }
                }                })
                
              
        }
    }.task {
            await data.getData()
        }
    }
}

#Preview {
    ArticleListView(viewState: Binding.constant(.articleList), articleURL: Binding.constant("www.google.com"))
}
