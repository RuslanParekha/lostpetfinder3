/**
 * Created by ruslan on 30.03.17.
 */
function imgLoad()
{
    var strT = new String();
    document.getElementById("ShowImg").innerHTML= "";
    strT = document.ModReg.file1.value;
    if(strT != "")
    {
        strT = "<img ;id='Sample' src='" + strT + "' width='100' height='100'></img>";
        document.getElementById("ShowImg").innerHTML= strT;
        if(!LimitedSize())
        {
            alert("File Size is more than 100 KB");
            document.getElementById("ShowImg").innerHTML= "";
        }
    }
}

function LimitedSize()
{
    var i;
    var y = document.images;
    for (i=0;i<y.length;i++)
    {
        if((y[i].id) == 'Sample')
        {
            if(y[i].fileSize&nbsp> 102400)
            return false;
        }
    }
    return true;
}