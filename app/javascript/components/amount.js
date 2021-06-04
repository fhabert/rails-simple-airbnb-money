const initAmount = () => {
    const amount = document.querySelector("#div-amount");
    if (amount) {
        const btnMinus= document.querySelector("#btn-minus");
        const btnPlus = document.querySelector("#btn-plus");
        if (btnMinus) {
            btnMinus.addEventListener('click', () => {
                console.log(totalAmount);
            })
        }
        if (btnPlus) {
            btnPlus.addEventListener('click', () => {
                totalAmount.attributes.value.value = counter;
                console.log(totalAmount);
            })
        }
    }
}

export { initAmount };