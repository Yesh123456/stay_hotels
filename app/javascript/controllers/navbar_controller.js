import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {

  static targets = ['openUserInfo', 'userDropdown', 'mobileNavbarDrop', 'userMobileDropdown']

  connect() {
    console.log("Header Connected");

    this.openUserInfoTarget.addEventListener("click", (e)=>{
      openUserInfo(this.userDropdownTarget)
    } )

    this.mobileNavbarDropTarget.addEventListener("click", (e)=>{
      openUserInfo(this.userMobileDropdownTarget)
    } )
  
  }
}

function openUserInfo(element) {
  toggle(element).then(() => {
    console.log("Enter transition complete")
  })
}

// remove element when close
function closeUserInfo(element) {
  leave(element).then(() => {
    element.destroy();
  })
}

