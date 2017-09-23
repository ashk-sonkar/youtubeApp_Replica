//
//  ViewController.swift
//  YouTubeReplica
//
//  Created by Ashish Kumar Sonkar on 17/08/17.
//  Copyright © 2017 Ashish Kumar Sonkar. All rights reserved.
//

import UIKit

//import Alamofire
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var navigate: UINavigationBar!
    @IBOutlet weak var youTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        navigationTitle.text = "Home"
        
        navigate.tintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        youTable.dataSource = self
        youTable.delegate = self
        navigationController?.navigationBar.isTranslucent = false
        menuCollectionView.dataSource  = self
        menuCollectionView.delegate = self
        navigate.isTranslucent = false
        menuCollectionView.backgroundColor = Support.usedColors.appColor
        
    }
    
     func  fetchVideos(){
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
         URLSession.shared.dataTask(with: url!) { (data, respons, error)
            
            
           in
            if error != nil{
                print(error!)
                return
            }
            do{
                
            let jason = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                
                for dictionary in jason as! [[String: AnyObject]]{
                    
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    
                    let channelDictionary = dictionary["channel"] as! [String : AnyObject]
                    let channel = Channel()
                    channel.channelName = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    video.channel = channel
                    
                    self.videos?.append(video)
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    self.youTable.reloadData()
                }
                
            }
            catch let jsonError{
                print(jsonError)
            }
                
            
            
        }.resume()
        
    }
    
        
    
//    var videos: [Video] = {
//       
//        var taylorChannel = Channel()
//        taylorChannel.channelName = "Taylor Swift"
//        taylorChannel.profileImageName = "taylor Swift dp"
//        
//        var enriqueChannel = Channel()
//        enriqueChannel.channelName = "Enrique  Iglesius"
//        enriqueChannel.profileImageName = "enrique"
//        
//        
//        var enriqueVideo = Video()
//        enriqueVideo.thumbnailImageName = "thumbnail"
//        enriqueVideo.title = "Enrique Iglesius - Duel El Corazon"
//        enriqueVideo.channel = enriqueChannel
//        
//        var taylorVideo = Video()
//        taylorVideo.thumbnailImageName = "badBlood"
//        taylorVideo.title = "Taylor Swift - Bad Blood ft. Kendrick Lamar"
//        taylorVideo.channel = taylorChannel
//        
//        return [enriqueVideo, taylorVideo]
//    }()
    
    var videos : [Video]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "youCell")  as! YTableViewCell
        
        cell.userpic.layer.cornerRadius = 28
        cell.userpic.layer.masksToBounds = true
        
        cell.thumbnailView.image = nil
        cell.userpic.image =  #imageLiteral(resourceName: "enrique")
        cell.titleLabel.text = "Enrique Iglesius - Duel El Corazon"
        cell.detailText.text = "Singer- Enrique Iglesius, 2400k view  ∙24k👍🏻"
        cell.detailText.textContainerInset = UIEdgeInsetsMake(0 , -4, 0, 0)
        cell.video = videos?[indexPath.item]
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! CollectionViewCell

        cell.iconImage.image = Support.icons.Icons[indexPath.item].withRenderingMode( .alwaysTemplate)
        cell.iconImage.tintColor = Support.usedColors.iconInactiveColour
        let initialPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: initialPath as IndexPath , animated: false, scrollPosition: .top )
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (menuView.frame.width/4), height: menuView.frame.height)
    }
    
    @IBAction func optionPressed(_ sender: UIBarButtonItem) {
        print("Option Pressed")
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        
        print("Search Pressed")
    }
    
    
    
    
}

