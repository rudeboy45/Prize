//
//  TableViewController.swift
//  Prize_2
//
//  Created by Evgen Classik on 13.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var totalCostLabel: UILabel!
    
    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Prize", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name Prize"
        }
        let alertAction1 = UIAlertAction(title: "cancel", style: .default)
        { (alert) in
        }
        let alertAction2 = UIAlertAction(title: "create", style: .cancel)
        { (alert) in
//            добавить новую запись
            let newItem = alertController.textFields![0].text
            addItem(nameItem: newItem!)
            self.tableView.reloadData()
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()  //(for view cell) 15.07
//        tableView.backgroundColor = UIColor
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToAddItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let currentItem = ToAddItems[indexPath.row]
        let priceItem = 20.0
        
        cell.nameCell.text = currentItem["name"] as? String
        cell.costCell.text = "Price: $\(priceItem)"
        totalCostLabel.text = string("Total cost: $", for: priceItem + (20.0))
//        cell.textLabel?.text = currentItem["name"] as? String
//        cell.textLabel?.text = currentItem["price"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func string(_ prefix:String, for price:Double) -> String{
        let priceString = String(format: "%2.2f", price)
        return prefix + priceString
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//            cell.costCell?.text = "Price: $\(price)"
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//            cell.costCell?.text = nil
        }

    }
    

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()
    }
        


//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if tableView.isEditing {
//            return .none
//        } else {
//            return .delete
//        }
////        по умолчанию возвращает delete а мы уберем
//    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
//        Следует ли нам смещать эленемт ячейки во время редактирования?
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
