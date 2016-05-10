//
//  ViewController.swift
//  SampleProject
//
//  Created by Alvin George on 5/5/16.
//  Copyright © 2016 Alvin George. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    private var pageViewController: UIPageViewController?
    private let contentImages = ["ic_house.png","ic_refresh.png","ic_search.png"];

    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControl()
    }
    override func viewWillAppear(animated: Bool) {
    }
    private func createPageViewController() {

        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self

        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }

        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }

    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.redColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }


    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        let itemController = viewController as! PageItemController

        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex!-1)
        }

        return nil
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        let itemController = viewController as! PageItemController

        if itemController.itemIndex!+1 < contentImages.count {
            return getItemController(itemController.itemIndex!+1)
        }

        return nil
    }
    private func getItemController(itemIndex: Int) -> PageItemController? {

        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]

            return pageItemController
        }
        
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
