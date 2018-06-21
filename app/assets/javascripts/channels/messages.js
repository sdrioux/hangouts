App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');

    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    let message =  "<div><p> <b>" + data.sender + ": </b>" + data.body + "</p></div>";

    message += "<div class='timestamp'>" + data.timestamp + "</div>";

    return message;
  }
});