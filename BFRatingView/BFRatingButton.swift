//
//  BFRatingButton.swift
//  BFRatingViewDemo
//
//  Created by Dennis on 2017/5/4.
//  Copyright © 2017年 Dennis. All rights reserved.
//

import UIKit

enum BFRatingButtonType:Int {
    case NORMAL = 0
    case LIKE
    case DISLIKE
}


class BFRatingButton:UIButton {
    
    @IBInspectable var index:Int = 0
    var ratingType:BFRatingButtonType = .NORMAL {
        didSet {
            switch self.ratingType {
            case .NORMAL:
                self.backgroundColor = UIColor.white
            case .LIKE:
                self.backgroundColor = UIColor.red
            case .DISLIKE:
                self.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    init(frame: CGRect, index: Int, type:BFRatingButtonType) {
        var adjustFrame = frame
        if adjustFrame.size.height < 40 {
            adjustFrame.size.height = 40
        }
        super.init(frame: adjustFrame)
        self.index = index
        self.ratingType = type
        
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
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.size.height / 2
        
    }
    
}
