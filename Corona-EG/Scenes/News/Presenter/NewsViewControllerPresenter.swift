//
//  NewsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - NewsView Protocol
protocol NewsView: class {
    var presenter: NewsViewControllerPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error: String)
}

// MARK: - News Cell View Protocol
protocol NewsCellView {
    func displayArticleImage(_ imageUrl: String?)
    func displayArticleTitle(_ title: String)
    func displayArticleDescription(_ description: String)
}

class NewsViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: NewsView?
    private let interactor: NewsInteractor
    private var news: [Article] = []
    private var pageIndex = 1
    private let currentLanguage = "currentAppLanguage".localizedString()
    
    // MARK: - init
    init(view: NewsView?, interactor: NewsInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        getNews()
    }
    
    private func checkForEnglishLanguage(_ currentLanguage: String) -> Bool {
        if currentLanguage == "en" { return true } else { return false }
    }
    
    private func getNews() {
        view?.showIndicator()
        var country: Countries?
        if checkForEnglishLanguage(currentLanguage) {
            country = Countries.USA
        } else {
            country = Countries.Egypt
        }
        guard let safeCountry = country else { return }
        interactor.getNews(country: safeCountry, pageIndex: pageIndex) { [weak self] (news, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let news = news else { return }
                var safeNews: [Article] = []
                for article in news.articles {
                    if article.author != nil {
                        safeNews.append(article)
                    }
                }
                self.news.append(contentsOf: safeNews)
                print(self.news.count)
                self.pageIndex += 1
                self.view?.fetchDataSuccess()
            }
        }
    }
    
    func getNewsCount() -> Int {
        news.count
    }
    
    func cellConfiguartion(cell: NewsCellView, for index: Int) {
        let article = news[index]
        guard let articleImageUrl = article.urlToImage else { return }
        cell.displayArticleImage(articleImageUrl)
        guard let articleTitle = article.author else { return }
        cell.displayArticleTitle(articleTitle)
        guard let articleDescription = article.description else { return }
        cell.displayArticleDescription(articleDescription)
    }
    
    func didSelectRow(at index: Int) -> URL {
        let mockUrl = "https://www.google.com"
        if let url = news[index].url {
            let urlwithPercentEscapes = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return URL(string: urlwithPercentEscapes!)!
        } else {
            return URL(string: mockUrl)!
        }
    }
}
