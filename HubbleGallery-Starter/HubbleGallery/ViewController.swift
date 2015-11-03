//
//  ViewController.swift
//  HubbleGallery
//
//  Created by Lubos Ilcik on 01/11/15.
//  Copyright © 2015 Touch4IT. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            self.testFetchAllObjects()
        }
    }

    func testFetchAllObjects() {
        let query = PFQuery(className: "TestObject")
        query.findObjectsInBackgroundWithBlock() { (objects, error) in
            if error == nil {
                // success
                print("fetched \(objects?.count) objects")
                for obj in objects! {
                    print("foo column: \(obj["foo"])")
                }
            } else {
                print("Error fetching objects: \(error)")
            }
        }
    }

}

