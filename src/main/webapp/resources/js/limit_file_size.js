$(function(){
    $('form').submit(function(){
        var isOk = true;
        $('input[type=file][max-size]').each(function(){
            if(typeof this.files[0] !== 'undefined'){
                var maxSize = parseInt($(this).attr('max-size'),10),
                size = this.files[0].fileSize;
                isOk = maxSize > size;
                return isOk;
            }
        });
        return isOk;
    });
});
