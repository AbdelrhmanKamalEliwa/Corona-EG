//
//  NewsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol NewsView: class {
    var presenter: NewsViewControllerPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error: String)
}

protocol NewsCellView {
    func displayArticleImage(_ imageUrl: String?)
    func displayArticleTitle(_ title: String)
    func displayArticleDescription(_ description: String)
}

class NewsViewControllerPresenter {
    
    private weak var view: NewsView?
    private let interactor: NewsInteractor
    private var news: [Article] = []
    private let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
    
    init(view: NewsView?, interactor: NewsInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getNews()
    }
    
    func checkForEnglishLanguage(_ currentLanguage: String) -> Bool {
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
        
        interactor.getNews(country: safeCountry) { [weak self] (news, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let news = news else { return }
                self.news = news
                self.view?.fetchDataSuccess()
            }
        }
    }
    
    func getNewsCount() -> Int {
        news.count
    }
    
    func cellConfiguartion(cell: NewsCellView, for index: Int) {
        let article = news[index]
        
        let articleImageUrl = article.urlToImage
        cell.displayArticleImage(articleImageUrl)
        
        let articleTitle = article.title
        cell.displayArticleTitle(articleTitle)
        
        let articleDescription = article.description
        cell.displayArticleDescription(articleDescription)
    }
    
    func didSelectRow(at index: Int) {
        
    }
}
