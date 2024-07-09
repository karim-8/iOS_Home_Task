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
        cellUIConfiguration()
    }
    

    func cellUIConfiguration() {

        // UIView Border shape
        if(characterDescription.text == "Human") {
            characterBackgroundView.layer.borderWidth = 0
            characterBackgroundView.layer.masksToBounds = false
            characterBackgroundView.layer.borderColor = UIColor.blue.cgColor
            characterBackgroundView.layer.cornerRadius = 15.0
            characterBackgroundView.layer.masksToBounds = true

        }else {
            characterBackgroundView.layer.borderWidth = 1
            characterBackgroundView.layer.masksToBounds = false
            characterBackgroundView.layer.borderColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1).cgColor
            characterBackgroundView.layer.cornerRadius = 15.0
            characterBackgroundView.layer.masksToBounds = true
        }


        // Character bold font
        characterName.font = .boldSystemFont(ofSize: 16)

        // Description font color
        characterDescription.textColor = .gray
        characterDescription.font = .systemFont(ofSize: 13)

        // Character Image radius
        characterImage.layer.cornerRadius = 10.0
        
    }

    public func configure(with imageName: String, imageType: String) {
        characterName.text = imageName
        characterDescription.text = imageType

        if(characterDescription.text == "Human") {
            characterBackgroundView.backgroundColor =
            UIColor(red: 235/255.0, green: 246/255.0, blue: 251/255.0, alpha: 1)
            characterBackgroundView.layer.borderWidth = 0
        }
        if(characterDescription.text == "Dwarf") {
            characterBackgroundView.backgroundColor =
            UIColor(red: 251/255.0, green: 231/255.0, blue: 235/255.0, alpha: 1)
            characterBackgroundView.layer.borderWidth = 0
        }

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    static func nib() -> UINib {
        return UINib(nibName: "CharacterTableViewCell", bundle: nil)
    }
}
