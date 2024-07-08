//
//  CharacterTableViewCell.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 08/07/2024.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterBackgroundView: UIView!

    static var identifier = "CharacterTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.text = "Zephyr"
        characterName.textColor = .black
        characterDescription.text = "Elf"

        /// Description font color
        characterDescription.textColor = .gray
        characterDescription.font = .systemFont(ofSize: 13) ///.boldSystemFont(ofSize: 13)


        /// Character bold font
        characterName.font = .boldSystemFont(ofSize: 16)

/// Image Border shape
        characterBackgroundView.layer.borderWidth = 1
        characterBackgroundView.layer.masksToBounds = false
        characterBackgroundView.layer.borderColor = UIColor.lightGray.cgColor
        characterBackgroundView.layer.cornerRadius = 15.0
        characterBackgroundView.layer.masksToBounds = true

/// Character Image
        characterImage.layer.cornerRadius = 10.0


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    static func nib() -> UINib {
        return UINib(nibName: "CharacterTableViewCell", bundle: nil)
    }
}
