import XCTest
import SwiftData
@testable import XToolData

final class XToolDataTests: XCTestCase {
    var modelContainer: ModelContainer!
    
    override func setUp() async throws {
        // Für Tests verwenden wir eine In-Memory-Datenbank
        modelContainer = try ModelContainer(
            for: Project.self, Settings.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
    }
    
    func testProjectCreation() throws {
        let project = Project(name: "Test Project")
        XCTAssertEqual(project.name, "Test Project")
        XCTAssertNotNil(project.createdDate)
    }
    
    func testSettingsCreation() throws {
        let settings = Settings(key: "theme", value: "dark")
        XCTAssertEqual(settings.key, "theme")
        XCTAssertEqual(settings.value, "dark")
    }
    
    func testModelContainerCreation() throws {
        let dataModel = XToolDataModel.shared
        XCTAssertNotNil(dataModel.modelContainer)
    }
}