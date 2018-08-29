$.ajax({
    url: "/",
    dataType: "json",
    method: "GET",
    success: function(data) {
       $('.testimg').attr('src', data.url)
    }
})


$(document).ready(
    function(){
        console.log("ready!")
        $(".image").each(
            function(index, element) {
                // console.log(element)
                console.log($(element).attr("image_id"))
                $.ajax({
                    url:"/",
                    dataType: "json",
                    method:"GET",
                    success: function (data) {
                        $(element).attr("src", data.url)
                    }
                })
            })
    })