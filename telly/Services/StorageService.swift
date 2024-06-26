import Foundation

struct StorageService {
    static let shared = StorageService()
    
    private let storageKey = "stories"
    private let onboardingKey = "hasSeenOnboarding"
    
    // Save a new story
    func add(story: StoryModel) {
        var currentStories = listAll()
        currentStories.append(story)
        saveStories(currentStories)
    }
    
    // Update a story with a specific ID
    func update(story: StoryModel) {
        var currentStories = listAll()
        if let index = currentStories.firstIndex(where: { $0.id == story.id }) {
            currentStories[index] = story
            saveStories(currentStories)
        }
    }
    
    // Remove a story with a specific ID
    func remove(byID id: String) {
        var currentStories = listAll()
        currentStories.removeAll(where: { $0.id == id })
        saveStories(currentStories)
    }
    
    // List all saved stories
    func listAll() -> [StoryModel] {
        if let savedData = UserDefaults.standard.data(forKey: storageKey),
           let decodedStories = try? JSONDecoder().decode([StoryModel].self, from: savedData) {
            return decodedStories
        }
        return []
    }
    
    // Helper function to save stories array to UserDefaults
    private func saveStories(_ stories: [StoryModel]) {
        if let encoded = try? JSONEncoder().encode(stories) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    // Set the onboarding status
    func setOnboardingSeen(_ hasSeen: Bool) {
        UserDefaults.standard.set(hasSeen, forKey: onboardingKey)
    }
    
    // Check if the user has seen the onboarding
    func hasSeenOnboarding() -> Bool {
        return UserDefaults.standard.bool(forKey: onboardingKey)
    }
}
