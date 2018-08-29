$(document).ready(
    function(){
        $('.image').each(
            function (index, element) {
                var id = $(element).attr('image_id')
                $.ajax({
                        url: '/images/' + id,
                        method: 'GET',
                        dataType: 'JSON',
                        success: function (data) {
                            console.log(index)
                            if(data.url){
                                $(element).attr('src', data.url)
                            }
                        }
                    })
            })
    })