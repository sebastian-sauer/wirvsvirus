import Rails from "@rails/ujs";

window.Rails = Rails;
require("jquery-ui");

function JSON_to_URLEncoded(element, key, list) {
    var list = list || [];
    if (typeof (element) == 'object') {
        for (var idx in element){
            JSON_to_URLEncoded(element[idx], key ? key + '[' + idx + ']' : idx, list);
        }            
    } else {
        list.push(key + '=' + encodeURIComponent(element));
    }
    return list.join('&');
};

$(".sortable").sortable().bind("sortupdate", function (e, ui) {
    const line = $(this).sortable('toArray').toString();
    Rails.ajax({
        type: "post",
        url: "/line_admin/sort",
        data: JSON_to_URLEncoded({ list: line }),
        success: (pData) => {
            for(let data of pData){
                $($('tr#' + data.id).children('td').get(5)).text(data.estimatedWaitingTime);
            }            
        }
    });
});