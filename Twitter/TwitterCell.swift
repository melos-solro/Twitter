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
    
    var tweet: Tweet! {
        didSet {
            tweetText.text = tweet.text as! String
            tweetTime.text = tweet.timestamp as? String
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
