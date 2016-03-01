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
    var id: NSString?
    var retweetStatus: Bool = false
    var favoriteStatus: Bool = false
    var userHandle: NSString?
    
    init(dictionary: NSDictionary){
        id = dictionary["id_str"] as? String
        userHandle = dictionary["user"]!["screen_name"] as?String
        text = dictionary["text"] as? String
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        username = dictionary["user"]!["name"] as? String
        let userURLstring = dictionary["user"]!["profile_image_url_https"] as? String
        if userURLstring != nil {
            userURL = NSURL(string: userURLstring!)
        } else {
            userURL = nil
        }
        let fav = dictionary["favorited"] as! Int
        if fav == 1 {
            favoriteStatus = true
        } else {
            favoriteStatus = false
        }
        let retw = dictionary["retweeted"] as! Int
        if retw == 1 {
            retweetStatus = true
        } else {
            retweetStatus = false
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
