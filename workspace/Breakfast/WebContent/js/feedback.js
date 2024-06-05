// 清除按鈕的點擊事件處理
document.getElementById('clear-button').addEventListener('click', function () {
    // 清除表單中的輸入內容
    document.getElementById('name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('food-rating').selectedIndex = 0;
    document.getElementById('service-rating').selectedIndex = 0;
    document.getElementById('ambiance-rating').selectedIndex = 0;
    document.getElementById('overall-rating').selectedIndex = 0;
    document.getElementById('feedback').value = '';
    

});