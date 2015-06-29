// (function() {

//   $.get("/api/djs", function(response) {
//     var first = true;
//     for (var key in response.data) {
//       if (!isNaN(key))
//       {

//         var dj = response.data[key];

//         if (first) {
//           var html = '<tr>';
//           for (var label in dj) {
//             html += '<th>' + label + '</th>';
//           }
//           html += '</tr>';
//           first = false;
//           $(".gui").append(html);
//         }

//         var html = '<tr>'
//         for (var thing in dj) {
//           html += '<td>' + dj[thing] + '</td>';
//         }
//         html += '</tr>';
//         $(".gui").append(html);
//       }
//     }
//   });

// /*
//   $.get("/api/djs/78", function(response) {
//     console.log(response);
//   });
// */
// }());