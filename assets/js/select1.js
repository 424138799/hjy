var province1=$("#province1"),city1=$("#city1"),town1=$("#town1");
for(var i=0;i<provinceList.length;i++){
    addEle(province1,provinceList[i].name);
}
function addEle(ele,value){
    var optionStr="";
    optionStr="<option value="+value+">"+value+"</option>";
    ele.append(optionStr);
}
function removeEle(ele){
    ele.find("option").remove();
    var optionStar="<option value="+"请选择"+">"+"请选择"+"</option>";
    ele.append(optionStar);
}
var provinceText,cityText,cityItem;
province1.on("change",function(){
    provinceText=$(this).val();
    $.each(provinceList,function(i,item){
        if(provinceText == item.name){
            cityItem=i;
            return cityItem
        }
    });
    removeEle(city1);
    removeEle(town1);
    $.each(provinceList[cityItem].cityList,function(i,item){
        addEle(city1,item.name)
    })
});
city1.on("change",function(){
    cityText=$(this).val();
    removeEle(town1);
    $.each(provinceList,function(i,item){
        if(provinceText == item.name){
            cityItem=i;
            return cityItem
        }
    });
    $.each(provinceList[cityItem].cityList,function(i,item){
        if(cityText == item.name){
            for(var n=0;n<item.areaList.length;n++){
                addEle(town1,item.areaList[n])
            }
        }
    });
});