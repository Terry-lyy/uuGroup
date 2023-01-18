/*!
    * Start Bootstrap - SB Admin v7.0.5 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2022 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

document.addEventListener('DOMContentLoaded', function() {
  // 查找所有以 ${contextRoot}/edit/ 開頭的連結
  var editLinks = document.querySelectorAll('a[href^="${contextRoot}/edit/"]');
  // 對每個連結添加 click 事件處理器
  editLinks.forEach(function(link) {
    link.addEventListener('click', function(event) {
      // 阻止連結的預設行為
      event.preventDefault();
      // 取得連結的目標 URL
      var url = this.getAttribute('href');
      // 使用 window.open 打開新窗口
      window.open('/edit/{id}', '編輯', 'width=500,height=400');
    });
  });
});

