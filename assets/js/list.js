// //상품리스트 넣기 js

// var list = document.getElementsByClassName('list');
// var num = 10;
// for(var i = 0; i < num; i++){
//     list[0].innerHTML += `
//         <div class="box alt">
// 			<!--목록-->
// 				<div class="row gtr-uniform">
// 					<div class="col-4">
//                         <span class="image fit" style="margin-bottom: 0;"><img src="test_image02.jpg" alt="" /></span>
//                         <div class="row gtr-uniform">
//                             <div class="col-11">
//                                 <p class="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
//                             </div>
//                             <div class="col-1" style="padding-left: 0;">
//                                 <i><br/></i>
//                                 <i class="like icon fa-heart" onclick="addLike(this);"></i>
//                             </div>
//                         </div>
// 					</div>
// 				    <div class="col-4">
//                         <span class="image fit" style="margin-bottom: 0;"><img src="test_image02.jpg" alt="" /></span>
//                         <div class="row gtr-uniform">
//                             <div class="col-11">
//                                 <p class="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
//                             </div>
//                             <div class="col-1" style="padding-left: 0;">
//                                 <i><br/></i>
//                                 <i class="like icon fa-heart" onclick="addLike(this);"></i>
//                             </div>
//                         </div>
// 					</div>
// 					<div class="col-4">
//                         <span class="image fit" style="margin-bottom: 0;"><img src="test_image02.jpg" alt="" /></span>
//                         <div class="row gtr-uniform">
//                             <div class="col-11">
//                                 <p class="info" style="text-align: left;">김길웅이 입은 반팔티<br/>34,900원</p>
//                             </div>
//                             <div class="col-1" style="padding-left: 0;">
//                                 <i><br/></i>
//                                 <i class="like icon fa-heart" onclick="addLike(this);"></i>
//                             </div>
//                         </div>
// 					</div>
// 				</div>
//         </div>
//     `;
// }

function addLike(obj){
    if(obj.style.color === "tomato"){
        obj.style.color = "#636363";
        obj.className = "like icon fa-heart";
        alert("찜 목록에서 제외되었습니다.");
    }
    else{
        obj.style.color = "tomato";
        obj.className = "like fas fa-heart"
        alert("찜 목록에 추가되었습니다!");
    }
}

function deleteLike(obj){
    alert("찜 목록에서 제외되었습니다.");
    var remove_object = obj.parentNode.parentNode.parentNode.parentNode;
    obj.parentNode.parentNode.parentNode.parentNode.parentNode.removeChild(remove_object);
}