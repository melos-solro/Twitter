//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Melos on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    var tweets: [Tweet]!

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let client = TwitterClient.sharedInstance
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            self.userNameLabel.text = client.getUserName()
            self.avatarImageView.setImageWithURL(client.getImageUrl())
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.tweets != nil {
            print("Tweets: \(self.tweets.count)")
            return self.tweets.count
        } else {
            print("No tweets found.")
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tweet: Tweet!
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterCell", forIndexPath: indexPath) as! TwitterCell
        tweet = self.tweets![indexPath.row]
        cell.tweet = tweet
        cell.tweetText.text = tweet.text as! String
        print("\(cell.tweetText.text)")
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        cell.tweetTime.text = formatter.stringFromDate(tweet.timestamp!)
        cell.favoriteLabel.text = "Fav: \(tweet.favoritesCount)"
        cell.retweetLabel.text = "RT: \(tweet.retweetCount)"
        
        return cell
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
