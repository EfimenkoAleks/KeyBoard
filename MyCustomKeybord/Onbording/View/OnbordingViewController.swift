//
//  OnbordingViewController.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 17.05.2021.
//

import UIKit
import SwiftCheckboxDialog

class OnbordingViewController: UIViewController {

    var viewModel: OnbordingViewModelProtocol!
    var router: OnbordingRouterProtocol!
    private var curentIndexForScroll = 1
    var checkboxDialogViewController: CheckboxDialogViewController!
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var onbordingButton: OnbordingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addTopView()
        self.createCollection()
        
    }
    
    enum Route: String {
              case main
           }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent //.default for black style
    }
    
    @IBAction func tapButton(_ sender: OnbordingButton) {
        
        switch curentIndexForScroll {
        case 1:
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 2:
            self.onButtonPressed()
        case 3:
            self.router.route(to: Route.main.rawValue, from: self)
        default:
            break
        }
        
        if self.curentIndexForScroll <= 2 {
            self.collection.scrollToItem(at: IndexPath(item: curentIndexForScroll , section: 0), at: .centeredHorizontally, animated: true)
            self.collection.setNeedsLayout()
            self.curentIndexForScroll += 1
        }
    }
}

extension OnbordingViewController {
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 10 * 7)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
 
        self.collection.collectionViewLayout = layout
        collection.register(UINib(nibName: "OnbordingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnbordingCollectionViewCell")
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.backgroundColor = .clear
        
        collection.dataSource = self
        collection.delegate = self
    }
    
    private func addTopView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3515330553, green: 0.6099658608, blue: 0.8699855208, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension OnbordingViewController: CheckboxDialogViewDelegate {

    //define typealias-es
    typealias TranslationTuple = (name: String, translated: String)
    typealias TranslationDictionary = [String : String]

    private func onButtonPressed() {
        // this tuple has translated key because it can use localized values in case app needs to be localized
        let tableData :[(name: String, translated: String)] = [("Gboard", "Gboard"), ("Scribens", "Scribens")]

        self.checkboxDialogViewController = CheckboxDialogViewController()
        self.checkboxDialogViewController.titleDialog = "Выберите способ ввода"
        self.checkboxDialogViewController.tableData = tableData
        self.checkboxDialogViewController.defaultValues = [tableData[0]]
        self.checkboxDialogViewController.componentName = DialogCheckboxViewEnum.countries
        self.checkboxDialogViewController.delegateDialogTableView = self
        self.checkboxDialogViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(self.checkboxDialogViewController, animated: true, completion: nil)
    }

    func onCheckboxPickerValueChange(_ component: DialogCheckboxViewEnum, values: TranslationDictionary) {
       // Результат выбора алерта
        values.forEach {
            switch $0.key {
            case "Gboard":
                print("Gboard")
            default:
                print("Scribens")
            }
        }
    }
}

extension OnbordingViewController: UICollectionViewDelegate {
    
}

extension OnbordingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.countModel()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnbordingCollectionViewCell", for: indexPath) as! OnbordingCollectionViewCell
        
     
        let model = self.viewModel.curentModel(index: indexPath.item)
        
        cell.configure(model: model)
        return cell
    }
}
