function price(){
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
     priceInput.addEventListener('keyup', () => {
         const value = parseInt(priceInput.value);

         let fee = 0;
         let gains = 0;
         
      if (value >= 300 && value <= 9999999){
        fee = parseInt(Math.floor(value * 0.1));
        gains = parseInt(Math.floor(value - fee));
     } else {
       fee = '';
       gains = '';
     }
     const formatter = new Intl.NumberFormat('ja-JP');
     add_tax.textContent = formatter.format(fee);
     profit.textContent = formatter.format(gains);
   });

  }
  window.addEventListener('load', price);