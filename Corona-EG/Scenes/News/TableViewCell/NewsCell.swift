//
//  NewsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell, NewsCellView {
    
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleTitle: UILabel!
    @IBOutlet private weak var articleDescription: UILabel!
    
    func displayArticleImage(_ imageUrl: String?) {
        if imageUrl != nil {
            guard let url = URL(string: imageUrl!) else { return }
            articleImage.kf.indicatorType = .activity
            articleImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                switch result {
                case .success(let image):
                    self.articleImage.image = image.image
                case .failure:
                    self.articleImage.image = UIImage(named: "AppIcon")?.imageFlippedForRightToLeftLayoutDirection()
                    return
                }
            }
        }
    }
    
    func displayArticleTitle(_ title: String) {
        articleTitle.text = title
    }
    
    func displayArticleDescription(_ description: String) {
        articleDescription.text = description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
