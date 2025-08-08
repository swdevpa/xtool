import SwiftUI

@main
struct MyWatchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.title)
            Text("Hello, Watch!")
                .font(.headline)
        }
        .padding()
    }
}