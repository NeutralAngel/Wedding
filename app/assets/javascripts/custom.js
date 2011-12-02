function copyName() {
  $("#rsvp_guests_attributes_0_name").val($("#rsvp_user_attributes_first_name").val());
  $("#rsvp_guests_attributes_0_name").attr("readonly", true);
}
