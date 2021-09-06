//
//  ViewController.swift
//  instagram
//
//  Created by Christian Willson on 31/08/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Storyboard {
        static let photoCell = "PhotoCollectionViewCell"
    }
    
    struct sizeData {
        static var orientation: String = "Unknown"
        static var imageSize: CGFloat = 0
    }
    
    var myImageData = ["image1", "image2", "image3"]
    
    @IBOutlet weak var mainImageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollPageControl: UIPageControl!
    
    @IBOutlet weak var descTextLabel: UILabel!
    var currentPage = 0
    
    
    //dipanggil setelah kita membuka halaman tersebut
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        //dummy text
        descTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla."
        
        let size = UIScreen.main.bounds.size
        if size.width < size.height {
            sizeData.orientation = "Portrait"
        } else {
            sizeData.orientation = "Landscape"
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoCollectionView.collectionViewLayout.invalidateLayout()
    }


}

// karena di dalam view controller terdapat collection view, maka kita extend kelas 'ViewController' dan memberi sub-class 'UICollectionViewDataSource'
extension ViewController: UICollectionViewDataSource {
    //berikut adalah kedua fungsi wajib pada UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoCollectionViewCell
        
        cell.imageName = myImageData[indexPath.item]
        
        return cell
    }
    
    
    
    
}

//DelegateFlowLayout untuk mengatur posisi-posisi / ukuran cell di dalam CollectionViewLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //fungsi untuk me-refresh halaman saat di-rotate
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            sizeData.orientation = "Landscape"
        } else {
            sizeData.orientation = "Portrait"
        }
    }
    
    //untuk mengatur ukuran cell / objek di dalam CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if sizeData.orientation == "Landscape" {
            sizeData.imageSize = collectionView.frame.width / 2
            scrollPageControl.numberOfPages = 2
            mainImageHeightConstraint.constant = sizeData.imageSize + 50
        } else if sizeData.orientation == "Portrait" {
            sizeData.imageSize = collectionView.frame.width
            scrollPageControl.numberOfPages = 3
            mainImageHeightConstraint.constant = sizeData.imageSize + 40
        }
        return CGSize(width: sizeData.imageSize, height: sizeData.imageSize)
    }
    
    //untuk memberi tahu pageControl sebenarnya sekarang sedang di halaman ke-berapa
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if sizeData.orientation == "Landscape" {
            let width = scrollView.frame.width / 2
            currentPage = Int((scrollView.contentOffset.x) / width)
            print(currentPage)
            scrollPageControl.currentPage = currentPage
            
        } else if sizeData.orientation == "Portrait" {
            let width = scrollView.frame.width
            currentPage = Int((scrollView.contentOffset.x) / width)
            print(currentPage)
            scrollPageControl.currentPage = currentPage
        }
        
       
    }
    
    
    
}

