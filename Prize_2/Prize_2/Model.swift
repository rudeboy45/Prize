//
//  Model.swift
//  Prize_2
//
//  Created by Evgen Classik on 13.07.2021.
//

import Foundation

//class ToAddItems:NSObject{
//    let names:[String] = ["Tiramisu"]
//    let prices:[Double] = [10.0]
//    let isCompleted:[Bool] = [true]
//    }

var ToAddItems: [[String: Any]] {

    set {
        UserDefaults.standard.set(newValue, forKey: "ToAddDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToAddDataKey") as? [[String: Any]] {
        return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    ToAddItems.append(["name": nameItem, "isCompleted": isCompleted])
}

func removeItem(at index: Int) {
    ToAddItems.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToAddItems[fromIndex]
    ToAddItems.remove(at: fromIndex)
    ToAddItems.insert(from, at: toIndex)
}

func changeState(at item: Int) -> Bool {
    ToAddItems[item]["isCompleted"] = !(ToAddItems[item]["isCompleted"] as! Bool)
    return ToAddItems[item]["isCompleted"] as! Bool
}
