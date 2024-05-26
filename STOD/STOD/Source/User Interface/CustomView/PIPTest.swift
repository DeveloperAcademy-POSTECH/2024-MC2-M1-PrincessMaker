//
//  PIPTest.swift
//  STOD
//
//  Created by 이윤학 on 5/27/24.
//


import SwiftUI
import UIPiPView
import SnapKit
import Then


struct PIPViewRepresentable: UIViewControllerRepresentable {
    @Binding var showPipView: Bool
    @Binding var selectedCloth: Cloth?
    
    func makeUIViewController(context: Context) -> PIPViewController {
        let pipView = PIPViewController()
        pipView.selectedCloth = selectedCloth
        return pipView
    }
    
    func updateUIViewController(_ uiViewController: PIPViewController, context: Context) {
        uiViewController.selectedCloth = selectedCloth
        if selectedCloth == nil {
            uiViewController.pipView.stopPictureInPicture()
        }
        if !showPipView && uiViewController.pipView.isPictureInPictureActive() {
            uiViewController.pipView.stopPictureInPicture()
        } else if showPipView {
            context.coordinator.startPIP(for: uiViewController)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: PIPViewRepresentable
        init(_ parent: PIPViewRepresentable) {
            self.parent = parent
        }
        
        func startPIP(for viewController: PIPViewController) {
            viewController.updateView()
            viewController.startPIP()
        }
    }
}

class PIPViewController: UIViewController {
    
    var selectedCloth: Cloth?
    
    private let imageView = UIImageView()
    private let sizeLabel = UILabel()
    private let labelBackground = UIView()
    private let stodImageView = UIImageView(image: .STOD)
    let pipView = UIPiPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateView()
    }
    
    private func setupUI() {
        view.do {
            $0.backgroundColor = .black
        }
        
        pipView.do {
            $0.backgroundColor = .black
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        stodImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
        
        labelBackground.do {
            $0.backgroundColor = UIColor.stodGray200.withAlphaComponent(0.6)
            $0.layer.cornerRadius = 12
        }
        
        sizeLabel.do {
            $0.font = UIFont(name: "Pretendard-Bold", size: 12)
            $0.textColor = UIColor.stodWhite
            //            $0.numberOfLines = 1
            //            $0.adjustsFontSizeToFitWidth = true
            //            $0.minimumScaleFactor = 0.5
        }
        
        view.addSubview(pipView)
        pipView.addSubview(imageView)
        imageView.addSubview(labelBackground)
        labelBackground.addSubview(sizeLabel)
        imageView.addSubview(stodImageView)
        
        pipView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        labelBackground.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview().inset(6)
        }
        
        stodImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().offset(24)
            $0.width.equalTo(30)
        }
    }
    
    func updateView() {
        if let cloth = selectedCloth {
            imageView.image = cloth.numericalUIImage
            sizeLabel.text = cloth.size
        } else {
            imageView.image = .colorCharacter
            sizeLabel.text = "기본 선택"
        }
    }
    
    func startPIP() {
        if (!pipView.isPictureInPictureActive()) {
            pipView.startPictureInPicture(withRefreshInterval: (0.1 / 60.0))
        }
    }
}

