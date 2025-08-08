# XToolData

XToolData ist das SwiftData-Modul für xtool. Es bietet Datenmodelle und -verwaltung für die Anwendung.

## Verwendung

```swift
import XToolData

// Initialisiere das Modell
let dataModel = XToolDataModel.shared

// Erstelle ein neues Projekt
let project = Project(name: "Mein neues Projekt")

// Füge es dem Modellkontext hinzu
let context = dataModel.modelContainer.mainContext
context.insert(project)
```

## Modelle

- `Project`: Repräsentiert ein Projekt in xtool
- `Settings`: Speichert Einstellungen der Anwendung

## Plattformunterstützung

Dieses Modul erfordert:
- iOS 17+
- macOS 14+

Da SwiftData erst in diesen Versionen verfügbar ist, können ältere Plattformen nicht unterstützt werden.