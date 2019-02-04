//
//  CourseCodeTableViewController.swift
//  school
//
//  Created by 邱子昂 on 2018/11/13.
//  Copyright © 2018 Baraam. All rights reserved.
//

import UIKit

class CourseCodeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    var courseArray : [course] = []
    var courseFit : [course] = []
    @IBOutlet weak var myTableview: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    
    
    struct course {
        var courseCode : String
        var courseDiscription: String
        var courseInformation : String
        var coursePrerequest : String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        courseFit = courseArray
        mySearchBar.delegate = self
        myTableview.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData() {
        print("loading")
        if let wordBankFilePath = Bundle.main.path(forResource: "CourseCode", ofType: "txt") {
            print("open File")
            if let wordContent = try? String(contentsOfFile: wordBankFilePath) {
                var lines = wordContent.components(separatedBy: "\n")
                // text file last line alawys be empty, so we delete the last line
                var _ = lines.popLast()
                var linesCount = 0
                //read every line and set up the bank of the word
                for (_,line) in lines.enumerated(){
                    guard line != "" else {
                        return
                    }
                    let parts = line.components(separatedBy: "|")
                    linesCount += 1
                    print(linesCount)
                    // first part will become the answer and the second part will become the hint
                    let code = parts[0]
                    let information = parts[1]
                    let discription = parts[2]
                    let prerequest = parts[3]
                    
                    let newCource = course.init(courseCode: code, courseDiscription: discription, courseInformation: information, coursePrerequest: prerequest)
                    courseArray.append(newCource)
                    print("trying to present")
                    //for the test
                    //print("finish")
                }
            }
            
        }
        //set the count of the whole bank
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courseFit.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell")!
        cell.textLabel?.text = courseFit[indexPath.row].courseCode
        
        cell.detailTextLabel?.text = courseFit[indexPath.row].courseInformation
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        courseFit = courseArray.filter({course -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0 :
                if searchText.isEmpty { return true }
                return course.courseCode.lowercased().contains(searchText.lowercased()) || course.courseInformation.lowercased().contains(searchText.lowercased())
            default :
                return false
            }
        })
        
        myTableview.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            courseFit = courseArray
        default:
            break
        }
        myTableview.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courseCodeInformation" {
            let indexPath = myTableview.indexPathForSelectedRow!
            let course = courseFit[indexPath.row]
            let nav = segue.destination as! UINavigationController
            
            let descriptionViewController = nav.topViewController as! DescriptionViewController
            descriptionViewController.courseCode = course.courseCode
            descriptionViewController.courseDescription = course.courseDiscription
            descriptionViewController.courseInformation = course.courseInformation
            descriptionViewController.coursePrerequisite = course.coursePrerequest
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
    
}
