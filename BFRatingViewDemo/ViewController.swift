//
//  ViewController.swift
//  BFRatingViewDemo
//
//  Created by Dennis on 2017/5/4.
//  Copyright © 2017年 Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BFRatingViewDelegate {

    @IBOutlet weak var BFButton1: BFRatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ============ Demo1: BFRatingButton ============
        
        // Way1: Using the story board
        self.BFButton1.backgroundColor = UIColor.orange
        self.BFButton1.selectedBackgroundColor = UIColor.red
        self.BFButton1.setTitle("Open Rating", for: .normal)
        self.BFButton1.addTarget(self, action: #selector(openRating), for: .touchDown)
        
        
        // Way2: Using init method
//        let button2 = BFRatingButton(frame: CGRect(x:100, y:100, width:200, height:60), index: 1)
//        button2.backgroundColor = UIColor.green
//        button2.selectedBackgroundColor = UIColor.blue
//        button2.setTitle("Button2", for: .normal)
//        button2.setTitleColor(UIColor.black, for: .normal)
//        button2.setTitleColor(UIColor.white, for: .highlighted)
//        self.view.addSubview(button2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // ============ Demo2: BFRatingView ============
    func openRating() {
        
        // Way 1
//        let view = BFRatingView.loadFromNib()
//        view?.frame = CGRect(x: 0, y:0, width:self.view.bounds.width, height: self.view.bounds.height)
//        view?.delegate = self
//        view?.title.text = "BFRatingView Demo"
//        
//        view?.button.setTitle("Like Me!", for: .normal)
//        view?.button.setTitleColor(UIColor.black, for: .normal)
//        view?.button.setTitleColor(UIColor.white, for: .highlighted)
//        view?.button.selectedBackgroundColor = UIColor.red
//        view?.button.backgroundColor = UIColor.orange
//        
//        self.view.addSubview(view!)
        
        // Way 2
        let view = BFRatingView.ratingView(title: "Rating!", button: "Like Me!", image: "rate", in: self.view, delegate: self, identity: "DemoRatingView")
        view?.check()
    }
    
    func ratingViewShouldDisplay(_ view: BFRatingView) -> Bool {
        switch view.viewID {
        case "DemoRatingView":
            return true
        default:
            return false
        }
    }
    
    func ratingViewDidClosed(_ view: BFRatingView) {
        switch view.viewID {
        case "DemoRatingView":
            print("Rating View Closed!")
        default:
            print("unknow rating view")
        }
    }
    
    func ratingViewDidSelectButton(_ view: BFRatingView) {
        switch view.viewID {
        case "DemoRatingView":
            print("button clicked!")
        default:
            print("unknow rating view")
        }
    }

}

