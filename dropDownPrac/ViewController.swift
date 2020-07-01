//
//  ViewController.swift
//  dropDownPrac
//
//  Created by 권성우 on 2020/06/10.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    var dropDown : DropDown?
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dropDown = DropDown()
        
        // The view to which the drop down will appear on
        dropDown!.anchorView = button // UIView or UIBarButtonItem
        // Top of drop down will be below the anchorView
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!)
        
        // The list of items to display. Can be changed dynamically
        dropDown!.dataSource = ["Car", "Motorcycle", "Truck"]
        
        button.addTarget(self, action: #selector(dropDownBtn), for: .touchUpInside)
        dropDown?.selectionAction = { [unowned self] (index : Int, item : String) in
            self.button.setTitle(item, for: .normal )
        }
    }
    @objc func dropDownBtn(){
        dropDown?.show()
    }

}

