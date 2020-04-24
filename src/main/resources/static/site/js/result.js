$(function () {
    getChildren();

    function getChildren() {
        var id = $("#hidRecordId").val();
        $.ajax({
            type: "POST",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/api/getChildren", // 请求发送到TestServlet处
            data: {
                parentId:id
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    var str = "";
                    var length=data.details.length;
                    if(length>0){
                        $("#childFleets").show();
                    }
                    for (var i = 0; i < data.details.length; i++) {
                        var rId=data.details[i];
                        var hrHtml=$("#hidFleetButton").html();
                        hrHtml=hrHtml.replace(/#Number#/g,i+1);
                        hrHtml=hrHtml.replace("#RecordId#",rId);
                        hrHtml=hrHtml.replace("<tbody>","");
                        hrHtml=hrHtml.replace("</tbody>","");
                        $("#tbody").append(hrHtml)
                    }
                }
            }
        });
    }
});