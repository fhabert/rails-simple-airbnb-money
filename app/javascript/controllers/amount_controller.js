// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "counter", "total" ]

  connect() {
  }

  plus() {
    let counter = Number.parseInt(this.counterTarget.innerText);
    counter++;
    this.counterTarget.innerText = counter;
    const amount = document.querySelector("#div-amount");
    const totalAmount = document.getElementById('amount_price');
    totalAmount.attributes.value.value = counter;
    console.log(totalAmount);
    let priceFlat = Number.parseInt(amount.dataset.priceFlat);
    let total_price = priceFlat * counter;
    this.totalTarget.innerText = `Total: £${total_price}`
  }
  minus() {
    let counter = Number.parseInt(this.counterTarget.innerText);
    if (counter > 1) {
      counter--;
    }
    const totalAmount = document.getElementById('amount_price');
    totalAmount.attributes.value.value = counter;
    console.log(totalAmount);
    this.counterTarget.innerText = counter;
    const amount = document.querySelector("#div-amount");
    let priceFlat = Number.parseInt(amount.dataset.priceFlat);
    this.totalTarget.innerText = `Total: £${priceFlat * counter}`
  }
}
