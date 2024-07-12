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
        shouldStopPaginating = true
        filterCellSelectedIndex = indexPath.row
        filterCharacterPerStatus(characterStatus: filtersPerStatusArray[indexPath.row])
        
        // Let the pagination back again in case user reset all filters & update the view
        if(filtersPerStatusArray[indexPath.row] == "Reset") {
            shouldStopPaginating = false
            updateMainView()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filtersCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
        cell.configure(with: filtersPerStatusArray[indexPath.row],
                       cellIndex: indexPath.row, filterCellSelectedIndex: filterCellSelectedIndex)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtersPerStatusArray.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize( width: filtersPerStatusArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).width + 25, height: 30)
    }
}

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}
