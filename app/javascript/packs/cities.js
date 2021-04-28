document.addEventListener("turbolinks:load", function(){
  var country = document.getElementById("profile_country");
  var state = document.getElementById("profile_state");

  country.addEventListener("change", function(){
    Rails.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function(){
    Rails.ajax({
      url: "/cities?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
})
