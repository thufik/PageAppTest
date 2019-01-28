//
//  ViewController.swift
//  PageBasedApp
//
//  Created by EquipeSuporteAplicacao on 4/16/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    
    private var viewControls : [UIViewController]!
    public var pageControl : UIPageControl!
    
    var pageViewControllerDataSource : PageViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let red = storyBoard.instantiateViewController(withIdentifier: "redViewController")
        let green = storyBoard.instantiateViewController(withIdentifier: "greenViewController")
        let blue = storyBoard.instantiateViewController(withIdentifier: "blueViewController")
        let yellow = storyBoard.instantiateViewController(withIdentifier: "yellowViewController")
        
        self.viewControls = [red,green,blue,yellow]
        
        self.pageViewControllerDataSource = PageViewControllerDataSource(viewControllers : self.viewControls)
        
        self.configPageControl()
        
        self.dataSource = self.pageViewControllerDataSource
        self.delegate = self.pageViewControllerDataSource
    
        self.setViewControllers([red], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: CONFIG PAGE CONTROL

extension PageViewController{
    private func configPageControl(){
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        self.pageControl.numberOfPages = self.viewControls.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        
        self.view.addSubview(self.pageControl)
        //parent.view.addSubview(self.pageControl)
    }
}

//extension PageViewController : changePageControl{
//    func changePageContol(index : Int) {
//        print("Tentando modificar \(self.pageControl!) no indice \(index)")
//        self.pageControl!.currentPage = index
//    }
//}



