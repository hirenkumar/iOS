//
//  ViewController.swift
//  FruitsDemoSwt
//
//  Created by ved on 31/12/14.
//  Copyright (c) 2014 ved. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.appDelegate = UIApplication.sharedApplication().delegate;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedindex: Int? = nil

    var fruit = ["Apple.jpg","banana.jpg","Orange.jpg","straberry.jpg","Apple.jpg","banana.jpg","straberry.jpg","Orange.jpg"]
    var fruitName = ["Apple", "Banaba", "Orange", "Straberry","Graps","Cherry","Berry","Pine apple"]
    var fruitDetail = ["Red Apple", "Yellow Banaba", "Orange is Orange", "Pink Straberry","Green Graps","Pink Cherry","Balck Berry","Pine apple is nice"]
    
    @IBOutlet var tvCars : UITableView?
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
////        if UIScreen.mainScreen().bounds.size.height>768
////        {
////            tvCars.rowHeight=100;
////        }
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    //tableview delegate
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        //make sure you use the relevant array sizes
//        return fruit.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        var cell : SampleTableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as SampleTableViewCell
//        if(cell == nil)
//        {
//            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as SampleTableViewCell;
//        }
////        if UIScreen.mainScreen().bounds.size.height>768
////        {
////            cell.ivWidthConstraint.constant = 100
////        }
//        let strFruitName = fruitName[indexPath.row] as String
//        let strFruitImage = fruit[indexPath.row] as String
//        let strFruitDetail = fruitDetail[indexPath.row] as String
//        
//        
//        cell.lblFruitName?.text=strFruitName
//        cell.lblFruitDetail?.text=strFruitDetail
//        cell.IvPhoto?.image=UIImage(named: strFruitImage)
//        
//        return cell as SampleTableViewCell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        selectedindex=indexPath.row as Int;
//            NSLog("index....%d", selectedindex!)
//        
//    }
//    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "DetailSegue"
        {
//            let indexPath = tvCars.indexPathForSelectedRow().row+1
            let indexPath = selectedindex;
            // NSLog("index....%d", indexPath!)
            ((segue.destinationViewController) as DetailViewController).index=indexPath
            
        }
    }
    
    class User: NSObject {
        let name: String
//        let detail: String
//        let image: String
        
        var section: Int?
        
//        init(name: String,detail: String,image: String) {
//            self.name = name
//            self.detail = detail
//            self.image = image
//        }
        init(name: String) {
            self.name = name
            
        }
    }
    
    // custom type to represent table sections
    class Section {
        var users: [User] = []
        
        func addUser(user: User) {
            self.users.append(user)
        }
    }
    
//    // raw user data
//    let names = [
//        "Clementine",
//        "Bessie",
//        "Yolande",
//        "Tynisha",
//        "Ellyn",
//        "Trudy",
//        "Fredrick",
//        "Letisha",
//        "Ariel",
//        "Bong",
//        "Jacinto",
//        "Dorinda",
//        "Aiko",
//        "Loma",
//        "Augustina",
//        "Margarita",
//        "Jesenia",
//        "Kellee",
//        "Annis",
//        "Charlena"
//    ]
    
   // let names = ["Apple", "Banaba", "Orange", "Straberry","Graps","Cherry","Berry","Pine apple"]
    
    // `UIKit` convenience class for sectioning a table
    let collation = UILocalizedIndexedCollation.currentCollation()
        as UILocalizedIndexedCollation
    
    // table sections
    var sections: [Section] {
        // return if already initialized
        if self._sections != nil {
            return self._sections!
        }
        
        // create users from the name list
        var users: [User] = names.map { name in
            var user = User(name: name)
            user.section = self.collation.sectionForObject(user, collationStringSelector: "name")
            return user
        }
        
        // create empty sections
        var sections = [Section]()
        for i in 0..<self.collation.sectionIndexTitles.count {
            sections.append(Section())
        }
        
        // put each user in a section
        for user in users {
            sections[user.section!].addUser(user)
        }
        
        // sort each section
        for section in sections {
            section.users = self.collation.sortedArrayFromArray(section.users, collationStringSelector: "name") as [User]
        }
        
        self._sections = sections
        
        return self._sections!
        
    }
    var _sections: [Section]?
    
    // table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView)
        -> Int {
            return self.sections.count
    }
    
   func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int)
        -> Int {
            return self.sections[section].users.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let user = self.sections[indexPath.section].users[indexPath.row]
            
//            let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
            
            var cell : SampleTableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as SampleTableViewCell
            if(cell == nil)
            {
                cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as SampleTableViewCell;
            }

            cell.lblFruitName?.text = user.name
            return cell
    }
    
    /* section headers
    appear above each `UITableView` section */
   func tableView(tableView: UITableView,titleForHeaderInSection section: Int)-> String {
            // do not display empty `Section`s
            if !self.sections[section].users.isEmpty {
                return self.collation.sectionTitles[section] as String
            }
            return ""
    }
    
    /* section index titles
    displayed to the right of the `UITableView` */
    func sectionIndexTitlesForTableView(tableView: UITableView)-> [AnyObject] {
            return self.collation.sectionIndexTitles
    }
    
    func tableView(tableView: UITableView,sectionForSectionIndexTitle title: String,atIndex index: Int)-> Int {
            return self.collation.sectionForSectionIndexTitleAtIndex(index)
    }
   
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
   {
    return 80.0
    
    }
    

}

