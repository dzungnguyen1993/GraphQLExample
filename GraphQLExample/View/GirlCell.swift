//
//  GirlCell.swift
//  GraphQLExample
//
//  Created by Thanh-Dung Nguyen on 8/20/17.
//  Copyright © 2017 Thanh-Dung Nguyen. All rights reserved.
//

import UIKit

class GirlCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(girl: GirlFullDetails) {
        nameLabel.text = "Name: \(girl.name)"
        ageLabel.text = "Age: \(girl.age)"
        heightLabel.text = "Height: \(girl.height)"
    }
}
