//
//  RectangleVShapeHelper.swift
//  yassir_ios_home_task
//
//  Created by Karim Soliman on 13/07/2024.
//

import Foundation
import SwiftUI

// MARK:- CIRCLE RECTANGLE TEXT VIEW
struct CircleInRectangleTextView: View {
    let text: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 97/255.0, green: 203/255.0, blue: 244/255.0))
                .frame(width: 60, height: 25)
                .cornerRadius(30)
                .overlay(
                    Text(text)
                        .foregroundColor(.black).font(.system(size: 12))
                )
        }
    }
}
