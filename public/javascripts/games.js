function add_new_player(group_id) {
  tmp = "do_add_new_player($('f').elements['new_player_name'].value,$('f').elements['new_player_email'].value,"+group_id+");";
  str = '<li id="new_edit"><input type="text" name="new_player_name" value="name"><input type="text" name="new_player_email" value="email"><input type="button" onclick="'+tmp+'" value="Add"></li>';
  $('player_list').insert({'bottom': str})
  $('new_player').hide();
}

function do_add_new_player(name,email,group_id) {
  ajax_eval('/game/add_new_player/'+group_id+'?name='+name+'&email='+email);
}

function display_new_player(str) {
  $('new_edit').replace(str);
  $('new_player').show();
}
