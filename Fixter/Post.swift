//
//  Post.swift
//  Fixter
//
//  Created by Jim & Lisa on 9/30/15.
//  Copyright (c) 2015 Jim Witheril. All rights reserved.
//

import UIKit

class Post: NSObject {
   
    var username : String!
    var post : String!
    var image : UIImage!


    class func pullData(completed: (posts: [Post], error: NSError!) -> Void)
    {
        let url = NSURL(string: "https://api.myjson.com/bins/1j0xp")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if data == nil
            {
                completed(posts: [], error: error)
            }
            else
            {
                let dictionaries = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! [NSDictionary]
                let posts = self.createPostsFromArray(array: dictionaries)
                completed(posts: posts, error: error)
            }
        }
    }


    private class func createPostsFromArray(#array: [NSDictionary]) -> [Post]
    {
        var posts = [] as [Post]
        for dict in array {
            let post = Post(dictionary: dict)
            posts.append(post)
        }
        return posts
    }

    private convenience init(dictionary: NSDictionary)
    {
        self.init()
        self.username = dictionary["username"] as! String
        self.post = dictionary["post"] as! String

        let imageString = dictionary["profilePhoto"] as! String
        let url = NSURL(string: imageString)
        let data = NSData(contentsOfURL: url!)
    }

}



