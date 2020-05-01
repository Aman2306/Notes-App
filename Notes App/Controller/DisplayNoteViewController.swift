//
//  DisplayNoteViewController.swift
//  Notes App
//
//  Created by Aman Meena on 01/05/20.
//  Copyright © 2020 Aman Meena. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        titleTextField.text = ""
        contentTextView.text = ""
        
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        titleTextField.layer.cornerRadius = 8
        titleTextField.layer.masksToBounds = true
        
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.masksToBounds = true
    }
    
    // MARK:- Properties
    
    var note: Note?
    
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    // MARK:- IBActions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "save":
            // 1
            let noteTitle = titleTextField.text ?? ""
            let noteContent = contentTextView.text ?? ""
            let noteModificationTime = Date()
            let note = Note(title: noteTitle, content: noteContent, modificationTime: noteModificationTime)
            
            let destination = segue.destination as! ListNotesTableViewController
            destination.notes.append(note)

        case "cancel":
            print("cancel bar button item tapped")

        default:
            print("unexpected segue identifier")
        }
    }
}
