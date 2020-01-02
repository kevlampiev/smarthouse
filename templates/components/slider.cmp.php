<div class="slider centered">

    <div v-for="slide of slides" :slide="slide" :key="slide.imgFile">
        <div v-bind:class="slide.currentClass">
            <img v-bind:src="slide.imgFile" alt="slide.fileComment" class="grayImg">
        </div>
    </div>


    <i class="fas fa-chevron-circle-right slider-rightArrow" @click="nextSlideRight()"> </i>
    <i class="fas fa-chevron-circle-left slider-leftArrow" @click="nextSlideLeft()"> </i>
    <div class="slider__comment cyanStyled">
        {{slides[currentIdx].slideText}}
    </div>

</div>

<link rel="stylesheet" href="styles/slider.css">

<script>
    let slider = new Vue({
        el: ".slider",
        data: {
            slides: [],
            readyToSlide: true,
            currentIdx: 0,
            intervalID: null
        },
        methods: {

            getData() {

                this.slides = JSON.parse('<?= json_encode($sliderInfo) ?>');

                this.slides.forEach(el => {
                    el.imgFile = `img/forSlider/${el.imgFile}`;
                })
                //а можно сюда через fetch/axios
            },

            nextSlideRight() {
                if (this.readyToSlide) {
                    this.readyToSlide = false;
                    clearInterval(this.intervalID);
                    let prevIndex = this.currentIdx;

                    this.currentIdx = prevIndex == (this.slides.length - 1) ? 0 : (this.currentIdx + 1);

                    this.slides[this.currentIdx].currentClass = 'slider-item slide-left';
                    this.slides[prevIndex].currentClass = 'slider-item erase-left';
                    setTimeout(() => {
                        this.slides[this.currentIdx].currentClass = 'slider-item';
                        this.slides[prevIndex].currentClass = 'slider-item hidden-slide';
                        this.readyToSlide = true; //!!
                        this.intervalID = setInterval(this.nextSlideRight, 10000);
                    }, 1500);
                }
            },

            nextSlideLeft() {
                if (this.readyToSlide) {
                    this.readyToSlide = false;
                    clearInterval(this.intervalID);
                    let prevIndex = this.currentIdx;

                    this.currentIdx = prevIndex == 0 ? (this.slides.length - 1) : (this.currentIdx - 1);

                    this.slides[this.currentIdx].currentClass = 'slider-item slide-right';
                    this.slides[prevIndex].currentClass = 'slider-item erase-right';
                    setTimeout(() => {
                        this.slides[this.currentIdx].currentClass = 'slider-item';
                        this.slides[prevIndex].currentClass = 'slider-item hidden-slide';
                        this.readyToSlide = true; //!!
                        this.intervalID = setInterval(this.nextSlideRight, 10000);
                    }, 1500);
                }
            },
        },

        beforeMount() {

            this.getData();
            this.slides[0].currentClass = 'slider-item';
            this.intervalID = setInterval(this.nextSlideRight, 10000);
            this.readyToSlide = true;
        }


    });
</script>