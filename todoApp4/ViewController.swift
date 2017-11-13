//
//  ViewController.swift
//  todoApp4
//
//  Created by Mohsin on 13/11/2017.
//  Copyright © 2017 Mohsin. All rights reserved.
//

import UIKit

class Todos {
    var title: String;
    var desc: String
    init(t:String,d:String) {
        self.title = t;
        self.desc = d;
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var todos = [Todos]()
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    var selectedIndex = -1;
    @IBAction func add(_ sender: Any) {
        let todo = Todos(t:textField.text!, d: desc.text!)
        if selectedIndex >= 0{
            if textField?.text != "" {
                todos[selectedIndex] = todo;
                textField?.text = "";
                desc?.text = "";
                TableView.reloadData()
                selectedIndex = -1
            }
        }else{
            todos.append(todo)
            TableView.reloadData()
            textField?.text = ""
            desc?.text = ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? customCell
        cell?.customTitle?.text = todos[indexPath.row].title;
        cell?.customDesc?.text = todos[indexPath.row].desc;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: indexPath.row)
            TableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked row = \(indexPath.row)")
        self.selectedIndex = indexPath.row;
        textField?.text = todos[indexPath.row].title
        desc?.text = todos[indexPath.row].desc;
    }


}

