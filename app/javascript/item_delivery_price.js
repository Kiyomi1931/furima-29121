window.addEventListener('load', () => {
  //入力した価格の値を取得
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    //販売手数料出力
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    //販売利益出力
    const servicePrice = document.getElementById("profit");
    servicePrice.innerHTML = inputValue-Math.floor(inputValue/10);
  })
  
});