// $(document).on('ready turbolinks:load', function() {
      
//             var handler = StripeCheckout.configure({
//               key: '<%= Rails.configuration.stripe[:publishable_key] %>',
//               locale: 'auto',
//               //this is a call back which is called when handler gets open and finsish the modal
//               token: function(token) {   
//                 $('input#stripeToken').val(token.id);               
//                 $('form').submit();
//               }
//             });
//           document.getElementById('payNowButton').addEventListener('click', function(e) {
            
//               e.preventDefault();
//               // $('#error_explanation').html('');
//               var amount = parseInt($('#item_price').text().trim())   
//               amount = amount * 100; // Needs to be an integer!
//               handler.open({
//                 amount: Math.round(amount)
//               })
//             });

//             $(window).on('popstate', function() {
//               handler.close();
//             });
         
// });