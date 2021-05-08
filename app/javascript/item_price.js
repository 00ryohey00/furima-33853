window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;

   const addTaxDom = document.getElementById("add-tax-price");
   Salescommission = Math.floor(inputValue*0.1)
    addTaxDom.innerHTML= Salescommission

   const salesProfit = document.getElementById("profit");
   profit = (inputValue - Salescommission)
    salesProfit.innerHTML= profit
})

})