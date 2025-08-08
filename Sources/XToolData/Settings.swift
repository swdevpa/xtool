import SwiftData
import Foundation

@Model
public final class Settings {
    public var key: String
    public var value: String
    
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}