//
//  ViewController.swift
//  Dogukan_755495_Note_p1
//
//  Created by DKU on 9.11.2019.
//  Copyright © 2019 dku. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    
    
   // var folder : [String]? ;
    var folder : [String] = [] ;
    @IBOutlet weak var tableView: UITableView!

    
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }

    
    
    

    
    //Edit function enable/disable
    @IBAction func btn_Edit(_ sender: UIBarButtonItem) {
        
        self.tableView.isEditing = !self.tableView.isEditing
        
        if(self.tableView.isEditing == true){
            sender.title = "Done" ;
        }
        
        else{
            sender.title = "Edit" ;
        }
        
    }
    
    
    
    //Add new Folder
    @IBAction func btn_Add_Folder(_ sender: UIButton) {
               
                    var textField = UITextField();
        
                    let alert = UIAlertController(title: "New Folfer", message: "Enter a name for this folder", preferredStyle: .alert);
                    
                    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                        
                        if(textField.text != ""){
                            self.folder.append(textField.text!);
                            self.tableView.reloadData();
                        }
                     
        
                    }
        
                    action.setValue(UIColor.black , forKey: "titleTextColor")
        
        
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (cancelAction) in
                        alert.dismiss(animated: true, completion: nil);
                    }
                    
                    cancelAction.setValue(UIColor.orange, forKey: "titleTextColor")
        
                    
                    alert.addAction(cancelAction)
                    alert.addAction(action);
                   
                    alert.addTextField { (field) in
                        textField = field ;
                        textField.placeholder = "Name"
        
                    }
        
                    present(alert, animated: true, completion: nil);
       
      
                
    }

    
    
    //
    //To disable bar_button automatic delete function
    //
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
          return .none
      }
      func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
          return false
      }
    
    //
    //To disable bar_button automatic delete function
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "folderCell", for: indexPath) as! FolderTableViewCell
       
        cell.folderName.text = folder[indexPath.row];
        return cell ;
    }
    
    
    
    //to move folders
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.folder[sourceIndexPath.row]
        folder.remove(at: sourceIndexPath.row)
        folder.insert(movedObject, at: destinationIndexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
               let deleteRow = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, success) in
                self.folder.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
              
               })
              

               return UISwipeActionsConfiguration(actions: [deleteRow])
           }
    
    
}

