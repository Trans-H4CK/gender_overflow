/* jshint browser:true */

$(function() {
'use strict';

  var $ = window.$;
  var _ = window._;
  var goinstant = window.goinstant;

  var url = 'https://goinstant.net/12cd7623c112/my-application';

  var room;
  var user;
  var messagesKey;

  var $name = $('.chatName');
  var $text = $('.chatText');
  var $submit = $('.chatSubmit');
  var $messages = $('.messages tbody');
  var $room = $('.chatCategory').val();

  var connect = goinstant.connect(url);

  connect.then(function(result) {
    room = result.rooms[0];
    messagesKey = room.key($room);

    return room.self().get();

  }).then(function(result) {
    user = result.value;
    user.displayName = $name.val();

    var query = messagesKey.query({}, { sort: { 'submittedOn' : 'desc' }, limit: 10 });

    return query.execute();
  }).then(function(result) {
    var messages = result;

    _.eachRight(messages, function(message) {
      addMessage(message.value);
    });

  }).fin(function() {
    var options = {
      local: true,
      listener: addMessage
    };

    messagesKey.on('add', options);

    $text.on('keydown', handleKeyPress);
    $submit.on('click', handleSubmit)
    $name.on('keydown blur', handleName);
  });

  function formatDate (date) {

	  var dateString = date?new Date(date):"";
	  var dateFormatted = "";

	  if (dateString == "") return "";

	  var dd = dateString.getDate();
	  var mm = dateString.getMonth()+1;
	  var yyyy = dateString.getFullYear();
	  var hrs = dateString.getHours();
	  var mins = dateString.getMinutes();

	  mins = mins + (mins < 10 ? "0":"") + (hrs> 11 ? " PM":" AM");
	  hrs = (hrs == 0)?12:(hrs < 13)?hrs:hrs-12;

	  dateFormatted = mm + "/" + dd + "/" + yyyy + " " + hrs + ":" + mins;

	  return dateFormatted;
  }

  function addMessage(message) {
    //var $message = $('<li><div class="user-name"></div><div class="user-message"></div></li>');
	var $message = $('<tr><td><span class=\"user-name\"></span><br /></td><td><span class=\"submitted-on\"></span><span class="user-message"></span></td></tr>');
	var submissionDate = formatDate(message.submittedOn)

    $message.addClass('message');

    $message.children().first().children().first().text(message.name);

	if (submissionDate !== "") {
	    $message.children().eq(1).children().first().text(submissionDate);
    }

    $message.children().eq(1).children().eq(1).text(message.text);

    $messages.append($message);

    while ($messages.children().size() > 10) {
      $messages.children().first().remove();
    }

    $text.val('');
    _scrollBottom();
  }

  function handleKeyPress(event) {
    if (event.which == 13) {
      handleMessage();
    }
  }

  function handleSubmit(event) {
    handleMessage();
  }

  function handleMessage() {
    var message = {
      name: $name.val(),
      text: $text.val(),
	  submittedOn: new Date()
    };

    if (message.name === '' || message.text === '') {
      return;
    }

    messagesKey.add(message);
  }

  function handleName(event) {
    if (event.which !== 13 && event.type === 'keydown')  {
      return;
    }

    var name = $name.val();

    if (user.displayName === name) {
      return;
    }

    room.self().key('displayName').set(name);
    user.displayName = name;
  }

  function scrollBottom() {
    var properties = {
      scrollTop: $messages[0].scrollHeight
    };

    $messages.animate(properties, 'slow');
  }

  var _scrollBottom = _.debounce(scrollBottom, 100);
});