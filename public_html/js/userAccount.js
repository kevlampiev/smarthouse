function startEditUserData(fieldName, title) {
  let wnd = document.querySelector(".fieldEditForm");
  let editInp = wnd.querySelector("input");
  let mainLabel = wnd.querySelector("h4");
  mainLabel.innerHTML = title;

  let oldValue = document.querySelector("#" + fieldName + " .fieldBlock__data")
    .innerHTML;
  wnd.setAttribute("data-fieldName", fieldName);
  editInp.value = oldValue;
  wnd.classList.remove("hidden-form");
}

function cancelEditUserData() {
  let wnd = document.querySelector(".fieldEditForm");
  wnd.classList.add("hidden-form");
}
