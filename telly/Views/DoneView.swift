//
//  DoneView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI
import GoogleMobileAds

struct DoneView: View {
    @State var story: StoryModel
    
    @State var showRewardedAd: Bool = false
    @State var showInterstitialAd: Bool = false
    
    @State var canSaveStory = false
    
    @State var height: CGFloat = 0 //Height of ad
    @State var width: CGFloat = 0 //Width of ad
    
    private func reportAchievements() {
        GameService.shared.rewardAchievement("page_01")
        GameService.shared.reportAchievement(identifier: "trilogy", progress: 1/3 * 100.00)
        GameService.shared.reportAchievement(identifier: "each_month", progress: 1/12 * 100.00)
        GameService.shared.reportAchievement(identifier: "a_to_z", progress: 1/26 * 100.00)
        
        if story.theme == "work" { GameService.shared.reportAchievement(identifier: "you_better_work", progress: 100.00) }
        if story.theme == "traveling" { GameService.shared.reportAchievement(identifier: "beachbound", progress: 100.00) }
        if story.theme == "shopping" { GameService.shared.reportAchievement(identifier: "lets_go_shopping", progress: 100.00) }
    }
    
    private func onSave() {
        HapticsService.shared.play(.heavy)
        
        if RewardedAd.shared.rewardedAd != nil {
            showRewardedAd = true
            return
        }
        
        saveStory()
    }
    
    private func saveStory() {
        withAnimation(.spring()) {
            RouterService.shared.showSheet(
                StorySheetView(story: $story) {
                    print("")
                }
                .presentationDetents([.height(300)])
                .onDisappear {
                    RouterService.shared.navigate(.home)
                }
            )
        }
        
        StorageService.shared.add(story: story)

        reportAchievements()
    }
    
    func setFrame() {
          
        //Get the frame of the safe area
        let safeAreaInsets = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero
        let frame = UIScreen.main.bounds.inset(by: safeAreaInsets)
        
        //Use the frame to determine the size of the ad
        let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(frame.width)
        
        //Set the ads frame
        self.width = adSize.size.width
        self.height = adSize.size.height
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.background)
            
            VStack {
                Spacer()
                Image("wave")
                    .resizable()
                    .scaledToFit()
            }
            
            VStack(spacing: 32) {
                Spacer()
                
                VStack {
                    Image("telly_done")
                    
                    Text("Well done!")
                        .font(.myLargeTitle)
                        .foregroundColor(.darkGrey)
                    
                    Text("You made an awesome story!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.darkGrey)
                }
                
                VStack(spacing: 16) {
                    VStack(spacing: 0) {
                        ZStack(alignment: .topTrailing) {
                            ElevatedButton(
                                backgroundColor: .darkBlue,
                                textColor: .background,
                                text: "SAVE MY STORY",
                                action: {
                                    onSave()
                                }
                            )
                            .padding(.horizontal, 24)
                            .badge(Text("Teste"))
                            .frame(maxWidth: .infinity, maxHeight: 108)
                            
                            Circle()
                                .stroke(Color.background, style: StrokeStyle(lineWidth: 6))
                                .background(Color.darkBlue)
                                .cornerRadius(100)
                                .frame(width: 50, height: 50)
                                .padding(.horizontal, 16)
                                .overlay {
                                    Image(systemName: "play.rectangle")
                                        .foregroundColor(.background)
                                        .font(.system(size: 20))
                                        .bold()
                                }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 108)
                        .onTapGesture {
                            onSave()
                        }
                        
                        Text("Watch an ad to save your story")
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.darkGrey)
                    }
                    
                    Button {
                        HapticsService.shared.play(.heavy)
                        reportAchievements()
                        
                        withAnimation(.spring()) {
                            RouterService.shared.navigate(.home)
                        }
                    } label: {
                        Text("I don't want to save my story")
                            .foregroundColor(.darkGrey)
                            .underline()
                    }
                }
                
                Spacer()
                
                BannerAd(adUnitId: AdService.bannerDoneId)
                    .frame(width: width, height: height, alignment: .center)
                    .onAppear {
                        setFrame()
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        setFrame()
                    }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            if InterstitialAd.shared.interstitialAd != nil {
                showInterstitialAd = true
            }
            
            if canSaveStory {
                saveStory()
            }
        }
        .presentRewardedAd(
            isPresented: $showRewardedAd,
            adUnitId: AdService.rewardedStoryId
        ) {
            canSaveStory = true
        }
        .presentInterstitialAd(isPresented: $showInterstitialAd, adUnitId: AdService.intersticalDoneId)
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(story: StoryModel())
    }
}
