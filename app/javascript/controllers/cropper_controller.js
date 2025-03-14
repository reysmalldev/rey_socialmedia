import { Controller } from "@hotwired/stimulus"
import Cropper from "cropperjs";
// Connects to data-controller="cropper"
export default class extends Controller {
  static targets = ["image", "user_avatar"]
  static cropper;
  connect() {
    this.createCropper()
  }

  handleAvatarUpload(event) {
    console.log("handlezoy")
    let file = event.target.files[0];

    if (file) {
      let reader = new FileReader();
      reader.onload = function (e) {
        document.querySelector('#image').src = e.target.result; // Set the image source
        // document.querySelector('cropper-canvas').classList.toggle('hidden')
        let img = document.querySelector('image')
      };
      reader.readAsDataURL(file);
    }


  }

  createCropper() {
    this.cropper = new Cropper(this.imageTarget, {
      template: "<cropper-canvas background>\n" +
          "  <cropper-image></cropper-image>\n" +
          "  <cropper-shade hidden></cropper-shade>\n" +
          "  <cropper-handle action=\"select\" plain></cropper-handle>\n" +
          "  <cropper-selection initial-coverage=\"0.5\" width=\"100\" height=\"100\" style=\"width: 100px; height: 100px;\">\n" +
          "    <cropper-grid role=\"grid\" bordered covered></cropper-grid>\n" +
          "    <cropper-crosshair centered></cropper-crosshair>\n" +
          "    <cropper-handle action=\"move\" theme-color=\"rgba(255, 255, 255, 0.35)\"></cropper-handle>\n" +
          "    <cropper-handle action=\"n-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"e-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"s-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"w-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"ne-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"nw-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"se-resize\"></cropper-handle>\n" +
          "    <cropper-handle action=\"sw-resize\"></cropper-handle>\n" +
          "  </cropper-selection>\n" +
          "</cropper-canvas>"
    })


  }

  getRoundedCanvas(sourceCanvas) {
    let canvas = document.querySelector('cropper-canvas');
    let context = canvas.getContext('2d');
    let width = sourceCanvas.width;
    let height = sourceCanvas.height;

    canvas.width = width;
    canvas.height = height;
    context.imageSmoothingEnabled = true;
    context.drawImage(sourceCanvas, 0, 0, width, height);
    context.globalCompositeOperation = 'destination-in';
    context.beginPath();
    context.arc(width / 2, height / 2, Math.min(width, height) / 2, 0, 2 * Math.PI, true);
    context.fill();
    return canvas;
  }

  postData() {

  }
}
