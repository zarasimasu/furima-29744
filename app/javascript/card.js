const pay = () => {
  Payjp.setPublicKey("pk_test_5393dfc6f40a8a27e407bc62");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc"),
    };
    Payjp.createToken(card, (status, response) => {
    })
  })
}
window.addEventListener("load", pay);