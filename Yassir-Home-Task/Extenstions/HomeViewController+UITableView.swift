//
//  HomeViewController+UITableView.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 08/07/2024.
//

import UIKit


extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as! CharacterTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configure(with: charactersNames[indexPath.row], imageType: charactersNamesDesc[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Index which tapped is ..... \(indexPath.row)")
    }
}
