document.addEventListener("DOMContentLoaded", function () {
    var openButtons = document.querySelectorAll(".open-button");
    var overlay = document.querySelectorAll(".overlay");
    var closeButtons = document.querySelectorAll(".close_button");

    openButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            var target = button.getAttribute("data-target");
            var window = document.getElementById(target);
            window.style.display = "block";
        });
    });

    closeButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            var parentOverlay = button.closest(".overlay");
            parentOverlay.style.display = "none";
        });
    });
});