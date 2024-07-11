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
        return charactersDataInfo.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as! CharacterTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configure(with: charactersDataInfo[indexPath.row].name ?? "", imageType: charactersDataInfo[indexPath.row].species ?? "",
                       imageLink: charactersDataInfo[indexPath.row].image ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    ///Footer
    private func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRectMake(0, 0, tableView.bounds.size.width, 20))
    }

    private func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Index which tapped is ..... \(indexPath.row)")
        // Navigate to Detailed Character View
        coordinator.navigateTo(navigation: navigationController ?? UINavigationController())
    }

}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (charactersTableView.contentSize.height-100-scrollView.frame.size.height) {
            if(isPaginating == true) {
                return
            }else {
                createSpinnerFooter()
                // Fetch more data from the api
                print("I'm going to fetch more")
                currentPage+=1
                getUsersData(pageNumber: currentPage)

            }
        }
    }

    //MARK:- CREATE SPINNER FOOTER
    private func createSpinnerFooter()  {

            spinner.center = self.view.center
            spinner.hidesWhenStopped = true
            spinner.style = UIActivityIndicatorView.Style.gray
            view.addSubview(spinner)

//        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
//        spinner.color = .gray
//        spinner.center = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
//        spinner.startAnimating()
//        self.view.addSubview(spinner)
        
    }
}
