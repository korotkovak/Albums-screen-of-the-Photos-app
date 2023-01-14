//
//  Fonts.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 13/01/23.
//

import UIKit

enum Fonts {
    static let regularOfSize22 = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22))
    static let regularOfSize16 = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
    static let boldOfSize22 = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
}
