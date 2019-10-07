$(document).ready(function(){
  <% FoodItem.all.each do |food_item| %>
    let i=0;
    $("#food_item_<%= food_item.id %>_add").click(function(){
      i++;
      $("#food_item_<%= food_item.id %>_number").text(i);

      if(i>0){
        $("#food_item_<%= food_item.id %>_number").show();
      }
    });

    $("#food_item_<%= food_item.id %>_number").css({"color": "#3ff", "width": "30px"})

    $("#food_item_<%= food_item.id %>_remove").click(function(){
      if(i>0){
        i--;
        $("#food_item_<%= food_item.id %>_number").text(i);
      }

      if(i==0){
        $("#food_item_<%= food_item.id %>_number").hide();
      }
    });
  <% end %>
});