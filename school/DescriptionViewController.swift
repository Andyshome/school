//
//  DescriptionViewController.swift
//  school
//
//  Created by Home on 2018-11-13.
//  Copyright © 2018 Baraam. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    var courseCode = String()
    var courseDescription = String()
    var courseInformation = String()
    var coursePrerequisite = String()
    
    @IBOutlet weak var courseCodeLabel: UILabel!
    
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    @IBOutlet weak var courseInformationLabel: UILabel!
    
    @IBOutlet weak var coursePrerequisiteLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseCodeLabel.text = courseCode
        courseDescriptionLabel.text = courseInformation
        courseDescriptionLabel.adjustsFontSizeToFitWidth = true
        courseInformationLabel.text = courseDescription
        courseInformationLabel.adjustsFontSizeToFitWidth = true
        coursePrerequisiteLabel.text = coursePrerequisite
        courseInformationLabel.adjustsFontForContentSizeCategory = true
        coursePrerequisiteLabel.adjustsFontSizeToFitWidth = true
        coursePrerequisiteLabel.adjustsFontForContentSizeCategory = true
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
