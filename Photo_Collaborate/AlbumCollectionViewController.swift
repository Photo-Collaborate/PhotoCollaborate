//
//  AlbumCollectionViewController.swift
//  Photo_Collaborate
//
//  Created by Sabahet Alovic on 11/19/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class AlbumCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var posts = [PFObject]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
         return 1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]
      //  let comments = (post["comments"] as? [PFObject]) ?? []

    

        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCells") as! AlbumCells

        let user = post["author"] as! PFUser
        cell.usersName.text = user.username

        cell.AlbumNameLabel.text = post["caption"] as? String

        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.albumImage?.af_setImage(withURL: url)
           print("Cell was displayed")
        return cell 
  
       
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className:"Posts")
        query.includeKeys(["author","comments","comments.author"])
        query.limit = 20
        query.findObjectsInBackground { (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
