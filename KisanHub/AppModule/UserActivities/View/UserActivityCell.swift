//
//  UserActivityCell.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import UIKit
import Kingfisher

//**************************************************
// MARK: - UserActivityCell Class
//**************************************************
class UserActivityCell: UITableViewCell {

    //**************************************************
    // MARK: - @IBOutlet
    //**************************************************
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var wakeUpTimelbl: UILabel!
    @IBOutlet weak var wakeUpImage: DesignableImageView!
    @IBOutlet weak var totalStepslbl: UILabel!
    @IBOutlet weak var totalStepsImage: DesignableImageView!

    //**************************************************
    // MARK: - Properties
    //**************************************************
    static let cellIdentifier = "UserActivityCell"

    //**************************************************
    // MARK: - Override Methods
    //**************************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    //**************************************************
    // MARK: - Methods
    //**************************************************
    func configuredCell(activity: Activity?) {
        guard let activity = activity else { return }
        self.totalStepslbl.text = activity.totalSteps
        self.datelbl.text = activity.date
        self.wakeUpTimelbl.text = activity.wakeUp
        if let url = URL(string: activity.wakeUpImage) {
            let imageViewResource = ImageResource(downloadURL: url, cacheKey: "\(url)-imageview")
            self.wakeUpImage.kf.setImage(with: imageViewResource)
        }
        if let url = URL(string: activity.totalStepsImage) {
            let imageViewResource = ImageResource(downloadURL: url, cacheKey: "\(url)-imageview")
            self.totalStepsImage.kf.setImage(with: imageViewResource)
        }
    }
}
