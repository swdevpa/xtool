import SwiftData
import Foundation

@Model
public final class Project {
    public var name: String
    public var createdDate: Date
    public var lastOpened: Date?
    
    public init(name: String, createdDate: Date = Date()) {
        self.name = name
        self.createdDate = createdDate
    }
}