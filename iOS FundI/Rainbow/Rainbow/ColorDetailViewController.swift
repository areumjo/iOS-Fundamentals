//
//  ColorDetailViewController.swift
//  Rainbow
//
//  Created by Areum Jo on 3/10/21.
//

import UIKit

class ColorDetailViewController: UIViewController {

    // set as an optional because it has a value after an user tabs a color from the table
    var color: MyColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // view.backgroundColor = color?.color
        
        updateview()
    }
    
    
    func updateview() {
        if let cellColor = color {
            title = cellColor.name
            view.backgroundColor = cellColor.color
        }
    }

}
