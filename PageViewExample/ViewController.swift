//
//  ViewController.swift
//  PageViewExample
//
//  Created by elif ece arslan on 10/13/15.
//  Copyright © 2015 elif ece arslan. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPageViewControllerDataSource,
    UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    var pageTitles: Array<String> =  ["First Scene","Second Scene", "Third Scene"]
    var images: Array<String> =  ["firstdinner_1","firstdinner_2","firstdinner_3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier(
            "PageViewController") as? UIPageViewController
        
        if let pageViewController_ = pageViewController {

            // Setup the page view controller.
            pageViewController_.dataSource = self
            let initialVC = self.viewcontrollerAtIndex(0) as ContentViewController
            let contentControllers = [initialVC]
            pageViewController_.setViewControllers(contentControllers, direction: .Forward,
                animated: true, completion: nil)
            pageViewController_.view.frame = CGRectMake(0, 30.0, self.view.frame.width,
                self.view.frame.height - 30)

            // Adding a child view controller.
            addChildViewController(pageViewController_)
            view.addSubview(pageViewController_.view)
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Utility function to create a content view controller and set the image.
    func viewcontrollerAtIndex(index: Int) -> ContentViewController{
//        if ((pageTitles.count == 0) || (index >= pageTitles.count)) {
//            return ContentViewController!()
//        }
        let contentVC = self.storyboard?.instantiateViewControllerWithIdentifier(
            "ContentViewController") as! ContentViewController
        contentVC.imageFile = images[index] as String
        contentVC.titleText = pageTitles[index] as String
        contentVC.pageIndex = index
        return contentVC
    }
    
    // MARK: Pageviewcontroller datasource
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentViewController
        var index = contentVC.pageIndex as Int
        if index == 0 || index == NSNotFound{
            return nil
        }
        index--
        return self.viewcontrollerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentViewController
        var index = contentVC.pageIndex as Int
        if index == NSNotFound{
            return nil
        }
        if index == pageTitles.count-1 {
            return nil
        }
        index++
        return self.viewcontrollerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}