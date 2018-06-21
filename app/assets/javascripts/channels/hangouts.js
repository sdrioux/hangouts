//= require cable
//= require_self
//= require_tree .

function subscribe(data) {
  var hangoutId = data.hangoutId;
  var senderId = data.senderId;
  var typingTimer;

    // need to manually prevent duplicate subscriptions.
  if (hangoutId && existingSubscription(hangoutId) === false) {
    App.messages = App.cable.subscriptions.create({
      channel: 'HangoutsChannel',
      hangout_id: hangoutId
    }, {
      received: function(data) {
        // prevent leaking messages from other subscriptions
        if(hangoutId !== data.hangout_id) {
          return;
        }

        if(data.message) {
          this._addMessage(data.message);
        } else if(data.typing && data.user_id != senderId) {
          this._addTypingNotification();
        }

      },

      typing: function() {
        this.perform('typing', { user_id: senderId });
      },

      _addMessage: function(data) {
        $('#message_body').val('');

        return $('#messages').append(this._renderMessage(data));
      },

      _renderMessage: function(data) {
        var message =  "<p><div> <b>" + data.sender + ": </b>" + data.body + "</div>";

        message += "<div class='timestamp'>" + data.timestamp + "</div></p>";

        return message;
      },

      _addTypingNotification() {
        clearTimeout(typingTimer);

        $('#typing-notifier').show();

        typingTimer = setTimeout(function() {
          $('#typing-notifier').hide();
        }, 2000);
      }
    });

    $("body").on("keypress", ".message-body", function() {
      App.messages.typing();
    });
  }
}

function existingSubscription(hangoutId) {
  return App.cable.subscriptions.subscriptions.some(function(subscription) {
    return subscription.identifier === `{"channel":"HangoutsChannel","hangout_id":${hangoutId}}`;
  });
}
