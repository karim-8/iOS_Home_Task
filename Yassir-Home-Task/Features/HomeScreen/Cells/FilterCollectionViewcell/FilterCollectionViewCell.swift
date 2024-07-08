//
//  FilterCollectionViewCell.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 07/07/2024.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet var filterLabel: UILabel!
    static let identifier = "FilterCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with text: String) {
        filterLabel.text = text
        filterLabel.textColor = .black
    }

    static func nib() -> UINib {
        return UINib(nibName: "FilterCollectionViewCell", bundle: nil)
    }

}
