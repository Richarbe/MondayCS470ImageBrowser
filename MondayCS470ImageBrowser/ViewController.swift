//
//  ViewController.swift
//  MondayCS470ImageBrowser
//
//  Created by student on 8/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleOfImage: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageIndex: UILabel!
    private let baseURLstr = "https://www.cs.sonoma.edu/~kooshesh/cs470/sf_pics/"
    private let imageNames = ["ggb_1.jpg", "bay_b_1.jpg", "city_1.jpg",
                              "ggb_2.jpg", "ggb_3.jpg", "city_2.jpg",
                              "city_3.jpg", "ggb_3.jpg", "city_4.jpg", "city_5.jpg"]
    private let imageTitles = ["Golden Gate Bridge 1", "Bay Bridge 1", "City View 1",
                               "Golden Gate Bridge 2", "Golden Gate Bridge 3", "City View 2",
                               "City View 3", "Golden Gate Bridge 3", "City View 4", "City View 5"]
    var currentIdx = 0

    @IBAction func didSwipeRight(_ sender: UISwipeGestureRecognizer) {
        print("didSipeRight")
        /*
        if(currentIdx > 0){
            currentIdx -= 1
            displayImage()
        }
        */
        if(currentIdx == 0){
            currentIdx = imageNames.count-1
        }else{
            currentIdx = currentIdx - 1
        }
        displayImage()
    }
    
    @IBAction func didSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("didSipeLeft")
        /*
        if(currentIdx < imageNames.count-1){
            currentIdx += 1
            displayImage()
        }
        */
        currentIdx = (currentIdx + 1) % imageNames.count
        displayImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayImage()
    }
    private func displayImage(){
        if let url = URL(string: baseURLstr + imageNames[currentIdx]), let data = try? Data(contentsOf: url), let image = UIImage(data: data){
            ImageView.image = image
            titleOfImage.text = imageTitles[currentIdx]
            ImageIndex.text = "\(currentIdx + 1)/\(imageNames.count)"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

