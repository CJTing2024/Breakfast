let city = document.querySelector('#city');
let dist = document.querySelector('#district');

//json檔案讀取
var datas;
arrList=fetch('./js/tw_dist.json')
.then(response => response.json())
.then(result => {
    datas =result;
    let i = 0
    result.forEach(data => {
        addOption(city,data.name,data.name);
        i++;   
    });
});


// city.addEventListener('click',()=>{ 
//     datas.forEach(data => {
//         addOption(city,data.name,data.name)
//     });
// })
city.addEventListener('change',() => {
    //刪除之前選項
    dist.length=1;
    //新增dist選項
    //console.log(datas[city.selectedIndex-1].districts);
    datas[city.selectedIndex-1].districts.forEach(data =>{
        addOption(dist,data.name,data.name);
    })
})

//增加combobox選項
function addOption(list, text, value){
	let index=list.options.length;
	list.options[index]=new Option(text, value);
	//list.selectedIndex=index;
}

	

