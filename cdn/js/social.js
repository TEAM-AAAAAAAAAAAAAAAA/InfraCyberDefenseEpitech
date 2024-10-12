let app = {
    onclick: (e) => {
        const src = e.target.src
        console.log(src)
        document.body.innerHTML += "<div class='big_image'><button class='close' onclick='app.close()'>x</button><img src='"+ e.target.src + "'></img></div>"
        document.querySelectorAll(".social_image").forEach(i => i.addEventListener("click", app.onclick))
    },
    close: () => {
        document.querySelectorAll(".big_image").forEach(i => i.remove())
    },
    oninputchange: (e) => {
        console.log(e.target.fileList)
        if (e.target.fileList.length > 0) {
            document.querySelector("input[type=submit]").disabled = false
        } else {
            document.querySelector("input[type=submit]").disabled = true
        }
    },
    d: new Date()
}

window.app = app

document.addEventListener("DOMContentLoaded", (event) => {
    console.log("DOM fully loaded and parsed")
    document.querySelectorAll(".social_image").forEach(i => i.addEventListener("click", app.onclick))
    document.querySelectorAll("input").forEach(i => i.addEventListener("change", app.oninputchange, false))
    document.querySelectorAll("p").forEach(i => console.log(i))

    document.querySelectorAll("p").forEach(i => {
        if (i.parentNode.className == 'social_image') { 
            i.innerHTML += "<br/>" + `<p class='date'>${app.d.getDate()}/${app.d.getMonth()}/${app.d.getFullYear()}</p>`
        }
    })
})
