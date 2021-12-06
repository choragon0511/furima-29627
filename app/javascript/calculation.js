function Calculation() {

  const calculation  = document.getElementById("item-price");
  calculation.addEventListener("keyup", () => {

    const price = calculation.value;
    const taxPrice = Math.floor(price * 0.1);
    const salesProfit = price - taxPrice;
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${taxPrice}`;
    profit.innerHTML = `${salesProfit}`;

  });
}

window.addEventListener('load', Calculation)