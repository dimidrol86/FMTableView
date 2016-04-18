/**
 * Created by dimidrol on 31.03.16.
 */

import React, { requireNativeComponent } from 'react-native';


class TableView extends React.Component {
    static propTypes = {
        cellModule: React.PropTypes.string
    }


    render() {
        console.log(this.props);
        return <FMTableView {...this.props}/>;
    }
}

var FMTableView = requireNativeComponent('FMTableView', TableView);

module.exports = TableView;

