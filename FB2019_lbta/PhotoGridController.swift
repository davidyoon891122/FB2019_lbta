//
//  PhotoGridController.swift
//  FB2019_lbta
//
//  Created by David Yoon on 2021/07/22.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "image01"), contentMode: .scaleAspectFill)
    override func setupViews() {
        backgroundColor = .green
        
        stack(imageView)
    }
}


class PhotoGridController: LBTAListController<PhotoGridCell, String>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        // items are PhotoGridCell
        self.items = ["image01", "image02", "image03", "image04", "image05"]
    }
    
    let cellspacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.items.count == 4 {
            // do 4 grid cell layout
        }
        
        
        
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 4 * cellspacing) / 2
            return .init(width: width, height: width)
        }
        
        let width = (view.frame.width - 5 * cellspacing) / 3
        
        
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellspacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 8, bottom: 0, right: 4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellspacing
    }
}


struct PhotoGridPreview: PreviewProvider {
    static var previews: some View {
        //Text("Grid preview")
        ContainerView()
    }
    
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return PhotoGridController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            //
        }
    }
}
