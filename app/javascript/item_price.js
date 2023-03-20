function loaded() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
    const priceVal = itemPrice.value;
    const tax = Math.floor(priceVal * 10 / 100)
    addTaxPrice.innerHTML = Math.floor(tax);
    Profit.innerHTML = Math.floor(priceVal - tax);
  });
};

window.addEventListener('load', loaded);