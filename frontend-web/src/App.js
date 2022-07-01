import "./App.css";
import React, { Component } from "react";
import { getUniqueListBy, rmComma, toInt, toRp } from "./helper";

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      grandTotal: 0,
      data: [{ id: 1, name: "", price: "", qty: 1, total: "0", msg: "" }],
    };
    this.handleAdd = this.handleAdd.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleBlur = this.handleBlur.bind(this);
  }

  handleSetGrandTotal() {
    let gt = 0;
    this.state.data.map((res) => (gt += toInt(res.total)));
    this.setState({ grandTotal: gt });
  }

  handleBlur(e, i) {
    let data = this.state.data;
    if (isNaN(toInt(data[i].qty)) || toInt(data[i].qty) === 0) {
      data[i].qty = 1;
      data[i].msg = "";
      data[i].total = isNaN(toInt(data[i].price))
        ? 0
        : toInt(data[i].qty) * toInt(data[i].price);
    }
    this.setState({ data: data });
    setTimeout(() => this.handleSetGrandTotal(), 300);
  }

  handleSetTotal(price, qty, i) {
    let data = this.state.data;
    if (!isNaN(toInt(qty)) && !isNaN(toInt(price))) {
      data[i].msg = "";
      data[i].total = toInt(price) * toInt(qty);
    } else {
      data[i].msg = "qty tidak boleh kosong";
      data[i].total = 0;
    }
    this.setState(data);
    setTimeout(() => this.handleSetGrandTotal(), 300);
  }

  handleChange(e, i) {
    let col = e.target.name;
    let val = col === "name" ? e.target.value : rmComma(e.target.value);
    let data = this.state.data;
    data[i][col] = val;
    if (col === "qty" || col === "price") {
      this.handleSetTotal(data[i].price, data[i].qty, i);
    }
    this.setState({ data: data });
  }
  handleAdd() {
    let data = this.state.data;
    data.push({
      id: data.length + 1,
      name: "",
      price: "",
      qty: 1,
      total: "0",
      msg: "",
    });
    getUniqueListBy(data, "id");
    this.setState(data);
  }
  handleDelete(i) {
    let stateData = this.state.data;
    let data = this.state.data.filter((obj) => obj.id !== stateData[i].id);
    setTimeout(() => this.handleSetGrandTotal(), 300);
    this.setState({ data: data });
  }

  render() {
    const { data, grandTotal } = this.state;
    return (
      <div className="App">
        <header className="App-header">
          <div className="card text-left">
            <div className="card-header">
              <button
                className="btn btn-primary"
                onClick={() => this.handleAdd()}
              >
                New
              </button>
            </div>
            <div className="card-body" style={{ color: "black" }}>
              <table className="table">
                <tbody>
                  {data.map((res, idx) => {
                    return (
                      <tr key={idx}>
                        <td>
                          <div className="form-group">
                            <label>Product Name</label>
                            <input
                              name="name"
                              className="form-control"
                              value={data[idx].name}
                              onChange={(e) => this.handleChange(e, idx)}
                            />
                          </div>
                        </td>
                        <td>
                          <div className="form-group">
                            <label>Product Price</label>
                            <input
                              name="price"
                              className="form-control"
                              value={toRp(res.price)}
                              onChange={(e) => this.handleChange(e, idx)}
                            />
                          </div>
                        </td>
                        <td>
                          <div className="form-group">
                            <label>Qty</label>
                            <input
                              name="qty"
                              className="form-control"
                              value={toRp(res.qty)}
                              onBlur={(e) => this.handleBlur(e, idx)}
                              onChange={(e) => this.handleChange(e, idx)}
                            />
                            <small>{res.msg}</small>
                          </div>
                        </td>
                        <td>
                          <div className="form-group">
                            <label>Total</label>
                            <input
                              readOnly={true}
                              name="total"
                              className="form-control text-right"
                              value={toRp(res.total)}
                              onChange={(e) => this.handleChange(e, idx)}
                            />
                          </div>
                        </td>
                        <td style={{ display: idx !== 0 ? "block" : "none" }}>
                          <div className="form-group">
                            <button
                              onClick={() => this.handleDelete(idx)}
                              style={{ marginTop: "36px" }}
                              className="btn btn-danger"
                            >
                              Delete
                            </button>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
                <tfoot>
                  <tr>
                    <td colSpan={3}></td>
                    <td colSpan={1}>
                      <label>Grand Total</label>
                      <input
                        readOnly={true}
                        value={toRp(grandTotal)}
                        type="text"
                        className="form-control text-right"
                      />
                    </td>
                  </tr>
                </tfoot>
              </table>
            </div>
            <div className="card-footer"></div>
          </div>
        </header>
      </div>
    );
  }
}
