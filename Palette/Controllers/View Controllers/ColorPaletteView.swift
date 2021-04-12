//
//  ColorPaletteView.swift
//  Palette
//
//  Created by Benjamin Tincher on 2/9/21.
//  Copyright © 2021 Cameron Stuart. All rights reserved.
//

import UIKit

class ColorPaletteView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }

    //  MARK: PROPERTIES
    var colors: [UIColor]? {
        didSet {
            buildColorBlocks()
        }
    }
    
    //  MARK: METHODS
    func buildColorBlocks() {
        
        resetColorBlocks()
        guard let colors = colors else { return }
        
        for color in colors {
            let colorBlock = generateColorBlocks(for: color)
            self.addSubview(colorBlock)
            self.colorStackView.addArrangedSubview(colorBlock)
        }
        self.layoutIfNeeded()
    }
    
    func generateColorBlocks(for color: UIColor) -> UIView {
        let colorBlock = UIView()
        colorBlock.backgroundColor  = color
        return colorBlock
    }
    
    func resetColorBlocks() {
        for subview in colorStackView.arrangedSubviews {
            self.colorStackView.removeArrangedSubview(subview)
        }
    }
    
    func setupViews() {
        self.addSubview(colorStackView)
        colorStackView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0)
        
        self.layer.cornerRadius = (self.frame.height / 2)
        self.layer.masksToBounds = true
    }
    
    //  MARK: VIEWS
    let colorStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
}   //  End of Class
