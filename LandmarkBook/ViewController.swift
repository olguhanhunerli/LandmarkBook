//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Olguhan Hünerli on 5.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    var landmarkNames = [String] ()
    var imageList = [UIImage]()
    var chosenLandmarkName = ""
    var choseimage = UIImage()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Greatwall")
        landmarkNames.append("Kremlin towers")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj mahal")
        
        
        imageList.append(UIImage(named: "Colosseum-Rome-Italy.jpg")!)
        imageList.append(UIImage(named: "greatwall.jpg")!)
        imageList.append(UIImage(named: "Kremlintowers.jpg")!)
        imageList.append(UIImage(named: "stonhenge.jpg")!)
        imageList.append(UIImage(named: "tajmahal.jpg")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        choseimage = imageList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedImage = choseimage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.imageList.remove(at:   indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

