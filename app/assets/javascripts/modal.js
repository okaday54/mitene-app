'use strict';

$(function(){
  const modal_open = document.getElementById('modal_open');
  const mask = document.getElementById('mask');
  const modal_content = document.getElementById('modal_content');

  modal_open.addEventListener('click', () => {
    mask.classList.remove('aaa');
    modal_content.classList.remove('aaa');
  });

  mask.addEventListener('click', () => {
    mask.classList.add('aaa');
    modal_content.classList.add('aaa');
  });

  modal_content.addEventListener('click', () => {
    mask.click();
  });
});