//
//  MyTabBarVc.swift
//  9.27_一般app基本框架(swift)
//
//  Created by 张德荣 on 15/9/27.
//  Copyright © 2015年 JsonZhang. All rights reserved.
//

import UIKit

class MyTabBarVc: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildVcs()
    }
    //设置子控制器
    private func setupChildVcs() {
       //FirstVc 
        setupChildVc(vc: FirstVc(), title: "First", imageName: "recommendation_1", selectedImageName: "recommendation_2")
        //SecondVc
        setupChildVc(vc: SecondVc(), title: "Second", imageName: "broadwood_1", selectedImageName: "broadwood_2")
        //ThirdVc
        setupChildVc(vc: ThirdVc(), title: "Third", imageName: "classification_1", selectedImageName: "classification_2")
        //FourthVc
        setupChildVc(vc: FourthVc(), title: "Fourth", imageName: "my_1", selectedImageName: "my_2")
    }
    
    private func setupChildVc(vc vc :UIViewController,title : String, imageName : String, selectedImageName : String){
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.title = title
        addChildViewController(UINavigationController(rootViewController: vc))
    }

  
}
