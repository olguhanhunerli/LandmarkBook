//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Olguhan Hünerli on 5.12.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedLandmarkName = ""
    var selectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = selectedLandmarkName
        images.image = selectedImage
        // Do any additional setup after loading the view.
    }
    

    

}
