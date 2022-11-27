//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Ogün Birinci on 27.11.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveNote(model: CoreDataModel) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "CoreDataWeather", in: managedContext)!
        let weather = NSManagedObject(entity: entity, insertInto: managedContext)
        weather.setValue(model.temperature, forKeyPath: "temperature")
        weather.setValue(model.wind, forKeyPath: "wind")
        weather.setValue(model.icon, forKeyPath: "icon")
        weather.setValue(model.name, forKeyPath: "name")
        weather.setValue(model.time, forKeyPath: "time")
        weather.setValue(model.weatherDescription, forKeyPath: "weatherDescription")

        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    func getNotes() -> [CoreDataModel] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreDataWeather")
        do {
            let weathers = try managedContext.fetch(fetchRequest)
            return weathers as! [CoreDataModel]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
}
