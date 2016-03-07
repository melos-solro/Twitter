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

    let twitterColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1)
    
    let mediumGreyColor = UIColor(red: 204.0/255.0, green: 214.0/255.0, blue: 221.0/255.0, alpha: 1)
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let client = TwitterClient.sharedInstance
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            self.userNameLabel.text = client.getUserName()
            self.userHandleLabel.text = client.getUserHandle()
            self.avatarImageView.setImageWithURL(client.getImageUrl())
        }) { (error:NSError) -> () in
            print(error.localizedDescription)
        }
        tableView.separatorStyle = .SingleLine
        self.tableView.contentInset = UIEdgeInsetsMake(20,0,10,0)
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.navigationController?.navigationBar.backgroundColor = twitterColor
        
        //Trying to put twitter logo in Navbar here
        //let logo = UIImage(named: "TwitterLogo_white.png")
        //self.navigationItem.titleView = UIImageView(image:logo)
        //self.navigationItem.titleView?.sizeToFit()
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.tweets != nil {
            //print("Tweets: \(self.tweets.count)")
            return self.tweets.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tweet: Tweet!
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterCell", forIndexPath: indexPath) as! TwitterCell
        tweet = self.tweets![indexPath.row]
        cell.tweet = tweet
        cell.id = tweet.id as! String
        cell.tweetText.text = tweet.text as! String
         let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        cell.tweetTime.text = formatter.stringFromDate(tweet.timestamp!)
        cell.favoriteLabel.text = "\(tweet.favoritesCount)"
        cell.retweetLabel.text = "\(tweet.retweetCount)"
        cell.userLabel.text = tweet.username as? String
        if tweet.userURL != nil {
            cell.userImageView.setImageWithURL(tweet.userURL!)
        }
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "detailSegue") {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let tweet = tweets![indexPath!.row]
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.tweet = tweet
            
        }
        if(segue.identifier == "userProfileSegue") {
            let profileViewController = segue.destinationViewController as! UserProfileViewController
            TwitterClient.sharedInstance.currentAccount({ (user: User) -> () in
                profileViewController.userHandle = user.name as? String
                profileViewController.username = user.screenname as? String
                profileViewController.userURL = user.profileUrl
                profileViewController.backgroundURL = user.backgroundURL!
//                profileViewController.userTweets = user.tweets
//                profileViewController.userFollowing = user.following
//                profileViewController.userFollowers = user.followers

                }) { (error:NSError) -> () in
                    print(error.localizedDescription)
            }

        }
    }

}
