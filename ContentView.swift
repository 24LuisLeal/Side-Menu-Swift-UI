import SwiftUI

struct ContentView: View{

    @State var index = "Home"
    @State var show = false


    var body: some View{
        ZStack{
            (self.show ? Color.black.opacity(0.05):
            Color.clear).edgesIgnoringSafeArea(.all)


            ZStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 25){
                    HStack(spacing: 15){
                        Image("pic")
                        .resizable()
                        .frame(width:65, height: 65)

                        VStack(alignment: .leading, spacing: 12){
                            Text("Catherine")
                                .fontWeight(.bold)
                            Text("New York ,Us ")
                        }
                    }
                    .padding(.bottom, 50)

                    //Elementos del menú
                    ForEach(data, id: \.self){i in 
                        Button(action:{
                            self.index = i 
                            withAnimation(.spring()){
                                self.show.toggle()
                            }
                        }){
                            HStack{
                                Capsule()
                                .fill(self.index == i ? Color.orange: Color.clear)
                                .frame(width:5,height:30)

                                //Elemento 
                                Text(i)
                                    .padding(.leading)
                                    .foregroundColor(.black)
                            }.
                        }
                    }
                    Spacer()
                }.padding(.leading)
                .padding(.top)
                .scaleEffect(self.show ? 1 : 0)

                ZStack(alignment: .topTrailing){

                    MainView(show: self.$show, index: self.$index)
                    //Dirección y efecto de escalar
                    .scaleEffect(self.show ? 0.8 : 1)
                    .offset(x: self.show ? 150 : 0, y: self.show ? 50 : 0)
                    //Deshabilitamos el menú
                    .disabled(self.show ? true : false)

                    //Cerramos el menú 
                    Button(action: {
                        withAnimation(.spring()){
                            self.show.toggle()
                        }
                    }){
                        Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    }.padding()
                    .opacity(self.show ? 1 : 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

//Vista principal que contiene el contenido inicial
struct MainView: View{

    @Binding var show : Bool
    @Binding var index : String

    var body: some View{
        VStack(spacing: 0){
            ZStack{
                HStack{
                    Button(action: {
                        withAnimation(.spring()){
                            self.show.toggle()
                        }
                    }){
                        Image("Menu")
                            .resizable()
                            .frame(width:20,height:15)
                    }

                    Spacer()

                    Button(action: {

                    }){
                        Image("Menu")
                            .resizable()
                            .frame(width:20,height:15)
                    }
                }

                Text("Food")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical,10)

            //Vista principal
            ZStack{
                Home().opacity(self.index == "Home" ? 1 : 0)
                Orders().opacity(self.index == "Orders" ? 1 : 0)
                Wishlist().opacity(self.index == "Wishlist" ? 1 : 0)
                SavedCards().opacity(self.index == "Saved Cards" ? 1 : 0)
                Settings().opacity(self.index == "Settings" ? 1 : 0)
                Help().opacity(self.index == "Help" ? 1 : 0)
            }
        }.background(Color.white)
        .cornerRadius(15)
    }
}

//Pantalla inicial
struct Home: View{
    var body : some View{
      ScrollView(.vertical, showsIndicators: false){
          VStack(spacing : 18){
              ForEach(1...6,id: \.self){i in
                    Image("p\(i)")
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(20)
              }
          }.padding(.vertical,8)
            padding(.horizontal)
      }  
    }
}

struct Orders: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Orders")
            }
        }
    }
}

struct Wishlist: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Wishlist")
            }
        }
    }
}

struct SavedCards: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Saved Cards")
            }
        }
    }
}

struct Settings: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Settings")
            }
        }
    }
}

struct Help: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Help")
            }
        }
    }
}

//Elementos del menú
var data = ["Home","Orders","Wishlist","Saved Cards","Settings","Help"]