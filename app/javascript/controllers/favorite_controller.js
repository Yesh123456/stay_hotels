import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("favorite controller connected")
  }
  update_favorite_list(){

    const user_logged_in = this.element.dataset.userLoggedIn

    if (user_logged_in == "false") {
      document.querySelector(".login").click();
      return
    } 

    if (this.element.dataset.status == "false") {
      this.create_favorite_property_list()
    } else {
      this.remove_favorite_property_list()
    }

  }

  create_favorite_property_list() {
    const params_data = {
      property_id: this.element.dataset.propertyId,
      user_id: this.element.dataset.userId
    }
    const options = {
      method: "POST",
      headers: {
       'Content-Type': "application/json", 
      },
      body: JSON.stringify(params_data)
    }
    console.log(options)
    fetch("/api/favorites", options)
    .then(response => {
      if (!response.ok) {
        console.log(response.message);
      } 
      return response.json();
    })
    .then(data => {
        console.log(data)
        this.element.dataset.favoriteId = data.id;
        this.element.classList.remove("fill-yellow-100")
        this.element.classList.add("fill-orange-600")
        this.element.dataset.status = "true"
    })

  }

  remove_favorite_property_list() {
    const options = {
      method: "Delete"
    }
    const favorite_id = this.element.dataset.favoriteId
    if (!favorite_id) {
      return
    }
    else {
      fetch("/api/favorites/"+favorite_id, options)
      .then(response => {
        this.element.dataset.favoriteId = ""
        this.element.classList.remove("fill-orange-600")
        this.element.classList.add("fill-yellow-100")
        this.element.dataset.status = "false"
      })
    }
  }
} 
