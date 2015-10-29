//
//  ContentViewController.swift
//  PageViewExample
//
//  Created by elif ece arslan on 10/13/15.
//  Copyright © 2015 elif ece arslan. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    var pageIndex : Int = 0
    var titleText: String = ""
    var imageFile: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: self.imageFile)
        titleLabel.text = titleText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
