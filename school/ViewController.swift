import GoogleAPIClientForREST
import GoogleSignIn
import UIKit

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate, UITableViewDataSource, UITableViewDelegate {
 
    // Outlet for my segmented Control
    @IBOutlet weak var mySegment: UISegmentedControl!
   
    // Outlet for the Daily annoucements UITableView
    @IBOutlet weak var dailyTableView: UITableView!
    // Outlet for the Long Term annoucements UITableView
    @IBOutlet weak var longTermTableView: UITableView!
    // Outlet for the Cafe Specials annoucements UITableView
    @IBOutlet weak var cafeSpecialsTableView: UITableView!
   
    //Creating a label for any messages that need to be displayed
    @IBOutlet weak var labelMessages: UILabel!

    @IBOutlet weak var signInBlock: UIImageView!
    
    // Array that will hold the daily annoucements
    var dailyArray: [String] = []
    // Array that will hold the Long Term annoucements
    var longTermArray: [String] = []
    // Array that will hold the cafe Specials annoucements
    var cafeSpecialsArray: [String] = []
    //create a refreshcontrol to repleace a refresh button
    let refreshControl = UIRefreshControl()
    // If modifying these scopes, delete your previously saved credentials by resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLRAuthScopeSheetsSpreadsheetsReadonly]
    private let service = GTLRSheetsService()
    
    let signInButton = GIDSignInButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
        
    
        
        // Add the sign-in button.
        view.addSubview(signInButton)
        
        pressingSegments()
        
        refreshControl.addTarget(self, action: #selector(refreshData),
                                 for: .valueChanged)
        
        dailyTableView.addSubview(refreshControl)
        
        // code to change location of sign in button
        signInButton.center = view.center
        
        
    }
    
    
    @IBAction func testButton(_ sender: Any) {
       // print(longTermArray)
       // print(cafeSpecialsArray)
    }
    //create a objc function for the selector to use to refresh the data
    @objc func refreshData() {
        dailyArray.removeAll()
        listDailyAnnoucements()
        longTermArray.removeAll()
        listLongTermAnnoucements()
        cafeSpecialsArray.removeAll()
        listCafeSpecialsAnnoucements()
        self.refreshControl.endRefreshing()
    }
    
    @IBAction func mySegmentPressed(_ sender: Any) {
       pressingSegments()
    }
    

    // setting the number of cells to the number of elements in the daily array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if tableView.tag == 1 {
            return(dailyArray.count)
        } else if tableView.tag == 2 {
            return(longTermArray.count)
        } else {
            return(cafeSpecialsArray.count)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCustomCellTableViewCell

        if tableView.tag == 1 {
            cell.labelDaily.text = dailyArray[indexPath.row]
        } else if tableView.tag == 2 {
            cell.labelLongTerm.text = longTermArray[indexPath.row]
        } else {
            cell.labelCafeSpecials.text = cafeSpecialsArray[indexPath.row]
        }

        return cell
    }
    
   
    

    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )

        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    


    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        var emailUsedByStudent: String = ""
        
        if (error) != nil {
            //showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            self.signInButton.isHidden = true
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            listDailyAnnoucements()
            listLongTermAnnoucements()
            listCafeSpecialsAnnoucements()
            emailUsedByStudent = user.profile.email
            print("this id is the following \(emailUsedByStudent)")
        
        }
        
        if emailUsedByStudent.contains("@tcdsb.ca") {
            print("worked")
            mySegment.isEnabled = true
            
        } else {
           
            print("before")
            
            dailyTableView.isHidden = true
            longTermTableView.isHidden = true
            cafeSpecialsTableView.isHidden = true
            mySegment.isEnabled = false
            
            GIDSignIn.sharedInstance().signOut()
            GIDSignIn.sharedInstance().disconnect()
            
            // Add the sign-in button.
            view.addSubview(signInButton)
            
            // code to change location of sign in button
            signInButton.center = view.center
         
            print("after")
            showAlert(title: "Must use a TCDSB email" , message: "please clear the app from memory and re-launch it to sign in with tcdsb e-mail")
        }
        
        
        
    }
    
    
    
    // Process the response and display output
    @objc func displayResultWithTicket(ticket: GTLRServiceTicket, finishedWithObject result : GTLRSheets_ValueRange, error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        let rows = result.values!
        if rows.isEmpty {
            labelMessages.text = "No data found."
            return
        }
        
        for row in rows {
            let name = row[1]
            let annoucements = row[2]
            dailyArray.append("\(name): \(annoucements)\n")
            
        }
        dailyArray.reverse()
        dailyTableView.reloadData()
    }
    
    
    // for long term
    @objc func displayResultWithTicketLongTerm(ticket: GTLRServiceTicket, finishedWithObject result : GTLRSheets_ValueRange, error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        let rows = result.values!
        if rows.isEmpty {
            labelMessages.text = "No data found."
            return
        }
        
        for row in rows {
            let name = row[1]
            let annoucements = row[2]
            longTermArray.append("\(name): \(annoucements)\n")
            
        }
        longTermArray.reverse()
        longTermTableView.reloadData()
        
    }
    
    // for Cafe Specials
    @objc func displayResultWithTicketCafeSpecials(ticket: GTLRServiceTicket, finishedWithObject result : GTLRSheets_ValueRange, error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        let rows = result.values!
        if rows.isEmpty {
            labelMessages.text = "No data found."
            return
        } else {
            
        }
        
        for row in rows {
            let name = row[1]
            let annoucements = row[2]
            cafeSpecialsArray.append("\(name): \(annoucements)\n")
            
        }
        cafeSpecialsArray.reverse()
        cafeSpecialsTableView.reloadData()
        
    }
    

    // Display the daily spreadsheet:
    // https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
    func listDailyAnnoucements() {
        let spreadsheetId = "1aHFMi0PBcZnNWCp384Grt--rxYHpvFAG8F5s-hon-C8"
        let range = "Form Responses 1!A2:C"
        let query = GTLRSheetsQuery_SpreadsheetsValuesGet.query(withSpreadsheetId: spreadsheetId, range:range)
        service.executeQuery(query, delegate: self, didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    // Display the Long Term spreadsheet:
    // https://docs.google.com/spreadsheets/d/1QvQFLhSy5gw712dXW3osUrFFXgfIEzaiuw08TC-Nmgg/edit#gid=1922002077
    func listLongTermAnnoucements() {
        let spreadsheetId = "1QvQFLhSy5gw712dXW3osUrFFXgfIEzaiuw08TC-Nmgg"
        let range = "Form Responses 1!A2:C"
        let query = GTLRSheetsQuery_SpreadsheetsValuesGet.query(withSpreadsheetId: spreadsheetId, range:range)
        service.executeQuery(query, delegate: self, didFinish: #selector(displayResultWithTicketLongTerm(ticket:finishedWithObject:error:)))
    }
    
    // Display the Long Term Cafe Specials:
    // https://docs.google.com/spreadsheets/d/1EpoljIexXIUOJ8XtQlilPNBjHWqaU9F4nA-EsKQSwIY/edit#gid=1958324540
    func listCafeSpecialsAnnoucements() {
        let spreadsheetId = "1EpoljIexXIUOJ8XtQlilPNBjHWqaU9F4nA-EsKQSwIY"
        let range = "Form Responses 1!A2:C"
        let query = GTLRSheetsQuery_SpreadsheetsValuesGet.query(withSpreadsheetId: spreadsheetId, range:range)
        service.executeQuery(query, delegate: self, didFinish: #selector(displayResultWithTicketCafeSpecials(ticket:finishedWithObject:error:)))
    }
    
    // if statement for choosing which tablview to show based on segment selection
    func pressingSegments () {
        if mySegment.selectedSegmentIndex == 0 {
            dailyTableView.isHidden = false
            longTermTableView.isHidden = true
            cafeSpecialsTableView.isHidden = true
        } else if mySegment.selectedSegmentIndex == 1{
            dailyTableView.isHidden = true
            longTermTableView.isHidden = false
            cafeSpecialsTableView.isHidden = true
        } else {
            dailyTableView.isHidden = true
            longTermTableView.isHidden = true
            cafeSpecialsTableView.isHidden = false
        }
    }
    
    
}
