/**
 * Created by dimidrol on 31.03.16.
 */

import React, { requireNativeComponent } from 'react-native';


class TableView extends React.Component {
    render() {
        return <FMTableView {...this.props} />;
    }
}

TableView.propTypes = {

    cellModule: React.PropTypes.string,
};

var FMTableView = requireNativeComponent('FMTableView', TableView);

module.exports = TableView;

