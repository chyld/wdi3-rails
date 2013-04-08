function show_new_task_form()
{
  $('#new_task').hide();
  $('.taskform').show();
  $('#create_task').show();
  $('#update_task').hide();
  $('#title').val('');
  $('#description').val('');
  var date = moment().format("MM/DD/YYYY");
  $('#duedate').val(date);
  $('#address').val('');
  $('#is_complete').removeAttr('checked');
  $('#title').focus();
}

function hide_task_form()
{
  $('#new_task').show();
  $('.taskform').hide();
}

function create_task()
{
  var priority_id = $('#priority_id').val();
  var title = $('#title').val();
  var description = $('#description').val();
  var duedate = $('#duedate').val();
  var is_complete = $('#is_complete').is(':checked');
  var address = $('#address').val();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks",
      data: {authenticity_token:token, 'task[priority_id]':priority_id, 'task[title]':title, 'task[description]':description, 'task[duedate]':duedate, 'task[is_complete]':is_complete, 'task[address]':address}
    }).done(process_task);

  return false;
}

function update_task()
{
  var priority_id = $('#priority_id').val();
  var title = $('#title').val();
  var description = $('#description').val();
  var duedate = $('#duedate').val();
  var is_complete = $('#is_complete').is(':checked');
  var address = $('#address').val();
  var token = $('input[name=authenticity_token]').val();
  var task_id = $('#task_id').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks/" + task_id,
      data: {_method:'put', authenticity_token:token, 'task[priority_id]':priority_id, 'task[title]':title, 'task[description]':description, 'task[duedate]':duedate, 'task[is_complete]':is_complete, 'task[address]':address}
    }).done(process_task);

  return false;
}

function edit_task()
{
  show_new_task_form();
  $('#create_task').hide();
  $('#update_task').show();

  var id = $(this).parent().siblings('.clear').prev().text();

  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/tasks/" + id,
    }).done(populate_task_form);

  return false;
}

function populate_task_form(task)
{
  $('#priority_id').val(task.priority.id);
  $('#title').val(task.title);
  $('#description').val(task.description);
  $('#duedate').val(task.duedate);

  if(task.is_complete)
    $('#is_complete').attr('checked', 'checked');
  else
    $('#is_complete').removeAttr('checked');

  $('#address').val(task.address);
  $('#task_id').val(task.id);
}

function complete_task()
{
  var id = $(this).parent().siblings('.clear').prev().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks/" + id + '/complete',
      data: {_method:'put', authenticity_token:token}
    }).done(process_task);
}

function delete_task()
{
  var id = $(this).parent().siblings('.clear').prev().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks/" + id,
      data: {_method:'delete', authenticity_token:token}
    }).done(remove_task);

  return false;
}

function remove_task(task)
{
  tasks = _.reject(tasks, function(t){return t.id == task.id;});
  sort_tasks();
  display_tasks();
}

function process_task(task)
{
  add_task_to_array(task);
  sort_tasks();
  display_tasks();
}

function add_task_to_array(task)
{
  tasks = _.reject(tasks, function(t){return t.id == task.id;});
  tasks.push(task);
}

function sort_tasks()
{
  group = _.chain(tasks).groupBy(function(t){return t.priority.value;}).map(function(t){return t;}).reverse().value();
  tasks = _.chain(group).map(function(tasks){return _.sortBy(tasks, function(task){return task.title;});}).flatten().value();
  completed = _.filter(tasks, function(task){return task.is_complete;});
  pending = _.difference(tasks, completed);
  tasks = _.union(pending, completed);
}

function display_tasks()
{
  clear_markers();
  $('ul#tasks').empty();
  _.each(tasks, display_task);
}

function display_task(task)
{
  add_marker(task.latitude, task.longitude, task.title);

  var li = $('<li>');

  var divA = $('<div>');
  divA.addClass('task');
  var checkbox = $('<input>');
  checkbox.attr('type', 'checkbox');
  if(task.is_complete)
    checkbox.attr('checked', 'checked');
  divA.append(checkbox);

  var div1 = $('<div>');
  div1.addClass('task color');
  div1.css('background-color', task.priority.color);

  var div2 = $('<div>');
  div2.addClass('task');
  var a1 = $('<a>');
  a1.addClass('delete_task button radius alert tiny');
  a1.text('Delete');
  a1.attr('href', '#');
  div2.append(a1);

  var div3 = $('<div>');
  div3.addClass('task');
  var a2 = $('<a>');
  a2.addClass('edit_task button radius tiny');
  a2.text('Edit');
  a2.attr('href', '#');
  div3.append(a2);

  var div4 = $('<div>');
  div4.addClass('task');
  div4.text(task.title);
  if(task.is_complete)
    div4.css('text-decoration', 'line-through');

  var div5 = $('<div>');
  div5.addClass('task hide');
  div5.text(task.id);
  var div6 = $('<div>');
  div6.addClass('clear');

  li.append([divA, div1, div2, div3, div4, div5, div6]);
  $('ul#tasks').append(li);

  hide_task_form();
}
