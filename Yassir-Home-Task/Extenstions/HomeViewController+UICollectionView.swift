//
//  HomeViewController+UICollectionView.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 08/07/2024.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filtersCollectionView.deselectItem(at: indexPath, animated: true)
        print("The  index \(indexPath.row) have been Tapped")
    }
}

extension HomeViewController: UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = filtersCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell

        cell.configure(with: filtersItemsArray[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtersItemsArray.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth: CGFloat = ((collectionView.bounds.size.width)  / CGFloat(3.0))
        return CGSize( width: filtersItemsArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).width + 25, height: 30)
    }
}

