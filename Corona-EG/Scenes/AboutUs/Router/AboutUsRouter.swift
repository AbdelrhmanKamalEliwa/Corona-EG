//
//  AboutUsViewControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class AboutUsRouter {
    class func createAboutUsVC() -> UIViewController {
        let aboutUsViewController = AboutUsViewController()
        let presenter = AboutUsViewControllerPresenter(view: aboutUsViewController)
        aboutUsViewController.presenter = presenter
        return aboutUsViewController
    }
}
