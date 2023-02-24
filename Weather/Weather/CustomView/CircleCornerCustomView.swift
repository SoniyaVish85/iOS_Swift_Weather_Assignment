//
//  CircleCornerCustomView.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 22/02/23.
//

import UIKit

class CircleCornerCustomView: UIView {
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
        let size = frame.size
        if size.width == size.height {
            layer.cornerRadius = CGFloat(size.height / 2)
        }
    }
}
