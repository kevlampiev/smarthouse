displayErrWndw = function () {
    let wnd = document.querySelector('.error-notification')
    let errListEl = wnd.querySelector('.errors-list')
    if (errListEl.innerHTML.trim() != "") {
        wnd.classList.remove('hidden-form')
    } else {
        wnd.classList.add('hidden-form')
    }

}

function errWindowClose() {
    let wnd = document.querySelector('.error-notification')
    wnd.classList.add('hidden-form')
}


document.addEventListener('DOMContentLoaded', displayErrWndw)