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
    
    func configure(image: String, title: String, subtitle: String, description: String) {
        self.imageImageView.image = UIImage(named: image)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.subTitleLabel.text = subtitle
    }

}
