const img = ["/img/Picture3.png", "/img/Picture1.jpeg", "/img/Picture2.jpeg","/img/Picture5.png","/img/Picture6.png","/img/Picture7.png"];
    let index = 0;
    const imge = document.getElementById("changingImage");

    function changeImage() {

        img.style.opacity = 0;

        setTimeout(() => {
            index++;
            if(index >= images.length) index = 0;
            imge.src = images[index];
            imge.style.opacity = 1;
        }, 500); 
    }

    setInterval(changeImage, 3000);