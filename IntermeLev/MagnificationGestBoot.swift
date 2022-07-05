import SwiftUI

struct MagnificationGestBoot: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .fill(.mint)
                    .frame(width: 35, height: 35)
                Text("DonSabri")
                Spacer()
                Image(systemName: "text.bubble.fill")
            }
            .padding(.horizontal)
            //            Rectangle()
            //                .fill(.blue)
            //                .frame(height: 300)
            AsyncImage(url: URL(string:"https://picsum.photos/200/300"))
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                            
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding()
            Text("this picture is tooked from another world by me so don't be go for another one!!")
        }
    }
}

struct MagnificationGestBoot_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestBoot()
    }
}
