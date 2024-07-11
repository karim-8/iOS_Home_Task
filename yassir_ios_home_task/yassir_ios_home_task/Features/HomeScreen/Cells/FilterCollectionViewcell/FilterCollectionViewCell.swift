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

    public func configure(with text: String, cellIndex: Int, filterCellSelectedIndex: Int) {
        filterLabel.text = text
        filterLabel.textColor = .black

        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 15.0
        layer.masksToBounds = true
    }

    static func nib() -> UINib {
        return UINib(nibName: "FilterCollectionViewCell", bundle: nil)
    }

    override func prepareForReuse() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 15.0
        layer.masksToBounds = true
    }

}
