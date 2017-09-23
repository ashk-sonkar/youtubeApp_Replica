//
//  YTableViewCell.swift
//  YouTubeReplica
//
//  Created by Ashish Kumar Sonkar on 14/09/17.
//  Copyright © 2017 Ashish Kumar Sonkar. All rights reserved.
//

import UIKit

class YTableViewCell: UITableViewCell {

    @IBOutlet weak var userpic: customImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailView: customImageView!
    @IBOutlet weak var detailText: UITextView!
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            setupProfileImage()
            
            setupThumbnailImage()
            
//            if let profileImageName = video?.channel?.profileImageName {
//                //print(profileImageName)
//                userpic.image = UIImage(named: profileImageName)
//            }
            
            if let channelName = video?.channel?.channelName, let numberOfViews = video?.numberOfViews {
                
                
                let subtitleText = "\(channelName) • \(numberOfViews) • 2 years ago "
                detailText.text = subtitleText
            }
            
                
                
            }
            
            
        }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            userpic.loadImageUsingUrl(urlString: profileImageUrl)
            
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            
            thumbnailView.loadImageUsingUrl(urlString: thumbnailImageUrl)
            
        }
    }
    }


