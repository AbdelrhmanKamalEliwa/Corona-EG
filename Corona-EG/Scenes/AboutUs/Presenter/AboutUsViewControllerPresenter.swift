//
//  AboutUsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - About Us View Protocol
protocol AboutUsView: class {
    var presenter: AboutUsViewControllerPresenter? { get set }
    func openFacebook()
    func openTwitter()
    func openLinkedIn()
    func openGitHub()
    func openGmail()
}

class AboutUsViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: AboutUsView?
    
    // MARK: - init
    init(view: AboutUsView?) {
        self.view = view
    }
    
    // MARK: - Methods
    func goToSocialMediaAccount(_ caseNumber: Int) {
        let button = SocialMediaCases(rawValue: caseNumber)
        switch button {
        case .Facebook:
            view?.openFacebook()
        case .Twitter:
            view?.openTwitter()
        case .LinkedIn:
            view?.openLinkedIn()
        case .GitHub:
            view?.openGitHub()
        case .Gmail:
            view?.openGmail()
        case .none:
            break
        }
    }
}
