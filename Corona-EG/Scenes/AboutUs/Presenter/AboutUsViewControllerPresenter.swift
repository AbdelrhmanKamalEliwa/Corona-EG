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
}

class AboutUsViewControllerPresenter {
    private weak var view: AboutUsView?
    
    init(view: AboutUsView?) {
        self.view = view
    }
    
}
