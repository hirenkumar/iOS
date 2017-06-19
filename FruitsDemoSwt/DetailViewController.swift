//
//  DetailViewController.swift
//  Sample1
//
//  Created by TheAppGuruz-New-6 on 17/07/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    
    var fruitName = ["Apple", "Banaba", "Orange", "Straberry","Graps","Cherry","Berry","Pine apple"]
    var fruitDetail = ["Red Apple", "Yellow Banaba", "Orange is Orange", "Pink Straberry","Green Graps","Pink Cherry","Balck Berry","Pine apple is nice"]
    
     var index: Int?=nil
     var tilte: String? = nil
     var tilteDetail: String? = nil
    
    @IBOutlet var lblFruitName : UILabel?=nil
    @IBOutlet var lblFruitDetail : UILabel?=nil
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
       // let strImageName="\(index).jpg"
        
        // NSLog("index....%d", index!)
        
        
        let strFruitName = fruitName[1] as String
        let strFruitDetail = fruitDetail[1] as String
        
        lblFruitName?.text=strFruitName
         lblFruitDetail?.text=strFruitDetail
        //self.ivDisplayImage.image=UIImage(named : "\(index).jpg")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(sender : AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
