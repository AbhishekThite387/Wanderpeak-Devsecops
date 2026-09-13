// ========================================
// GET ELEMENTS
// ========================================

const discoverBtn =
    document.getElementById("discoverBtn");

const navExplore =
    document.getElementById("navExplore");

const playBtn =
    document.getElementById("playBtn");

const modal =
    document.getElementById("journeyModal");

const closeModal =
    document.getElementById("closeModal");

const modalExplore =
    document.getElementById("modalExplore");

const clock =
    document.getElementById("clock");


// ========================================
// SCROLL TO DESTINATIONS
// ========================================

function goToDestinations() {

    document
        .getElementById("destinations")
        .scrollIntoView({
            behavior: "smooth"
        });

}


discoverBtn.addEventListener(
    "click",
    goToDestinations
);


navExplore.addEventListener(
    "click",
    goToDestinations
);


// ========================================
// OPEN JOURNEY MODAL
// ========================================

playBtn.addEventListener(
    "click",
    function () {

        modal.classList.add("active");

    }
);


// ========================================
// CLOSE MODAL
// ========================================

closeModal.addEventListener(
    "click",
    function () {

        modal.classList.remove("active");

    }
);


// ========================================
// MODAL EXPLORE
// ========================================

modalExplore.addEventListener(
    "click",
    function () {

        modal.classList.remove("active");

        goToDestinations();

    }
);


// ========================================
// CLICK OUTSIDE MODAL
// ========================================

modal.addEventListener(
    "click",
    function (event) {

        if (event.target === modal) {

            modal.classList.remove("active");

        }

    }
);


// ========================================
// ESCAPE KEY
// ========================================

document.addEventListener(
    "keydown",
    function (event) {

        if (event.key === "Escape") {

            modal.classList.remove("active");

        }

    }
);


// ========================================
// LIVE CLOCK
// ========================================

function updateClock() {

    const now = new Date();

    clock.textContent =
        now.toLocaleTimeString();

}


setInterval(
    updateClock,
    1000
);


updateClock();