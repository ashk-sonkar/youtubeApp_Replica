//
//  Video.swift
//  YouTubeReplica
//
//  Created by Ashish Kumar Sonkar on 06/09/17.
//  Copyright © 2017 Ashish Kumar Sonkar. All rights reserved.
//

import UIKit

class Video: NSObject{
    
    //attributes of video
    var thumbnailImageName: String?
    var title: String?
    var channel: Channel?
    var numberOfViews = "123,456,789"
    
}
class Channel: NSObject{
    
    //Attributes of channel
    var channelName: String?
    var profileImageName: String?
}
