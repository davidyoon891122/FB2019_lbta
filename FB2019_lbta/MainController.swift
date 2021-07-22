//
//  MainController.swift
//  FB2019_lbta
//
//  Created by David Yoon on 2021/07/22.
//

import UIKit
// Open Source Library For Simple TableViewCell
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .blue)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11AM")
    let postTextLabel = UILabel(text: "Here is my post text")
    
    let imageViewGrid = UIView(backgroundColor: .yellow)
    
    override func setupViews() {
        backgroundColor = .white
        // stack default is vertical stack
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel, dateLabel),
        spacing: 8).padLeft(12).padRight(12).padTop(12),
              postTextLabel,
              imageViewGrid,
              spacing: 8)
        
    }
}

// LBTAListController<Cell, Type of Cell<Generic> >
// UICollectionViewDelegateFLowLayout is for setting Rect's size
class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        // set MainController backgroundcolor to yellow
        //view.backgroundColor = .red
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        
        self.items = ["Hello", "World", "1", "2"]
    }
    
    
    // sizeForItemAtindexPath to make size settings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
}

// make a canvas
import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
        // Text("main Preview 12312")
        // call ContainerView() // ignore safe area for full screen
        ContainerView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    // make ContainerView to display MainController()
    struct ContainerView: UIViewControllerRepresentable {
        
        // make a MainController view on screen
        func makeUIViewController(context: Context) -> some UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            //
        }
    }
    
}
