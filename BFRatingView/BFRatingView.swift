//
//  BFRatingView.swift
//  BFRatingViewDemo
//
//  Created by Dennis on 2017/5/4.
//  Copyright © 2017年 Dennis. All rights reserved.
//

import Foundation
import UIKit

@objc protocol BFRatingViewDelegate {
    func ratingView(_ view:BFRatingView, didSelectButtonAt index:Int) -> Void
    @objc optional func ratingViewDidClosed() -> Void
}



class BFRatingView:UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var button1: BFRatingButton!
    @IBOutlet weak var button2: BFRatingButton!
    @IBOutlet weak var buttonClose: UIButton!
    
    weak var delegate: BFRatingViewDelegate?
    
    class func loadFromNib() -> BFRatingView? {
        return UINib(nibName: "BFRatingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? BFRatingView
    }
    
    
    override func awakeFromNib() {
        self.containerView.layer.cornerRadius = 10
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
    @IBAction func closedbuttonClicked(_ sender: UIButton) {
        close()
    }
    
    
    @IBAction func button1Clicked(_ sender: BFRatingButton) {
        buttonClicked(sender)
    }
    
    @IBAction func button2Clicked(_ sender: BFRatingButton) {
        buttonClicked(sender)
    }
    

    private func buttonClicked(_ sender:BFRatingButton) {
        self.delegate?.ratingView(self, didSelectButtonAt: sender.index)
        //self.perform(#selector(close), with: nil, afterDelay: 0.3)
    }
    
    
    @objc private func close() {
        self.removeFromSuperview()
        self.delegate?.ratingViewDidClosed?()
    }
    
}
