//= require cable
//= require_self
//= require_tree .

function subscribe(hangoutId) {
    // need to manually prevent duplicate subscriptions.
  if (hangoutId && existingSubscription(hangoutId) === false) {
    App.messages = App.cable.subscriptions.create({
      channel: 'HangoutsChannel',
      hangout_id: hangoutId
    }, {
      received: function(data) {
        // prevent leaking messages from other subscriptions
        if(hangoutId === data.hangout_id) {
          $('#message_body').val('');

          return $('#messages').append(this._renderMessage(data));
        }
      },

      _renderMessage: function(data) {
        var message =  "<p><div> <b>" + data.sender + ": </b>" + data.body + "</div>";

        message += "<div class='timestamp'>" + data.timestamp + "</div></p>";

        return message;
      }
    });
  }
}

function existingSubscription(hangoutId) {
  return App.cable.subscriptions.subscriptions.some(function(subscription) {
    return subscription.identifier === `{"channel":"HangoutsChannel","hangout_id":${hangoutId}}`;
  });
}
