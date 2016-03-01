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
    
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    var tweet: Tweet! {
        didSet{
            tweetText.text = self.tweet.text as! String
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.MediumStyle
            tweetTime.text = formatter.stringFromDate(self.tweet.timestamp!)
            favoriteLabel.text = "Fav: \(self.tweet.favoritesCount)"
            retweetLabel.text = "RT: \(self.tweet.retweetCount)"
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
