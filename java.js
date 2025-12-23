const images = ["Picture3.png", "Picture1.jpeg", "Picture2.jpeg","Picture5.png","Picture6.png","Picture7.png"];
    let index = 0;
    const img = document.getElementById("changingImage");

    function changeImage() {

        img.style.opacity = 0;

        setTimeout(() => {
            index++;
            if(index >= images.length) index = 0;
            img.src = images[index];
            img.style.opacity = 1;
        }, 500); 
    }

    setInterval(changeImage, 3000);