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
        let button2 = BFRatingButton(frame: CGRect(x:100, y:100, width:200, height:60), index: 1)
        button2.backgroundColor = UIColor.green
        button2.selectedBackgroundColor = UIColor.blue
        button2.setTitle("Button2", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.setTitleColor(UIColor.white, for: .highlighted)
        self.view.addSubview(button2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // ============ Demo2: BFRatingView ============
    func openRating() {
        let view = BFRatingView.loadFromNib()
        view?.frame = CGRect(x: 0, y:0, width:self.view.bounds.width, height: self.view.bounds.height)
        view?.delegate = self
        view?.title.text = "BFRatingView Demo"
        view?.subTitle.text = "Here is the Demo SubTitle."
        
        view?.button1.setTitle("Like Me!", for: .normal)
        view?.button1.setTitleColor(UIColor.black, for: .normal)
        view?.button1.setTitleColor(UIColor.white, for: .highlighted)
        view?.button1.selectedBackgroundColor = UIColor.red
        view?.button1.backgroundColor = UIColor.orange
        
        
        view?.button2.setTitle("No", for: .normal)
        view?.button2.setTitleColor(UIColor.black, for: .normal)
        view?.button2.setTitleColor(UIColor.white, for: .highlighted)
        view?.button2.selectedBackgroundColor = UIColor.gray
        view?.button2.backgroundColor = UIColor.white
        self.view.addSubview(view!)
    }
    
    func ratingViewDidClosed() {
        print("Rating View Closed!")
    }
    
    func ratingView(_ view: BFRatingView, didSelectButtonAt index: Int) {
        print("button clicked at \(index)")
    }

}

