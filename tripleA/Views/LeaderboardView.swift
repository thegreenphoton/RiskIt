import SwiftUI

struct LeaderboardRow: View {
    let rank: Int
    let username: String
    let score: Int
    let isCurrentUser: Bool
    let imageName: String
    
    var body: some View {
        HStack {
            Text("\(rank)")
                .foregroundColor(.white)
                .frame(width: 50, alignment: .leading)
            
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(username)
                    .foregroundColor(.white)
                Text("@username")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            Text("\(score)")
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .frame(height: 60)
        .background(isCurrentUser ? Color.green.opacity(0.2) : Color.clear)
    }
}

struct TopLeaderView: View {
    let name: String
    let isWinner: Bool
    let rank: Int
    let imageName: String
    
    var body: some View {
        VStack {
            if isWinner {
                Image(systemName: "crown.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 24))
            }
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            Text(name)
                .foregroundColor(.white)
            Text("\(rank)")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 4)
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let isSelected: Bool
    let isAlwaysGreen: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: isAlwaysGreen ? 44 : 24))
                .foregroundColor(isAlwaysGreen ? .green : (isSelected ? .green : .gray))
        }
        .frame(maxWidth: .infinity)
    }
}

struct LeaderboardView: View {
    @State private var selectedTab = 0
    let profileImages = ["profile1", "profile2", "profile3", "profile4", "profile5"]
    let names = ["Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "Elijah", "Charlotte", "William", "Sophia", "James", "Amelia", "Benjamin", "Isabella", "Lucas", "Mia", "Henry", "Evelyn", "Alexander", "Harper"]
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.green)
                .padding(.top, 16)
            // Top 3 winners
            HStack(spacing: 30) {
                TopLeaderView(name: "Jackson", isWinner: false, rank: 2, imageName: profileImages[0])
                TopLeaderView(name: "Eiden", isWinner: true, rank: 1, imageName: profileImages[1])
                TopLeaderView(name: "Emma Aria", isWinner: false, rank: 3, imageName: profileImages[2])
            }
            .padding(.vertical, 30)
            
            // Leaderboard list
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(4...104, id: \.self) { rank in
                        LeaderboardRow(
                            rank: rank,
                            username: names[rank % names.count],
                            score: 2430 - (rank * 15),
                            isCurrentUser: rank == 103,
                            imageName: profileImages[rank % profileImages.count]
                        )
                        Divider()
                            .background(Color.gray.opacity(0.3))
                    }
                }
            }
            
            // Tab bar
            HStack {
                TabBarItem(
                    icon: "house.fill",
                    isSelected: selectedTab == 0,
                    isAlwaysGreen: false,
                    action: { selectedTab = 0 }
                )
                TabBarItem(
                    icon: "person.2.fill",
                    isSelected: selectedTab == 1,
                    isAlwaysGreen: false,
                    action: { selectedTab = 1 }
                )
                TabBarItem(
                    icon: "plus.circle.fill",
                    isSelected: selectedTab == 2,
                    isAlwaysGreen: true,  // Always green
                    action: { selectedTab = 2 }
                )
                TabBarItem(
                    icon: "chart.bar.fill",
                    isSelected: selectedTab == 3,
                    isAlwaysGreen: false,
                    action: { selectedTab = 3 }
                )
                TabBarItem(
                    icon: "person.crop.circle.fill",
                    isSelected: selectedTab == 4,
                    isAlwaysGreen: false,
                    action: { selectedTab = 4 }
                )
            }
            .padding(.vertical, 10)
            .background(Color.black)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    LeaderboardView()
}

