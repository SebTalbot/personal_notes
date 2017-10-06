var ctx = null;
var size = 40;
var spriteList=[];

window.onload=function(){
    ctx = document.getElementById("canvas").getContext("2d")

	document.getElementById("canvas").onmousemove = function (e){
		spriteList.push(new Square(e.pageX-this.offsetLeft, e.pageY-this.offsetTop));
	}

    document.getElementById("canvas").onclick = function(e){
        var x = e.pageX - this.offsetLeft;
        var y = e.pageY - this.offsetTop;
        spriteList.push(new Square(x,y));
    }
    tick();
}

function tick(){
	//ctx.clearRect(0,0,650,650);
	spriteList.push(new Square(100,100));

    for(var i = 0; i<spriteList.length; i++){
        var alive = spriteList[i].tick();
		// Delete les sprites morts de la liste
        if(!alive){
            spriteList.splice(i,1);
        }
    }


    window.requestAnimationFrame(tick);
}


class Square{
    constructor(x,y)
    {
        this.x=x;
        this.y=y;
        this.opacity = 1.0;

    }
    tick(){
        var alive = true;
		var size = 5;
        this.opacity-=0.02
        
        if(this.opacity>0){
            ctx.fillStyle = "rgba(255,0,0,"+this.opacity+")";
            ctx.fillRect(this.x-size,this.y-size,size,size);
        }
        else{
            alive = false;
        }
        return this.opacity>0.02;
    }
    
}
