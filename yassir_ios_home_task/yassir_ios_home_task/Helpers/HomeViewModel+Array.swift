//
//  HomeViewModel+Array.swift
//  yassir_ios_home_task
//
//  Created by Karim Soliman on 13/07/2024.
//

import Foundation
public extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
