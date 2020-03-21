import Rails from "@rails/ujs";

window.Rails = Rails;
require("jquery-ui")

$(".sortable").sortable().bind("sortupdate", function (e, ui) {
    const line = $(this).sortable('toArray').toString();

    Rails.ajax({
        type: "post",
        url: "/line_admin/sort",
        data: JSON.stringify({list: line}),
    });
});