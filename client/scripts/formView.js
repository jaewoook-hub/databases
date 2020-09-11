var FormView = {

  $form: $('form'),

  initialize: function() {
    FormView.$form.on('submit', FormView.handleSubmit);
  },

  handleSubmit: function(event) {
    // Stop the browser from submitting the form
    event.preventDefault();
    console.log('handle submit function');

    var message = {
      username: App.username,
      message: FormView.$form.find('#message').val(),
      roomname: Rooms.selected || 'general'
    };

    Parse.create(message, (data) => {
      _.extend(message, data);
      Messages.add(message, MessagesView.render);
    });

    $.ajax({
      url: '127.0.0.1:3000/classes/messages',
      type: 'POST',
      data: message,
      contentType: 'application/json',
      success: function(error) {
        console.log(`<------------- SUCCESS CB on formView.js----------->`);
      },
      error: errorCB || function (error) {
        console.error('chatterbox: Failed to create message', error);
      }
    });

  },

  setStatus: function(active) {
    var status = active ? 'true' : null;
    FormView.$form.find('input[type=submit]').attr('disabled', status);
  }

};