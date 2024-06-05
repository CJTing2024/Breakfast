document.addEventListener("DOMContentLoaded", function () {

    const descriptionButton = document.getElementById("descriptionButton");
    const ingredientsButton = document.getElementById("ingredientsButton");

    const PDContent = document.getElementById("PDContent");
    const PIContent = document.getElementById("PIContent");

    const decreaseButton = document.querySelector('.decrease');
    const increaseButton = document.querySelector('.increase');
    const quantityInput = document.querySelector('.quantityInput');

    descriptionButton.addEventListener("click", function () {
        
        PDContent.style.display="block"; 
        PIContent.style.display="none"; 

        descriptionButton.classList.add("active-button");
        ingredientsButton.classList.remove("active-button");
        descriptionButton.classList.remove("inactive-button");
        ingredientsButton.classList.add("inactive-button");

    });

    ingredientsButton.addEventListener("click", function () {

        PDContent.style.display="none"; 
        PIContent.style.display="block"; 

        descriptionButton.classList.remove("active-button");
        ingredientsButton.classList.add("active-button");
        descriptionButton.classList.add("inactive-button");
        ingredientsButton.classList.remove("inactive-button");
    });

    increaseButton.addEventListener('click', () => {
    
        let currentValue = parseInt(quantityInput.value);

        currentValue++;
        quantityInput.value = currentValue;
    });

    
    decreaseButton.addEventListener('click', () => {
        
        let currentValue = parseInt(quantityInput.value);

        
        if (currentValue > 1) {
            currentValue--;
            quantityInput.value = currentValue;
        }
    });
});
