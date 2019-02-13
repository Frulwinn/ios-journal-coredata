//  Copyright © 2019 Frulwinn. All rights reserved.

import CoreData

enum JournalMood: String {
    case sad = "😫"
    case meh = "😐"
    case happy = "🤩"
    
    static var allMoods: [JournalMood] {
        return [.sad, .meh, .happy]
    }
}

extension Entry {
    
    @discardableResult convenience init(title: String, bodyText: String, mood: JournalMood = .meh,
                                        timestamp: Date = Date(), identifier: UUID = UUID(),
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        //identifier: String = UUID().uuidString
        self.init(context: context)
        
        self.title = title
        self.bodyText = bodyText
        self.mood = mood.rawValue
        self.timestamp = timestamp
        self.identifier = identifier
        
    }
    
    @discardableResult convenience init?(entryRepresentation: EntryRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        guard let identifier = UUID(uuidString: entryRepresentation.identifier),
            let mood = JournalMood(rawValue: entryRepresentation.mood) else { return nil }
        
        self.init(title: entryRepresentation.title, bodyText: entryRepresentation.bodyText, mood: mood, timestamp: Date(), identifier: identifier )
        
    }
    
    var entryRepresentation: EntryRepresentation? {
        guard let title = title,
        let bodyText = bodyText,
        let mood = mood,
        let timestamp = timestamp,
            let identifier = identifier?.uuidString else { return nil }
        
        let entryRepresentation = EntryRepresentation(title: title, bodyText: bodyText, mood: mood, timestamp: timestamp, identifier: identifier)
        
        return entryRepresentation
    }
}
