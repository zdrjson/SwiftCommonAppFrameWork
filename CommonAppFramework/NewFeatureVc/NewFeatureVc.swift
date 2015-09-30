//
//  NewFeatureVc.swift
//  9.27_一般app基本框架(swift)
//
//  Created by 张德荣 on 15/9/27.
//  Copyright © 2015年 JsonZhang. All rights reserved.
//

import UIKit
public let ShowTabBarNotKey = "ShowTabBarNotKey"

class NewFeatureVc: UIViewController {
    private let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
    private let startBtn : UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var imageName : String? {
            return "iphone5_1"
        }

        backgroundImage.image = UIImage(named: imageName!)
        view.addSubview(backgroundImage)
        
        
        startBtn.setBackgroundImage(UIImage(named: "into_home"), forState: .Normal)
        startBtn.setTitle("开始", forState: .Normal)
        startBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        let startBtnW : CGFloat = 210.0
        let startBtnX = (UIScreen.mainScreen().bounds.width - 210 ) * 0.5
        startBtn.frame = CGRectMake( startBtnX, UIScreen.mainScreen().bounds.height - 90, startBtnW, 44)
        startBtn.addTarget(self, action: "showTabBarVc", forControlEvents: .TouchUpInside)
        view.addSubview(startBtn)
        
        
    }
    func showTabBarVc() {
         NSNotificationCenter.defaultCenter().postNotificationName(ShowTabBarNotKey, object: nil)
    }
    class func canShowNewVeresionVc() -> Bool{
        
        let versionKey = "CFBundleShortVersionString"
        let currentVersion = NSBundle.mainBundle().infoDictionary?[versionKey] as? String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionKey) as? String) ?? ""
        
        /**
        *  guard充当了警卫员一职，保证条件满足情况下，才会让你通过，否则只能else让你返回了！切记else中一定需要有返回的语句，比如return、continue、break、throw这种提早退出的关键字！！
        */
        guard currentVersion?.compare(oldVersion) == NSComparisonResult.OrderedDescending else {
             return false
        }
        NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: versionKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        return true
    }
}
