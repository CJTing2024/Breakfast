document.addEventListener("DOMContentLoaded", function () {
    let listCart = [];
    function checkCart() {
        var cookieValue = document.cookie.split('; ').find(row => row.startsWith('listCart='));
        if (cookieValue) {
            listCart = JSON.parse(cookieValue.split('=')[1]);
        }
    }

    checkCart();

    function addCartToHTML() {
        let listCartHTMl = document.querySelector('.list');
        if (listCartHTMl) {
            listCartHTMl.innerHTML = '';
        }
        let totalQuantityHTML = document.querySelector('.totalQuantity');
        let totalPriceHTML = document.querySelector('.totalPrice');

        let totalQuantity = 0;
        let totalPrice = 0;

        if (listCart) {
            listCart.forEach(product => {
                if (product) {
                    let newP = document.createElement('div');
                    newP.classList.add('item');
                    newP.innerHTML = `
                        
                        <div class="info">
                            <div class="name">${product.name}</div>
                            <div class="price"> ${product.price}/1 一份</div>
                        </div>
                        <div class="quantity">${product.quantity}</div>
                        <div class="returnPrice">${product.price * product.quantity}</div>`;
                    listCartHTMl.appendChild(newP);
                    totalQuantity = totalQuantity + parseInt(product.quantity);
                    totalPrice = totalPrice + (product.price * product.quantity);
                }
            })
        }
        totalQuantityHTML.innerText = totalQuantity;
        totalPriceHTML.innerHTML = '$' + totalPrice;
    }

    addCartToHTML();



})

const confirmButton2 = document.getElementById("confirmButton2");
confirmButton2.addEventListener("click", function () {
    let listCart = [];
    function checkCart() {
        var cookieValue = document.cookie.split('; ').find(row => row.startsWith('listCart='));
        if (cookieValue) {
            listCart = JSON.parse(cookieValue.split('=')[1]);
        }
    }

    checkCart();

    function addCartToHTML() {
        let listCartHTMl = document.querySelector('.list2');
        if (listCartHTMl) {
            listCartHTMl.innerHTML = '';
        }
        let totalQuantity2HTML = document.querySelector('.totalQuantity2');
        let totalPrice2HTML = document.querySelector('.totalPrice2');

        let totalQuantity = 0;
        let totalPrice = 0;

        if (listCart) {
            listCart.forEach(product => {
                if (product) {
                    let newP2 = document.createElement('div');
                    newP2.classList.add('item2');
                    newP2.innerHTML = `
                            
                            <div class="info2">
                                <div class="name2">${product.name}</div>
                            </div>
                            <div class="quantity2">${product.quantity}</div>
                            <div class="returnPrice2">${product.price * product.quantity}</div>`;
                    listCartHTMl.appendChild(newP2);
                    totalQuantity = totalQuantity + parseInt(product.quantity);
                    totalPrice = totalPrice + (product.price * product.quantity);
                }
            })
        }
        totalQuantity2HTML.innerText = totalQuantity;
        totalPrice2HTML.innerHTML = '$' + totalPrice;
    }

    addCartToHTML();

});