//
//  QuotesViewController.swift
//  VIPER
//
//  Created by iMac on 18.11.2021.
//

import UIKit
import EasyPeasy
import PKHUD

final class QuotesViewController: UIViewController {
	//MARK: Properties
	var presenter: PresenterQuotesProtocol?

	private lazy var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .grouped)
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()

	private lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
		refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
		return refreshControl
	}()

	//MARK: Init
	init(presenter: PresenterQuotesProtocol) {
		super.init(nibName: nil, bundle: nil)
		self.presenter = presenter
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		didLoadPresenter()
	}

	private func didLoadPresenter() {
		presenter?.didLoadView(showHUDCompletion: {
			willShowHUD(true)
		}, wasSuccessFetchQuotes: finishFetch(with:))
	}

	private func configureUI() {
		view.addSubview(tableView)
		tableView.addSubview(refreshControl)
		tableView.easy.layout(Edges())
		tableView.backgroundColor = .systemBackground
		title = "Simpson Quotes"
	}

	//MARK: Private func's
	private func willShowHUD(_ show: Bool) {
		DispatchQueue.main.async {
			if show {
				HUD.show(.progress, onView: self.view)
			} else {
				HUD.hide()
			}
		}
	}

	private func fetchQuotesWasSuccess() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.refreshControl.endRefreshing()
		}
	}

	private func fetchQuotesWasFailWith(error: String) {
		DispatchQueue.main.async {
			self.refreshControl.endRefreshing()
			self.presenter?.showAlertWithError {
				let alertController = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
				let tryAgainAction = UIAlertAction(title: "Try again", style: .default) { [weak self] _ in
					self?.didLoadPresenter()
				}
				alertController.addAction(tryAgainAction)
				self.present(alertController, animated: true)
			}
		}
	}

	private func finishFetch(with result: Result<Void, Error>) {
		self.willShowHUD(false)
		switch result {
		case .success():
			self.fetchQuotesWasSuccess()
		case .failure(let error):
			self.fetchQuotesWasFailWith(error: "Couldn't fetch quotes: \(error.localizedDescription)")
		}
	}

	//MARK: - Actions
	@objc func refreshControlAction() {
		presenter?.fetchQuotes(wasSuccessFetchQuotes: finishFetch(with:))
	}
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension QuotesViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter?.getNumberOfQuotesInSection() ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = presenter?.quoteText(indexPath: indexPath)
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.deselectRowAt(index: indexPath.row) { index in
				self.tableView.deselectRow(at: IndexPath(row: index, section: 0), animated: true)
		}
		presenter?.didSelectRowAt(index: indexPath.row) { [weak self] in
			self?.willShowHUD(false)
		}
	}
}
