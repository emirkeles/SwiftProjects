//
//  NewsViewModel.swift
//  News
//
//  Created by Emir Keleş on 31.05.2023.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
    
}


struct NewsViewModel {
    
    let news : News
    var title : String {
        return self.news.title
    }
    var story : String {
        return self.news.story
    }
    
}
