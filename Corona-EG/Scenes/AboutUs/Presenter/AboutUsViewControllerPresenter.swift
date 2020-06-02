//
//  AboutUsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol AboutUsView: class {
    var presenter: AboutUsViewControllerPresenter? { get set }
    func openFacebook()
    func openTwitter()
    func openLinkedIn()
    func openGitHub()
    func openGmail()
}

class AboutUsViewControllerPresenter {
    private weak var view: AboutUsView?
    
    init(view: AboutUsView?) {
        self.view = view
    }
    
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
