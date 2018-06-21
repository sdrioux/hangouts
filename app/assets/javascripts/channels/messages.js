App.messages = App.cable.subscriptions.create({
    channel: 'MessagesChannel'
  }, {
  received: function(data) {
    $("#messages").removeClass('hidden');

    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    var message =  "<p><div> <b>" + data.sender + ": </b>" + data.body + "</div>";

    message += "<div class='timestamp'>" + data.timestamp + "</div></p>";

    return message;
  }
});