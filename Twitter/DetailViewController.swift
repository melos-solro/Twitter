//
//  DetailViewController.swift
//  Twitter
//
//  Created by Melos on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tweet: Tweet!
    
    @IBOutlet weak var detailRetweetCount: UILabel!
    @IBOutlet weak var deailFavoriteCount: UILabel!
    @IBOutlet weak var detailTimestamp: UILabel!
    @IBOutlet weak var detailProfileImage: UIImageView!
    @IBOutlet weak var detailRealName: UILabel!
    @IBOutlet weak var detailUserHandle: UILabel!
    @IBOutlet weak var detailTweetText: UITextView!
    
    
    @IBAction func onReply(sender: AnyObject) {
        
    }
    
    @IBAction func onLike(sender: AnyObject) {
        
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(tweet)
        
        // Do any additional setup after loading the view.
        detailProfileImage.setImageWithURL(tweet.userURL!)
        detailRealName.text = tweet.username as? String
        detailTimestamp.text = tweet.timestamp as? String
        detailTweetText.text = tweet.text as? String
        detailUserHandle.text = tweet.userHandle as? String
        detailRetweetCount.text = "\(tweet.retweetCount)"
        deailFavoriteCount.text = "\(tweet.favoritesCount)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "profileSegue") {
            let profileViewController = segue.destinationViewController as! UserProfileViewController
            profileViewController.userHandle = (tweet.userHandle as? String)!
            profileViewController.username = (tweet.username as? String)!
            profileViewController.userURL = tweet.userURL
            profileViewController.userHandle = (tweet.userHandle as? String)!
            profileViewController.userHandle = (tweet.userHandle as? String)!
            
//            profileViewController.profileImageView.image = detailProfileImage.image
//            profileViewController.tweetsLabel.text = "\(tweet.tweetNum)"
//            profileViewController.followingLabel.text = "\(tweet.following)"
//            profileViewController.followersLabel.text = "\(tweet.followers)"
            
        }
        
    }
    

}
