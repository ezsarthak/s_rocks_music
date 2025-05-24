# s_rocks_music

A new Flutter project.

### Core Application Structure

```
lib/
├── main.dart                    # Application entry point
├── firebase_options.dart        # Firebase configuration and options
├── core/                        # Core functionality and shared components
│   ├── services/               # Business logic services (API, database, etc.)
│   └── utils/                  # Helper functions and utilities
├── data/                       # Data layer
│   └── models/                 # Data models and entities
├── viewmodels/                 # Business logic and state management
├── views/                      # UI layer - screens and pages
│   ├── home_screen/           # Home screen components
│   └── music_service_detail_screen/  # Music service detail screen
└── widgets/                    # Reusable UI components
