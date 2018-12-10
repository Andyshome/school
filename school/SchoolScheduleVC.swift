

import UIKit

class SchoolScheduleVC: UIViewController {

    @IBOutlet weak var period1: UIImageView!
    @IBOutlet weak var period2: UIImageView!
    @IBOutlet weak var period3a: UIImageView!
    @IBOutlet weak var period3b: UIImageView!
    @IBOutlet weak var period3c: UIImageView!
    @IBOutlet weak var period4: UIImageView!
    
    @IBOutlet weak var period1e: UIImageView!
    @IBOutlet weak var period2e: UIImageView!
    @IBOutlet weak var period3ae: UIImageView!
    @IBOutlet weak var period3be: UIImageView!
    @IBOutlet weak var period3ce: UIImageView!
    @IBOutlet weak var period4e: UIImageView!
    
    @IBOutlet weak var period1Text: UILabel!
    @IBOutlet weak var period2Text: UILabel!
    @IBOutlet weak var period3aText: UILabel!
    @IBOutlet weak var period3bText: UILabel!
    @IBOutlet weak var period3cText: UILabel!
    @IBOutlet weak var period4Text: UILabel!
    
    @IBOutlet weak var period1Label: UILabel!
    @IBOutlet weak var period2Label: UILabel!
    @IBOutlet weak var period3aLabel: UILabel!
    @IBOutlet weak var period3bLabel: UILabel!
    @IBOutlet weak var period3cLabel: UILabel!
    @IBOutlet weak var period4Label: UILabel!

    @IBOutlet weak var ScheduleSegmentedControl: UISegmentedControl!
// create 4 different labels and it represents 4 different kinds of schedules

    
// when you load this page, make sure you see the nomal schedule
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateEverything()
        
        period1.layer.cornerRadius = 10;
        period2.layer.cornerRadius = 10;
        period3a.layer.cornerRadius = 10;
        period3b.layer.cornerRadius = 10;
        period3c.layer.cornerRadius = 10;
        period4.layer.cornerRadius = 10;
        period1e.layer.cornerRadius = 10;
        period2e.layer.cornerRadius = 10;
        period3ae.layer.cornerRadius = 10;
        period3be.layer.cornerRadius = 10;
        period3ce.layer.cornerRadius = 10;
        period4e.layer.cornerRadius = 10;
        
        
    }
    
    func animateEverything() {
        period1.frame.origin.x += 500
        period2.frame.origin.x += 500
        period3a.frame.origin.x += 500
        period3b.frame.origin.x += 500
        period3c.frame.origin.x += 500
        period4.frame.origin.x += 500
        period1e.frame.origin.x += 500
        period2e.frame.origin.x += 500
        period3ae.frame.origin.x += 500
        period3be.frame.origin.x += 500
        period3ce.frame.origin.x += 500
        period4e.frame.origin.x += 500
        period1Text.frame.origin.x += 500
        period2Text.frame.origin.x += 500
        period3aText.frame.origin.x += 500
        period3bText.frame.origin.x += 500
        period3cText.frame.origin.x += 500
        period4Text.frame.origin.x += 500
        period1Label.frame.origin.x += 500
        period2Label.frame.origin.x += 500
        period3aLabel.frame.origin.x += 500
        period3bLabel.frame.origin.x += 500
        period3cLabel.frame.origin.x += 500
        period4Label.frame.origin.x += 500
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.period1.frame.origin.x -= 500
            self.period2.frame.origin.x -= 500
            self.period3a.frame.origin.x -= 500
            self.period3b.frame.origin.x -= 500
            self.period3c.frame.origin.x -= 500
            self.period4.frame.origin.x -= 500
            self.period1e.frame.origin.x -= 500
            self.period2e.frame.origin.x -= 500
            self.period3ae.frame.origin.x -= 500
            self.period3be.frame.origin.x -= 500
            self.period3ce.frame.origin.x -= 500
            self.period4e.frame.origin.x -= 500
            self.period1Text.frame.origin.x -= 500
            self.period2Text.frame.origin.x -= 500
            self.period3aText.frame.origin.x -= 500
            self.period3bText.frame.origin.x -= 500
            self.period3cText.frame.origin.x -= 500
            self.period4Text.frame.origin.x -= 500
            self.period1Label.frame.origin.x -= 500
            self.period2Label.frame.origin.x -= 500
            self.period3aLabel.frame.origin.x -= 500
            self.period3bLabel.frame.origin.x -= 500
            self.period3cLabel.frame.origin.x -= 500
            self.period4Label.frame.origin.x -= 500
        })
    }
    
//change to different schedule with segmentControl
    @IBAction func segmentedControlPressed(_ sender: Any) {
        if ScheduleSegmentedControl.selectedSegmentIndex == 0 {
            animateEverything()
            period1Text.text = "8:47 - 10:08"
            period2Text.text = "10:12 - 11:28"
            period3aText.text = "11:32 - 12:12"
            period3bText.text = "12:12 - 12:52"
            period3cText.text = "12:52 - 1:32"
            period4Text.text = "1:36 - 2:52"
        } else if ScheduleSegmentedControl.selectedSegmentIndex == 1{
            animateEverything()
            period1Text.text = "10:05 - 10:56"
            period2Text.text = "11:00 - 11:51"
            period3aText.text = "11:55 - 12:35"
            period3bText.text = "12:35 - 1:15"
            period3cText.text = "1:15 - 1:55"
            period4Text.text = "2:00 - 2:52"
        } else if ScheduleSegmentedControl.selectedSegmentIndex == 2 {
            animateEverything()
            period1Text.text = "8:47 - 9:47"
            period2Text.text = "9:51 - 10:51"
            period3aText.text = "10:55 - 11:35"
            period3bText.text = "11:35 - 12:15"
            period3cText.text = "12:15 - 12:55"
            period4Text.text = "1:00 - 2:00"
        } else {
            animateEverything()
            period1Text.text = "8:47 - 9:56 \n 9:56 - 10:56"
            period2Text.text = "11:00 - 11:51"
            period3aText.text = "11:55 - 12:35"
            period3bText.text = "12:35 - 1:15"
            period3cText.text = "1:15 - 1:55"
            period4Text.text = "2:00 - 2:52"
        }
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
