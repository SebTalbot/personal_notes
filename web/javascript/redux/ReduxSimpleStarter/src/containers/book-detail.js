import React from 'react'
import { connect } from 'react-redux'

class BookDetails extends React.Component {
  render(){
    if(!this.props.book){
      return(<div>Select a book</div>)
    }
    return(
      <div>
        <h3>Details:</h3>
        <div>Title: {this.props.book.title}</div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    book: state.activeBook,
  }
}

export default connect(mapStateToProps)(BookDetails)