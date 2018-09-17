

import UIKit

class SchoolScheduleVC: UIViewController {

    @IBOutlet weak var ScheduleSegmentedControl: UISegmentedControl!
// create 4 different labels and it represents 4 different kinds of schedules
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    
// when you load this page, make sure you see the nomal schedule
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOne.isHidden = false
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        
        
    }
    

    @IBAction func segmentedControlPressed(_ sender: Any) {
        if ScheduleSegmentedControl.selectedSegmentIndex == 0 {
            labelOne.isHidden = false
            labelTwo.isHidden = true
            labelThree.isHidden = true
            labelFour.isHidden = true
        } else if ScheduleSegmentedControl.selectedSegmentIndex == 1{
            labelOne.isHidden = true
            labelTwo.isHidden = false
            labelThree.isHidden = true
            labelFour.isHidden = true
        } else if ScheduleSegmentedControl.selectedSegmentIndex == 2 {
            labelOne.isHidden = true
            labelTwo.isHidden = true
            labelThree.isHidden = false
            labelFour.isHidden = true
        } else {
            labelOne.isHidden = true
            labelTwo.isHidden = true
            labelThree.isHidden = true
            labelFour.isHidden = false
        }
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
