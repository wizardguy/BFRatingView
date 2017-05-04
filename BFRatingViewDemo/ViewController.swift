//
//  ViewController.swift
//  BFRatingViewDemo
//
//  Created by Dennis on 2017/5/4.
//  Copyright © 2017年 Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BFButton1: BFRatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.BFButton1.ratingType = .LIKE
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

