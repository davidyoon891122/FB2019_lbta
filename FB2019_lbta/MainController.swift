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
    
    let photosGridController = PhotoGridController()
    
    
    override func setupViews() {
        backgroundColor = .white
        // stack default is vertical stack
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel, dateLabel),
        spacing: 8).padLeft(12).padRight(12).padTop(12),
              postTextLabel,
              photosGridController.view,
              spacing: 8)
        
    }
}
// Table Header
class StoryHeader: UICollectionReusableView {
    
    let storiesContoller = StoriesController(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .yellow
        stack(storiesContoller.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class StoryPhotoCell: LBTAListCell<String> {
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Lee Ji Eun",font: .boldSystemFont(ofSize: 14), textColor: .white)
    
    override func setupViews() {
        //backgroundColor = .red
        imageView.layer.cornerRadius = 10
        
        stack(imageView)
        
        setupGradientLayer()
        stack(UIView(), nameLabel).withMargins(.allSides(8))
    }
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

class StoriesController: LBTAListController<StoryPhotoCell, String>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["image03", "image04", "image01", "image02", "image03"]
    }
    
}



// LBTAListController<Cell, Type of Cell<Generic> >
// UICollectionViewDelegateFLowLayout is for setting Rect's size
// replace LBTAListController to LBTAListHeaderController
class MainController: LBTAListHeaderController<PostCell, String, StoryHeader>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    // make some spaces on the top of First Table
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 0, right: 0)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set MainController backgroundcolor to yellow
        //view.backgroundColor = .red
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        
        self.items = ["Hello", "World", "1", "2"]
    }
    
    
    // sizeForItemAtindexPath to make size settings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
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
