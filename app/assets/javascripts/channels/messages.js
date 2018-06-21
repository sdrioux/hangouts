App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');

    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    const message =  "<div><p> <b>" + data.sender + ": </b>" + data.body + "</p></div>";

    message.push("<div>" + data.timestamp + "</div>");

    return message;
  }
});