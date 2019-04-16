# ExpandableTableWidget

## Highly reusable and customisable
* Support custom section header view and custom table cell
* Allows to add UITapGestureRecognizer to any component inside custom header view

## How to use

* Make your own head view conform to ExpandableTableHeaderViewProtocol
* Make your own table cell conform to ExpandableTableCellProtocol
* Make your own section model conform to ExpandableTableSectionModelProtocol
* Make your own item model conform to ExpandableTableSectionItemModelProtocol
* Just invoke this function on the widget:  public func configure(with sectionModels: [ExpandableTableSectionModelProtocol], headerViewNib: UINib, cellNib: UINib, rowAnimation: UITableView.RowAnimation? = default)

![Apr-16-2019 18-20-48](https://user-images.githubusercontent.com/46996132/56193618-6c3e3600-6074-11e9-9fcf-af857a7e5dc5.gif)
