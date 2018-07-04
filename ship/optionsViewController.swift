//
//  optionsViewController.swift
//  ship
//
//  Created by Eric Kingstonn on 29/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//

import UIKit

class optionsViewController: UIViewController {

    @IBOutlet weak var value: UILabel!
    
    @IBAction func lum(_ sender: UISlider) {
        value.text = String(sender.value)
        UIScreen.main.brightness = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
