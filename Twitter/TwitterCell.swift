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

    let offRTImage = UIImage(named: "retweet-action.png") as UIImage?
    let onRTImage = UIImage(named: "retweet-action-on.png") as UIImage?
    let offFavImage = UIImage(named: "like-action.png")
    let onFavImage = UIImage(named: "like-action-on.png")
    
    
    
    var id: String?
    
    @IBAction func onReply(sender: AnyObject) {
        
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        TwitterClient.sharedInstance.favorite(id!, count: tweet.favoritesCount)
        if tweet.favoriteStatus == false {
            tweet.favoriteStatus = true
            tweet.favoritesCount++
            favoriteButton.setImage(onFavImage, forState: .Normal)
        } else {
            TwitterClient.sharedInstance.unFavorite(id!,count: tweet.favoritesCount)
            favoriteButton.setImage(offFavImage, forState: .Normal)
        }
        let fvx = tweet.favoritesCount
        favoriteLabel.text = "\(fvx)"
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(id!, count: tweet.retweetCount)
        if tweet.retweetStatus == false {
            tweet.retweetStatus = true
            tweet.retweetCount++
            retweetButton.setImage(onRTImage, forState: .Normal)
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
            }
            if tweet.favoriteStatus == true {
                favoriteButton.setImage(onFavImage, forState: .Normal)
            } else {
                favoriteButton.setImage(offFavImage, forState: .Normal)
            }
            if tweet.retweetStatus == true {
                
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
