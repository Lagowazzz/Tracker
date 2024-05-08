import UIKit

class MainScreenViewController: UIViewController {
    
    private var plusButton: UIButton!
    private var datePicker: UIDatePicker!
    private var mainLabel: UILabel!
    private var starImageView: UIImageView!
    private var whatsUpLabel: UILabel!
    private var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPlusButton()
        setupDatePicker()
        setupMainLabel()
        setupSearchTextField()
        setupStarImageView()
        setupWhatsUpLabel()
        setupTabBar()
        view.bringSubviewToFront(datePicker)
        view.bringSubviewToFront(searchTextField)
    }
    
    @objc private func datePickerDidTap() {
        let selectedDate = datePicker.date
        _ = formatDate(date: selectedDate)
        dismiss(animated: true)
    }
    
    
    private func setupTabBar() {
        let tabBarController = UITabBarController()
        
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        
        let imageCircle = UIImage(named: "circle")
        let imageRabbit = UIImage(named: "rabbit")
        
        let tabBarItem1 = UITabBarItem(title: "Трекеры", image: imageCircle, selectedImage: nil)
        let tabBarItem2 = UITabBarItem(title: "Статистика", image: imageRabbit, selectedImage: nil)
        
        viewController1.tabBarItem = tabBarItem1
        viewController2.tabBarItem = tabBarItem2
        
        tabBarController.viewControllers = [viewController1, viewController2]
        
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: tabBarController.tabBar.frame.width, height: 0.5)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        tabBarController.tabBar.layer.addSublayer(topBorder)
    }
    
    private func setupWhatsUpLabel() {
        whatsUpLabel = UILabel()
        whatsUpLabel.text = "Что будем отслеживать?"
        whatsUpLabel.textAlignment = .center
        whatsUpLabel.textColor = .black
        whatsUpLabel.font = .systemFont(ofSize: 12)
        whatsUpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(whatsUpLabel)
        
        NSLayoutConstraint.activate([
            whatsUpLabel.widthAnchor.constraint(equalToConstant: 343),
            whatsUpLabel.heightAnchor.constraint(equalToConstant: 18),
            whatsUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            whatsUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            whatsUpLabel.topAnchor.constraint(equalTo: starImageView.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupStarImageView() {
        let starView = UIImage(named: "Star")
        starImageView = UIImageView(image: starView)
        starImageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        starImageView.center = view.center
        view.addSubview(starImageView)
    }
    
    private func setupMainLabel() {
        mainLabel = UILabel()
        mainLabel.text = "Трекеры"
        mainLabel.textColor = .black
        mainLabel.font = .boldSystemFont(ofSize: 34)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            mainLabel.widthAnchor.constraint(equalToConstant: 254),
            mainLabel.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
    
    private func setupSearchTextField() {
        searchTextField = UITextField()
        searchTextField.placeholder = "      Поиск"
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "      Поиск",
            attributes: [
                .foregroundColor: UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1),
                .font: UIFont.systemFont(ofSize: 17)
            ]
        )
        searchTextField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        
        searchTextField.layer.cornerRadius = 8
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        let searchIconImageView = UIImageView(image: UIImage(named: "search"))
        searchIconImageView.contentMode = .scaleAspectFit
        searchIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.leftViewMode = .always
        searchTextField.addSubview(searchIconImageView)
        
        NSLayoutConstraint.activate([
            searchIconImageView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 8),
            searchIconImageView.widthAnchor.constraint(equalToConstant: 15.5),
            searchIconImageView.heightAnchor.constraint(equalToConstant: 15.5),
            searchIconImageView.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 10),
            searchIconImageView.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 7),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchTextField.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
    private func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.tintColor = .systemBlue
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(datePickerDidTap), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            datePicker.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupPlusButton() {
        let image = UIImage(named: "plus")
        plusButton = UIButton(type: .custom)
        plusButton.setImage(image, for: .normal)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            plusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            plusButton.widthAnchor.constraint(equalToConstant: 42),
            plusButton.heightAnchor.constraint(equalToConstant: 42)
            
        ])
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM.yy"
        return formatter.string(from: date)
    }
}

