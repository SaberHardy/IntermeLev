import SwiftUI

/*.We will implement the MVVM and also
 (Sort, Filter, and Map data arrays)
 */
struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModelView: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    
    init() {
        getUserModel()
        updateFilterArray()
    }
    
    func updateFilterArray() {
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
        // The function above is exactly the same as this line
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
//
        /** Filter data **/
        
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
        filteredArray = dataArray.filter({ $0.isVerified })
        
    }
    
    func getUserModel() {
        let user1 = UserModel(name: "Saber", points: 3, isVerified: true)
        let user2 = UserModel(name: "Khiro", points: 4, isVerified: true)
        let user3 = UserModel(name: "Mahdi", points: 2, isVerified: false)
        let user4 = UserModel(name: "Khali", points: 5, isVerified: true)
        let user5 = UserModel(name: "Mama", points: 5, isVerified: false)
        
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5])
    }
}


struct ArraysTechs: View {
    @State var vm: ArrayModelView = ArrayModelView()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading ,spacing:20) {
                ForEach(vm.filteredArray) { item in
                    HStack {
                        Text(item.name)
                            .foregroundColor(.white)
                            
                        Text("\(item.points)")
                        Spacer()
                        Image(systemName: item.isVerified ? "flame.fill" : "flame")
                            .foregroundColor(item.isVerified ? Color.red : Color.gray)
                    }
                    .padding()
                    .font(.title)
                    .background(Color.blue.cornerRadius(20))
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ArraysTechs_Previews: PreviewProvider {
    static var previews: some View {
        ArraysTechs()
    }
}
