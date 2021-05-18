//
//  OnbordingCollectionViewCell.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import UIKit

class OnbordingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: OnbordingModel) {
        self.imageImageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.subTitleLabel.text = model.subTitle
    }

}
