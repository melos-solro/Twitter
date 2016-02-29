//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Melos on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class TweetsViewController: UIViewController {

    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    var tweets: [Tweet]!

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TwitterClient.sharedInstance
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets:[Tweet]) -> () in
        self.tweets = tweets
        self.userNameLabel.text = client.getUserName()
        self.avatarImageView.setImageWithURL(client.getImageUrl())
            for tweet in tweets {
                print(tweet.text)
            }
            }) { (error:NSError) -> () in
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterCell", forIndexPath: indexPath) as! TwitterCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if tweets != nil {
            return tweets.count
        } else {
            return 0
        }
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
