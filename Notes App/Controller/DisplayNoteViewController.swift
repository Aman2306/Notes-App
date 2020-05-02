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
        titleTextField.layer.borderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        titleTextField.layer.cornerRadius = 8
        titleTextField.layer.masksToBounds = true
        
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.masksToBounds = true
        
        
        // if this below functionality were to be implemented in viewDidLoad, it won't work.
        if let note = note { // if note is not nil
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            titleTextField.text = ""
            contentTextView.text = ""
        }
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
        case "save" where note != nil:
            
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
            
            // TODO: - don't change the modification time, if no new change is made in the note
            note?.modificationTime = Date()
            
            CoreDataHelper.saveNote()
            
        case "save" where note == nil:
            
            let newNote = CoreDataHelper.newNote()
            
            newNote.title = titleTextField.text ?? ""
            newNote.content = contentTextView.text ?? ""
            newNote.modificationTime = Date()
                        
            CoreDataHelper.saveNote()
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
