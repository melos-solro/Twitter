//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Melos on 3/7/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textEntry: UITextField!
    
    @IBAction func postTweetEnd(sender: AnyObject) {
        
        if textEntry.text != nil {
            if textEntry.text?.characters.count <= 140 {
                let text = textEntry.text
                
                TwitterClient.sharedInstance.tweet(text!, success: { (tweet:Tweet) -> () in
                    print(tweet)
                    }, failure: { (error: NSError) -> () in
                        print(error.localizedDescription)
                })
                self.dismissViewControllerAnimated(true, completion: {})
            }
        }
        
    }

    @IBAction func postTweet(sender: AnyObject) {
        
        if textEntry.text != nil {
            if textEntry.text?.characters.count <= 140 {
                let text = textEntry.text
                
                TwitterClient.sharedInstance.tweet(text!, success: { (tweet:Tweet) -> () in
                    print(tweet)
                    }, failure: { (error: NSError) -> () in
                        print(error.localizedDescription)
                })
                self.dismissViewControllerAnimated(true, completion: {})
                
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
