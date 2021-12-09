//
//  QuoteDetailViewController.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit
import EasyPeasy

final class QuoteDetailViewController: UIViewController {
	//MARK: Properties
	var presenter: PresenterQuoteDetailProtocol?

	private lazy var characterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private lazy var quoteLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		return label
	}()

	//MARK: Init
	init(presenter: PresenterQuoteDetailProtocol) {
		super.init(nibName: nil, bundle: nil)
		self.presenter = presenter
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		presenter?.didLoadView { [weak self] quoteViewModel in
			self?.configureWith(viewModel: quoteViewModel)
		}
	}

	private func configureUI() {
		view.backgroundColor = .systemBackground
		view.addSubview(characterImageView)
		view.addSubview(quoteLabel)

		let widthHeightConstant = min(view.frame.width, view.frame.height)*0.8
		characterImageView.easy.layout(
			Top(150), CenterX(),
			Width(widthHeightConstant),
			Height(widthHeightConstant)
		)

		quoteLabel.easy.layout(
			Top().to(characterImageView),
			CenterX(),
			Width(widthHeightConstant),
			Bottom()
		)
	}

	//MARK: Private func's
	private func configureWith(viewModel: QuoteDetailViewModel) {
		DispatchQueue.main.async {
			self.quoteLabel.text = viewModel.quoteText
			self.characterImageView.image = viewModel.characterImage ?? UIImage(systemName: "photo")
			self.title = viewModel.character
		}
	}
}
