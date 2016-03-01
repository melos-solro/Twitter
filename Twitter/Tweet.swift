//
//  Tweet.swift
//  Twitter
//
//  Created by Melos on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var username: NSString?
    var userURL: NSURL?
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
            print("\(timestamp)")
        }
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        username = dictionary["user"]!["name"] as? String
        print("\(username)")
        let userURLstring = dictionary["user"]!["profile_image_url_https"] as? String
        print("\(userURLstring)")
        if userURLstring != nil {
            userURL = NSURL(string: userURLstring!)
        } else {
            userURL = nil
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}
