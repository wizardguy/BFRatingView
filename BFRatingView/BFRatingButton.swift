//
//  BFRatingButton.swift
//  BFRatingViewDemo
//
//  Created by Dennis on 2017/5/4.
//  Copyright © 2017年 Dennis. All rights reserved.
//

import UIKit


class BFRatingButton:UIButton {
    
    @IBInspectable
    var index:Int = 0
    
    var highlitedColor: UIColor?
    
    @IBInspectable var selectedBackgroundColor:UIColor {
        set {
            self.highlitedColor = newValue
            self.setBackgroundImage(BFRatingButton.imageFrom(newValue), for: .highlighted)
        }
        get {
            return self.highlitedColor!
        }
    }

    
    init(frame: CGRect, index: Int) {
        super.init(frame: frame)
        self.index = index

        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    
    func setupUI() -> Void {
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    
    static func imageFrom(_ color:UIColor) -> UIImage? {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor)
        context!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return colorImage;
    }
    
}
