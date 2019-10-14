//
//  Utilities.swift
//  ios-movies-app
//  Created by Swathi on 05/10/2019.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation
import CoreData

class Utilities {
    public func getApiKey() -> String {
        let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        return plist?.object(forKey: "API_KEY") as! String
    }
    
    public class func findOrCreate<TypeDto, CoreDataType>(
            typeDto: TypeDto,
            with uniquenessPredicate: NSPredicate,
            coreDataTypeFactory: () -> CoreDataType,
            within context: NSManagedObjectContext
        ) -> CoreDataType where CoreDataType: NSManagedObject {
        
        let request: NSFetchRequest<CoreDataType> = CoreDataType.fetchRequest() as! NSFetchRequest<CoreDataType>
        request.predicate = uniquenessPredicate
        
        do {
            let matches = try context.fetch(request)
            let result: CoreDataType
            if matches.count > 0 {
                assert(matches.count == 1, "Utilities -- add: database inconsistency")
                result = matches[0]
            } else {
                result = coreDataTypeFactory()
            }
            return result
        } catch {
            fatalError("Error GenreDto.add: \(error)")
        }
    }

}
