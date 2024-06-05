document.addEventListener("DOMContentLoaded", function () {
    var openButtons = document.querySelectorAll(".open-button");
    var overlay = document.querySelectorAll(".overlay");
    var closeButtons = document.querySelectorAll(".close_button");

    const descriptionButton = document.getElementById("descriptionButton");
    const ingredientsButton = document.getElementById("ingredientsButton");


    openButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            var target = button.getAttribute("data-target");
            var window = document.getElementById(target);
            window.style.display = "block";

            descriptionButton.classList.add("active-button");
            ingredientsButton.classList.remove("active-button");
            descriptionButton.classList.remove("inactive-button");
            ingredientsButton.classList.add("inactive-button");
        });
    });

    closeButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            var parentOverlay = button.closest(".overlay");
            parentOverlay.style.display = "none";
        });
    });
});