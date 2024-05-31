/*
 * Copyright 2024 Proofcraft Pty Ltd
 * SPDX-License-Identifier: BSD-2-Clause
 */

/* Menu showing/hiding for main site and mobile menus. No attempts at
   genericity, makes DOM and seL4.css class name assumptions. */


// global initialisation

const mobile_button = document.querySelector('.mobile-drop');
mobile_button.addEventListener("click", openMobileMenu);

const drop_buttons = document.querySelectorAll('.dropbtn');
for (var i = 0; i < drop_buttons.length; i++) {
  drop_buttons[i].addEventListener("click", openDropButton)
}

const drop_buttons_mobile = document.querySelectorAll('.dropbtn-mobile');
for (var i = 0; i < drop_buttons_mobile.length; i++) {
  drop_buttons_mobile[i].addEventListener("click", dropButtonMobileClick)
}

// end global init

function openMobileMenu(event) {
  event.stopPropagation();
  document.getElementById("mobile-menu").classList.add("mobile-on");
}

function firstParentWithClass(element, className) {
  if (element.classList && element.classList.contains(className)) {
    return element;
  }
  if (element.parentElement) {
    return firstParentWithClass(element.parentElement, className);
  }
  return null;
}

function openDropButton(event) {
  event.stopPropagation();
  var theButton = firstParentWithClass(event.target, 'dropbtn');
  var dropMenu = theButton.parentElement.getElementsByClassName('dropmenu')[0];
  var wasOn = dropMenu.classList.contains('on');

  var onElements = document.getElementsByClassName("on");
  for (var i = 0; i < onElements.length; i++) {
    onElements[i].classList.remove('on');
  }
  if (!wasOn) {
    dropMenu.classList.add("on");
  }
}

function dropButtonMobileClick(event) {
  event.stopPropagation();
  var theButton = firstParentWithClass(event.target, 'dropbtn-mobile');;
  var theSVG = theButton.lastElementChild;
  var dropMenu = theButton.nextElementSibling;
  var wasHidden= dropMenu.classList.contains('hidden');

  if (wasHidden) {
    dropMenu.classList.remove("hidden");
    theSVG.classList.add("rotate-180");
  }
  else {
    dropMenu.classList.add("hidden");
    theSVG.classList.remove("rotate-180");
  }
}

window.onclick = function(e) {
  // If this gets called, no button event listener was called,
  // because they all stop propagation.

  var onElements = document.getElementsByClassName("on");
  for (var i = 0; i < onElements.length; i++) {
    onElements[i].classList.remove('on');
  }
  document.getElementById("mobile-menu").classList.remove('mobile-on');
}
