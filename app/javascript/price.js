function price(){
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value;
         
      if (value >= 300 && value <= 9999999){
        const formatter = new Intl.NumberFormat('ja-JP');
        let fee = Math.floor(value * 0.1)
        let gains = Math.floor(value - fee)
        add_tax.textContent = formatter.format(fee);
        profit.textContent = formatter.format(gains);
     } else {
       let fee = '-';
       let gains = '-';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   });

  }
  window.addEventListener('load', price);