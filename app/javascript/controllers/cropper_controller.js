import { Controller } from "@hotwired/stimulus"

import Croppie from "croppie";

// Connects to data-controller="cropper"
export default class extends Controller {
  static targets = ["image", "avatar", "preview"];
  static cropper;
  connect() {
    console.log("connected cropper");
  }

  handleAvatarUpload(event) {
    this.hasFileAttached = true;

    let file = event.target.files[0];
    let url;

    if (file) {
      let reader = new FileReader();
      reader.onload = function (e) {
        url = e.target.result;
      };
      
      reader.readAsDataURL(file);
    }

    setTimeout(() => {
      this.croppie = new Croppie(this.previewTarget, {
        viewport: { width: 200, height: 200, type: "circle"  },
        boundary: { width: 200, height: 200 },
        showZoomer: false,
      })

      this.croppie.bind({
        url: url,
        orientation: 4
      });

      
    }, 100)

    this.previewTarget.classList.toggle("hidden");
  }


  postData(event) {
    if (this.hasFileAttached) {
      event.preventDefault();
      this.croppie.result('blob').then((blob) => {
        const croppedFile = new File([blob], "cropped_image.jpg", { type: "image/jpeg" });

        const dataTransfer = new DataTransfer();
        dataTransfer.items.add(croppedFile);
        this.avatarTarget.files = dataTransfer.files;

        event.target.submit()
      })
    }
  }
}
