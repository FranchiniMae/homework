//client-side logic
var eatly = {};

eatly.createFood = function(e) {
  e.preventDefault();
  var food = $(e.target).serialize();
  $.post("/foods", food) 
    .done(function(res) {
      // OPTIMIZE: renders the entire dom eat time a food is created
      eatly.renderFood(res);
      //improve the createfood method
      //renderFood (singular method), use template again to append that new template
    })
    .fail(function(err) {
      console.log("Error:", err);
    });
};

// eatly.getFoods = function(callback) {
//   $.get("/foods")
//     .done(function(foods) {
//       var foods = JSON.parse(foods);
//       // execute the callback, passing in all the foods
//       callback(foods);
//     })
//     .fail(function(err) {
//       console.log("Error:", err);
//     });
// };

eatly.renderFoods = function(foods) {
  var $foodList = $("#food-list");
  // clear out existing foods out of the list
  $foodList.html("");
  // create the template
  var foodTemplate = Handlebars.compile($("#food-template").html());
  // pass the data into the template
  var compiledHTML = foodTemplate({foods: foods});
  // append the rendered html to the page
  $foodList.append(compiledHTML);
};

eatly.renderFood = function(food) {
  var food = JSON.parse(food);
  var $foodList = $("#food-list");
  // clear out existing foods out of the list
  var foodTemplate = Handlebars.compile($("#food-template").html());
  // pass the data into the template
  var compiledHTML = foodTemplate({foods: [food]});
  // append the rendered html to the page
  $foodList.prepend(compiledHTML);
};


eatly.deleteFood = function(e) {
  e.preventDefault();
  var foodId = $(e.target).parent(".food").attr("id");
  console.log(foodId);
  var ajaxOptions = {
    method: 'DELETE',
    url: '/foods/' + foodId,
    data: foodId,
    success: function () {
      $('[id='+ foodId + ']').remove();
    }
  };
  $.ajax(ajaxOptions);
};
