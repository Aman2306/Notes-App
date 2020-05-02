//
//  CoreDataHelper.swift
//  Notes App
//
//  Created by Aman Meena on 02/05/20.
//  Copyright © 2020 Aman Meena. All rights reserved.
//

import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newNote() -> Note {
            let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
            return note
    }
    
    static func saveNote() {
        do {
            try context.save()
        } catch {
            print("Coule not save: \(error.localizedDescription)")
        }
    }
    
    static func deleteNote(note: Note) {
        context.delete(note)
    }
    
    static func fetchNotes() -> [Note] {
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print("Could not fetch: \(error.localizedDescription)")
            return []
        }
    }
}
