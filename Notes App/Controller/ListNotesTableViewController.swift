//
//  ListNotesTableViewController.swift
//  Notes App
//
//  Created by Aman Meena on 01/05/20.
//  Copyright © 2020 Aman Meena. All rights reserved.
//



// TODO:- 1. Remember how we added color to our app in Tip Calculator? Try to do the same with your Notes app!
// TODO:- 2. Currently, our notes are displayed in order of creation (oldest at the top). Try reversing the display so the newest notes are displayed at the top!
// TODO:- 3. Can you modify the note cell to add a truncated version of the note's content? See the Apple Notes app to see how their UI looks!


import UIKit

class ListNotesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = CoreDataHelper.fetchNotes()
    }
    
    // MARK:- Properties
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // Configure the cell...
        let note = notes[indexPath.row]
        cell.noteTitleLabel.text = note.title
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let noteToDelete = notes[indexPath.row]
            CoreDataHelper.deleteNote(note: noteToDelete)
            
            notes = CoreDataHelper.fetchNotes()
            
//            tableView.deleteRows(at: [indexPath], with: .automatic) // this method is not needed, because notes is a computed array
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "displayNote" {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? DisplayNoteViewController else {
                    return
            }
            
            destination.title = notes[indexPath.row].title
            destination.note = notes[indexPath.row]
            
        } else if identifier == "addNote" {
            
            let destination = segue.destination as! DisplayNoteViewController
            destination.title = "New Note"
            
        } else {
            print("unidentified segue")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        notes = CoreDataHelper.fetchNotes()
    }
    
}
