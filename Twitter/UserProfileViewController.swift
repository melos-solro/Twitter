//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by Melos on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var username: String?
    var userHandle: String?
    var userURL: NSURL?
    var backgroundURL: NSURL?
    var userTweets: Int? = 0
    var userFollowing: Int? = 0
    var userFollowers: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = username
        navigationItem.title = "@\(userHandle)"
        print("Username: \(username)")
        print("Handle: @\(userHandle)")
        if userURL != nil {
            profileImageView.setImageWithURL(userURL!)
        }
        if backgroundURL != nil {
            backgroundImageView.setImageWithURL(backgroundURL!)
        }
        tweetsLabel.text = "\(userTweets!)"
        followersLabel.text = "\(userFollowers!)"
        followingLabel.text = "\(userFollowing!)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
