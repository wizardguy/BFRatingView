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
    func ratingViewShouldDisplay(_ view:BFRatingView) -> Bool
    func ratingViewDidSelectButton(_ view:BFRatingView)
    @objc optional func ratingViewDidClosed(_ view:BFRatingView)
}



class BFRatingView:UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: BFRatingButton!
    @IBOutlet weak var buttonClose: UIButton!
    
    weak var delegate: BFRatingViewDelegate?
    weak var parentView: UIView!
    
    var viewID:String! = "BFDefault"
        
    public class func ratingView(title titleText:String!, button buttonText:String!, image name:String?, in parent:UIView!, delegate:BFRatingViewDelegate, identity viewID:String!) -> BFRatingView? {
        if let view = self.loadFromNib() {
            view.parentView = parent
            view.frame = CGRect(x: 0, y:0, width:parent.bounds.width, height: parent.bounds.height)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 11
            paragraphStyle.alignment = NSTextAlignment.center
            paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            let attrString = NSMutableAttributedString(string: titleText)
            attrString.addAttributes([NSParagraphStyleAttributeName:paragraphStyle,
                                      NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0),
                                      ], range: NSMakeRange(0, attrString.length))
            
            view.title.attributedText = attrString
            view.button.setTitle(buttonText, for: .normal)
            
            if let imageName = name {
                view.imageView.image = UIImage(named: imageName)
            }
            view.delegate = delegate
            view.viewID = viewID
            
            return view
        }
        else {
            return nil
        }
    }
    
    
    public class func loadFromNib() -> BFRatingView? {
        if let view = UINib(nibName: "BFRatingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? BFRatingView {
            let mainBlue = UIColor.init(colorLiteralRed: 81.0/255.0, green: 140.0/255.0, blue: 1.0, alpha: 1.0)
            view.button.setTitleColor(mainBlue, for: .highlighted)
            view.button.setTitleColor(UIColor.white, for: .normal)
            view.button.layer.borderColor = mainBlue.cgColor
            view.button.selectedBackgroundColor = UIColor.white
            view.button.backgroundColor = mainBlue
            view.button.layer.cornerRadius = 23.0
            return view
        }
        return nil
    }
    
    public func check() {
        if (self.delegate?.ratingViewShouldDisplay(self))! {
            self.parentView.addSubview(self)
        }
    }
    
    
    override func awakeFromNib() {
        self.containerView.layer.cornerRadius = 15.0
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
    @IBAction private func closedbuttonClicked(_ sender: UIButton) {
        close()
    }
    
    
    @IBAction private func buttonClicked(_ sender: BFRatingButton) {
        self.delegate?.ratingViewDidSelectButton(self)
        //self.perform(#selector(close), with: nil, afterDelay: 0.3)
        close()
    }
    
    
    @objc private func close() {
        self.removeFromSuperview()
        self.delegate?.ratingViewDidClosed?(self)
    }
    
}
