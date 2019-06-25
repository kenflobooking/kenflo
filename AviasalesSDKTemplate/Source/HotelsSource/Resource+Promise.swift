import PromiseKit
import HotellookSDK

class CancelToken {
    var cancelHandler: (() -> Void)?

    func cancel() {
        cancelHandler?()
    }
}

extension HDKResource {

    func promise(cancelToken: CancelToken? = nil) -> Promise<T> {
        return Promise {[weak cancelToken] seal in
            let executor = ServiceLocator.shared.requestExecutor
            let request = executor.load(resource: self, completion: { [weak cancelToken] (obj, err) in
                cancelToken?.cancelHandler = nil
                if let obj = obj {
                    seal.fulfill(obj)
                } else {
                    seal.reject(err!)
                }
            })
            cancelToken?.cancelHandler = { [weak request] in request?.cancel() }
        }
    }
}
