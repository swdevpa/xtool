import SwiftData

// MARK: - Data Model
public struct XToolDataModel {
    public static let shared = XToolDataModel()
    
    public let modelContainer: ModelContainer
    
    private init() {
        do {
            // Für Produktionszwecke sollten Sie hier eine persistente Speicherung konfigurieren
            modelContainer = try ModelContainer(
                for: Project.self, Settings.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: true)
            )
        } catch {
            fatalError("Failed to create model container: \(error)")
        }
    }
}