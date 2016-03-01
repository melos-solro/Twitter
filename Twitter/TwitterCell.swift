//
//  TwitterCell.swift
//  Twitter
//
//  Created by Melos on 2/29/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TwitterCell: UITableViewCell {

    
    @IBOutlet weak var tweetText: UITextView!
    @IBOutlet weak var tweetTime: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var id: String?
    
    @IBAction func onReply(sender: AnyObject) {
        
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        TwitterClient.sharedInstance.favorite(id!, count: tweet.favoritesCount)
        let offImage = UIImage(named: "like-action.png")
        let onImage = UIImage(named: "like-action-on.png")
        if tweet.favoriteStatus == false {
            tweet.favoriteStatus = true
            tweet.favoritesCount++
            favoriteButton.setImage(onImage, forState: .Normal)
        } else {
            favoriteButton.setImage(offImage, forState: .Normal)
        }
        let fvx = tweet.favoritesCount
        favoriteLabel.text = "\(fvx)"
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(id!, count: tweet.retweetCount)
        let onImage = UIImage(named: "retweet-action-on.png") as UIImage?
        let offImage = UIImage(named: "retweet-action.png") as UIImage?
        if tweet.retweetStatus == false {
            tweet.retweetStatus = true
            tweet.retweetCount++
            retweetButton.setImage(onImage, forState: .Normal)
        } else {
            retweetButton.setImage(offImage, forState: .Normal)
        }
        let rtx = tweet.retweetCount
        retweetLabel.text = "\(rtx)"
    }
    var tweet: Tweet! {
        didSet{
            tweetText.text = self.tweet.text as! String
            handleLabel.text = ("@\(self.tweet.userHandle!)")
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.MediumStyle
            tweetTime.text = formatter.stringFromDate(self.tweet.timestamp!)
            favoriteLabel.text = "Fav: \(self.tweet.favoritesCount)"
            retweetLabel.text = "RT: \(self.tweet.retweetCount)"
            userLabel.text = self.tweet.username as? String
            if tweet.userURL != nil {
                userImageView.setImageWithURL(tweet.userURL!)
            } else {
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
