//
//  CustomButton.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 18
        layer.masksToBounds = true
        backgroundColor = .systemGray3
        tintColor = .white
        setTitleColor(.white, for: .normal)
    }

}
