
let iconCart = document.querySelector('.andy_iconCart')
let cart= document.querySelector('.andy_right_cart');
let total= document.querySelector('.andy_total');
let close= document.querySelector('.andy_close');

iconCart.addEventListener('click',()=>{
    if(cart.style.right == '-100%'){
        cart.style.right='0';
        //total.style.transform='translateX(-400px)';        
    }else{
        cart.style.right='-100%';
        //total.style.transform='translateX(0)';
    }
})

close.addEventListener('click', ()=>{
    cart.style.right='-100%';
    //total.style.transform='translateX(0)';
})

let products=null;
fetch('./js/product.json')
.then(response => response.json())
.then(data => {
    products=data;
    addDataToHTML();
})

function addDataToHTML(){
    //remove datats default in html
    let listProductHTML= document.querySelector('.container');
    listProductHTML.innerHTML='';
    if (products != null) {        
        products.forEach(product => {
            let newP = document.createElement('div');
            newP.id = product.window;
            newP.classList.add("overlay");            
            newP.innerHTML =
                `<div class="colLeft">
                <div class="title">
                    <div class="listName">${product.name}</div>
                    <div class="en">${product.discription}</div>
                </div>
                <div class="image">
                    <img src="${product.image}">
                </div>  
            </div>
            <div class="colMiddle">
                <table>
                    <tr>
                        <td colspan="2">營養分析</td>
                    </tr>
                    <tr>
                        <td>熱量  ( Kcal )</td>
                        <td>352</td>
                    </tr>
                    <tr>
                        <td>蛋白質  ( g )</td>
                        <td>13</td>
                    </tr>
                    <tr>
                        <td>脂肪  ( g )</td>
                        <td>18</td>
                    </tr>
                    <tr>
                        <td>飽和脂肪  ( g )</td>
                        <td>6.9</td>
                    </tr>
                    <tr>
                        <td>反式脂肪  ( g )</td>
                        <td>0.1</td>
                    </tr>
                    <tr>
                        <td>碳水化合物  ( g )</td>
                        <td>35</td>
                    </tr>
                    <tr>
                        <td>糖  ( g )</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>鈉  ( mg )</td>
                        <td>535</td>
                    </tr>
                </table>
            </div>                    
            <div class="colRight">
                <div class="contents">
                    <div class="tabsContent">                            
                        <p>最簡單的原味白吐司，口感柔軟有彈性，經微烤後的香氣，夾入富有嚼勁的火腿肉，Q滑又鮮嫩，讓人不自覺一口接一口！</p>
                        <p>價格：$${product.price}</p>
                        <div class="PDContent2">＊產品圖片僅供參考，實際產品以各門市販售為準。</div>                                                      
                                 
                    </div>
                    <button class="addCar" onclick="addCart(${product.id})">加入購物車</button>  
                </div>
            </div>`;
            listProductHTML.appendChild(newP);
            /*
            let overlay = document.createElement('div');            
            overlay.classList.add("overlay");
            overlay.innerHTML =
                `<div class="popup">
                    <div class="colLeft">
                        <div class="title">
                            <div class="listName">${product.name}</div>
                            <div class="en"></div>
                        </div>
                        <div class="image">
                            <img src="${product.image}">
                        </div>  
                    </div>
                    <div class="colRight">
                        <div class="contents">
                            <ul class="tabsChoose">
                                <li class="productDescription"><button id="descriptionButton">產品說明</button></li>
                                <li class="ProductIngredients"><button id="ingredientsButton">產品食材</button></li>
                            </ul>
                            <div class="tabsContent">
                                <div class="PDContent" id="PDContent">
                                    <p>最簡單的原味白吐司，口感柔軟有彈性，經微烤後的香氣，夾入富有嚼勁的火腿肉，Q滑又鮮嫩，讓人不自覺一口接一口！</p>
                                    <p>價格：${product.price}</p>
                                    <div class="PDContent2">＊產品圖片僅供參考，實際產品以各門市販售為準。</div>
                                </div>
                                <div class="PIContent" id="PIContent">
                                    <table>
                                        <tr>
                                            <td colspan="2">營養分析</td>
                                        </tr>
                                        <tr>
                                            <td>熱量  ( Kcal )</td>
                                            <td>352</td>
                                        </tr>
                                        <tr>
                                            <td>蛋白質  ( g )</td>
                                            <td>13</td>
                                        </tr>
                                        <tr>
                                            <td>脂肪  ( g )</td>
                                            <td>18</td>
                                        </tr>
                                        <tr>
                                            <td>飽和脂肪  ( g )</td>
                                            <td>6.9</td>
                                        </tr>
                                        <tr>
                                            <td>反式脂肪  ( g )</td>
                                            <td>0.1</td>
                                        </tr>
                                        <tr>
                                            <td>碳水化合物  ( g )</td>
                                            <td>35</td>
                                        </tr>
                                        <tr>
                                            <td>糖  ( g )</td>
                                            <td>5</td>
                                        </tr>
                                        <tr>
                                            <td>鈉  ( mg )</td>
                                            <td>535</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="quantity">
                            <div class="quantityCounter">
                                <span>數量</span>
                                <button class="decrease">-</button>
                                <input class="quantityInput" type="text" value="1">
                                <button class="increase">+</button>
                            </div>
                            <div class="car">
                            <button class="addCar" onclick="addCart(${product.id}, this.closest('.overlay'))">加入<br>購物車</button>
                                <button class="goCar">查看<br>購物車</button>
                            </div>
                        </div>
                    </div>
                    <button class="close_button" id="closeButton"></button>
                </div>`;
            */                

        });
    }    
}

let listCart= [];
// and i get cookie data cart
function checkCart(){
    var cookieValue= document.cookie
    .split(", ")
    .find(row => row.startsWith('listCart='));
    if(cookieValue){
        listCart = JSON.parse(cookieValue.split('=')[1]);
    }
}

checkCart();

function addCart($idProduct) {
    let productCopy = JSON.parse(JSON.stringify(products));
    
    if (!listCart[$idProduct]) {
        let dataProduct = productCopy.filter(
            (product) => product.id == $idProduct
        )[0];
        listCart[$idProduct] = dataProduct;
        listCart[$idProduct].quantity = 1;
    } else {
        listCart[$idProduct].quantity++;
    }
    // Save cart data in a cookie
    let timeSave = "expire=Thu, 31 Dec 2023 23:59:59 UTC";
    document.cookie = "listCart=" + JSON.stringify(listCart) + "; " + timeSave + "; path=/;";
    // Update the cart display
    addCartToHTML();
}

addCartToHTML();
function addCartToHTML(){
    let listCartHTML= document.querySelector('.andy_cart_listCart');
    if(listCartHTML){
        listCartHTML.innerHTML='';
    }  
    
    let totalHTML= document.querySelector('.andy_totalQuantity');
    let totalQuantity=0;

    if(listCart){
        listCart.forEach(product =>{
            if(product){
                let newCart =document.createElement('div');
                newCart.classList.add('andy_cart_item');
                newCart.innerHTML=`
                <img src="${product.image}">
                <div class="andy_cart_item_content">
                   <div class="cart_item_name">
                       ${product.name}
                   </div>
                   <div class="cart_item_price">
                   ${product.price}/1 product 
                   </div>
                </div>
                <div class="andy_cart_item_quantity">
                       <botton onclick="changeQuantity(${product.id}, '-')" >-</botton>
                       <span class="value">${product.quantity}</span>
                       <botton onclick="changeQuantity(${product.id}, '+')" >+</botton>
                </div>`;
                listCartHTML.append(newCart);
                totalQuantity=totalQuantity+parseInt(product.quantity);
            }
        })
    }
    totalHTML.innerText=totalQuantity;
}

function changeQuantity( idProduct , $type ){
    switch($type){
        case '+':
            listCart[idProduct].quantity++;
            break;
        case '-':
            listCart[idProduct].quantity--;
            if(listCart[idProduct].quantity <=0){
                delete listCart[idProduct];
            }
            break;

        default:
            break;
    }
    let timeSave="expire=Sun, 31 Dec 2023 23:59:59 UTC";
    document.cookie="listCart=" +JSON.stringify(listCart)+"; "+timeSave+"; path=/;";
    addCartToHTML();
}



