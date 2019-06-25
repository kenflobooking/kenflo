class PoweredByBookingItem: TableItem {
    override func cellHeight(tableWidth: CGFloat) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PoweredByBookingCell.hl_reuseIdentifier(), for: indexPath) as! PoweredByBookingCell
        return cell
    }
}
