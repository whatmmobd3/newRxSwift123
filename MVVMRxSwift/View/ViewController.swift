import UIKit
import RxSwift
import RxCocoa

//push

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: MessageListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    static func instantiate(viewModel: MessageListViewModel) -> ViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as!
        ViewController
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(navigationItem)
        
        //        tableView.tableFooterView = UIView()
        //
        //        navigationItem.title = viewModel.title
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        tableView.contentInsetAdjustmentBehavior = .never
        
        
        //        viewModel.fetchMessageViewModel().observeOn(MainScheduler.instance)
        //        .bind(to: tableView.rx.items(cellIdentifier: "cell"))
        //        {index,viewModel, cell in cell.textLabel?.text = viewModel.displayText
        //        }.disposed(by: disposeBag)
        
        viewModel.fetchMessageViewModel().observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell"))
        {index,viewModel,cell in cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
  
        
    }
    
    
}

