const initLike = () => {
    const btnLikes = document.querySelectorAll('.btn-like');
    btnLikes.forEach((btnLike) => {
        btnLike.addEventListener('click', (event) => {
            if (event.currentTarget.innerHTML === "🤍") {
                event.currentTarget.innerHTML = "";
                event.currentTarget.insertAdjacentHTML('beforeend', '❤')
            } else {
                event.currentTarget.innerHTML = "";
                event.currentTarget.insertAdjacentHTML('beforeend', '🤍')
            }
        })
    })
}

export { initLike };