//
//  ContentView.swift
//  GoalsAppSwiftUI
//
//  Created by Артём Харченко on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    //Slider cвойства
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    var body: some View {
        
        NavigationView {
            VStack {
                //Slider
                ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .fill(Color("slider").opacity(0.15))
                    
                    Rectangle()
                        .fill(Color("slider"))
                        .frame(height: sliderHeight)
                }
                .frame(width: 120, height: maxHeight)
                .cornerRadius(25)
                // Конетейнер
                .overlay(
                    Text("\(Int(sliderProgress * 100 ))ml")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal,18)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 50)
//                        .offset(y: sliderHeight < maxHeight - 110 ? -sliderHeight : -maxHeight + 110 )
                        .offset(y: -sliderHeight)
                        
                    ,alignment: .bottom
                    
                )
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        //получаем drag значение
                        let translation = value.translation
                        sliderHeight = -translation.height + lastDragValue
                        
                        // ограничиваем высоту слайдера
                        sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                        
                        //негативное ограничение
                        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                        
                        //cохраняем прогресс
                        let progress = sliderHeight / maxHeight
                        
                        sliderProgress = progress <= 1.0 ? progress : 1
                        print(sliderProgress)
                        
                    }).onEnded({ value in
                        // ограничиваем высоту слайдера
                        sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                        
                        //негативное ограничение
                        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                        
                        //cохраняем последнее значение
                        lastDragValue = sliderHeight
                        
                        //cохраняем прогресс
                        let progress = sliderHeight / maxHeight
                        
                        sliderProgress = progress <= 1.0 ? progress : 1
                    }))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg").ignoresSafeArea())
            .preferredColorScheme(.dark)
            .navigationTitle("Aqua")
        }
    }
}
