// $ ->
//   $(".pro").click ->
//     $.ajax({
//       type: "POST",
//       url: "/details",
//       data: { detail: { name: "procon", description: "pro" } },
//       success:(data) ->
//         alert data.id
//         return false
//       error:(data) ->
//         return false
//     })