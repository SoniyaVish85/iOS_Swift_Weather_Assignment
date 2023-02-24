//
//  RoundedCornerCustomView.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 22/02/23.
//

import UIKit

class RoundedCornerCustomView: UIView {
    // MARK: - init methods

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    // MARK: - setup UI

    private func setupUI() {
        layer.cornerRadius = CGFloat(WAViewCornerRadius)
    }
}
