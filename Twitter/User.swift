//
//  User.swift
//  Twitter
//
//  Created by Melos on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    var backgroundURL: NSURL?
    var tweets: Int? = 0
    var following: Int? = 0
    var followers: Int? = 0
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        let backgroundUrlString = dictionary["profile_background_image_url_https"] as? String
        if let backgroundUrlString = backgroundUrlString {
            backgroundURL = NSURL(string: backgroundUrlString)
        }
        tweets = dictionary["statuses_count"] as? Int
        following = dictionary["friends_count"] as? Int
        followers = dictionary["follower_count"] as? Int
        tagline = dictionary["description"] as? String
    }
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = NSUserDefaults.standardUserDefaults()
            
                let userData = defaults.objectForKey("currentUser") as? NSData
        
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary )
                }
            }
        
            return _currentUser
        }
        
        set(user) {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUser")
            } else {
                defaults.setObject(nil, forKey: "currentUser")
            }
            
            defaults.synchronize()
        }
        
    }
    
}
