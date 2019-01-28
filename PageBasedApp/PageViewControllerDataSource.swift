//
//  PageViewControllerDataSource.swift
//  PageBasedApp
//
//  Created by EquipeSuporteAplicacao on 4/17/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit

class PageViewControllerDataSource: NSObject, UIPageViewControllerDataSource {
    
    private var viewControllers : [UIViewController]
    
    init(viewControllers : [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.viewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = index + 1
        
        if nextIndex == self.viewControllers.count{
            return self.viewControllers.first
        }else{
            return self.viewControllers[nextIndex]
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.viewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = index - 1
        
        if previousIndex < 0{
            return self.viewControllers.last
        }else{
            return self.viewControllers[previousIndex]
        }
    }
}

extension PageViewControllerDataSource : UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard let pageContentViewController = pageViewController.viewControllers?.first else{
            return
        }
        
        guard let index = self.viewControllers.index(of: pageContentViewController) else{
            return
        }
        
        //self.changePageControlDelegate.changePageContol(index: index)
    }
}
